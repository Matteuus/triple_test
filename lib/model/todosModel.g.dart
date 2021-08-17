// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todosModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) {
  return TodoModel(
    userId: json['userId'] as int?,
    id: json['id'] as int?,
    title: json['title'] as String?,
    completed: json['completed'] as bool?,
  );
}

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };

TodoListModel _$TodoListModelFromJson(Map<String, dynamic> json) {
  return TodoListModel(
    todos: (json['todos'] as List<dynamic>?)
        ?.map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TodoListModelToJson(TodoListModel instance) =>
    <String, dynamic>{
      'todos': instance.todos?.map((e) => e.toJson()).toList(),
    };
