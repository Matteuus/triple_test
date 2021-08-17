import 'package:mobx_triple/mobx_triple.dart';
import 'package:triple_test/model/todosModel.dart';
import 'package:triple_test/repository/todoRepository.dart';

class TodoStore extends MobXStore<Exception, List<TodoModel>>
    with MementoMixin {
  final TodoRepository repository;

  TodoStore({required this.repository}) : super([]);

  getAllTodos() async {
    setLoading(true);
    try {
      final list = await repository.fetchAllTodos();
      update(list as List<TodoModel>);
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

  getTodo(int id) async {
    setLoading(true);
    try {
      final todo = await repository.fetchTodo(id);
      List<TodoModel> todos = [];
      todos.add(todo!);
      update(todos);
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }
}
