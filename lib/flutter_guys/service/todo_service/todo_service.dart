import 'package:hive/hive.dart';
import 'package:hive_learning/flutter_guys/app_db/hive_store/todo_response.dart';

class TodoService {
  final String _boxName = 'todoBox';
  Future<Box<TodoResponse>> get _box async => await Hive.openBox<TodoResponse>(_boxName);

  Future addTodo(TodoResponse newTodo) async {
    var box = await _box;
    await box.add(newTodo);
  }

  Future<List<TodoResponse>> getTodo() async {
    var box = await _box;
    return box.values.toList();
  }

  Future deleteTodo(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }

  Future updateTodo(TodoResponse updatedTodo,int index) async {
    var box = await _box;
    updatedTodo.isCompleted = !updatedTodo.isCompleted;
    await box.putAt(index, updatedTodo);
  }
}