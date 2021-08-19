import 'package:flutter/material.dart';
import 'package:triple_test/repository/todoRepository.dart';
import 'package:triple_test/store/TodoStore.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final todo = TodoStore(repository: TodoRepository());
  @override
  void initState() {
    todo.getAllTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: todo.undo, icon: Icon(Icons.arrow_back_ios)),
          IconButton(onPressed: todo.redo, icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
      body: ScopedBuilder(
        store: todo,
        onLoading: (_) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey.shade300,
                child: Card(
                  child: ListTile(
                    title: Text(
                      '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        onState: (_, state) {
          return Container(
            child: ListView.builder(
              itemCount: todo.state.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(todo.state[index].id.toString()),
                    title: Text(todo.state[index].title!),
                    trailing: todo.state[index].completed!
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                  ),
                );
              },
            ),
          );
        },
        onError: (_, error) {
          return Text(error.toString());
        },
      ),
    );
  }
}
