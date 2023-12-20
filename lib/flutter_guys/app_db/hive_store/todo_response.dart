

import 'package:hive/hive.dart';

part 'todo_response.g.dart';
@HiveType(typeId: 1)
class TodoResponse {

  @HiveField(0)
  String title = '';

  @HiveField(1,defaultValue: false)
  bool isCompleted = false;

  TodoResponse({required this.title,required this.isCompleted});
}