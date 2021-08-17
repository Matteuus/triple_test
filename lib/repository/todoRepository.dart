import 'package:dio/dio.dart';
import 'package:triple_test/api/api.dart';
import 'package:triple_test/model/todosModel.dart';

class TodoRepository {
  Api api = Api(Dio());

  Future<List<TodoModel>?> fetchAllTodos() async {
    try {
      Response response = await api.dio.get('/todos');

      List<TodoModel> todos = [];
      response.data.forEach((t) => todos.add(TodoModel.fromJson(t)));

      return todos;
    } on DioError catch (e) {
      throw (e);
    }
  }

  Future<TodoModel>? fetchTodo(int id) async {
    try {
      Response response = await api.dio.get('/todos/$id');

      return TodoModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e);
    }
  }
}
