import 'package:json_annotation/json_annotation.dart';

part 'todosModel.g.dart';

@JsonSerializable(explicitToJson: true)
class TodoModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoModel({this.userId, this.id, this.title, this.completed});

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TodoListModel {
  List<TodoModel>? todos;

  TodoListModel({this.todos});

  factory TodoListModel.fromJson(Map<String, dynamic> json) =>
      _$TodoListModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoListModelToJson(this);
}
