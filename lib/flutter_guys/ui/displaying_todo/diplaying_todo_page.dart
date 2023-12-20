import 'dart:ffi';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_learning/flutter_guys/app_db/hive_store/todo_response.dart';
import 'package:hive_learning/flutter_guys/widgets/base_app_bar.dart';
import 'package:hive_learning/main.dart';

@RoutePage()
class DisplayingTodoPage extends StatefulWidget {
  const DisplayingTodoPage({super.key});

  @override
  State<DisplayingTodoPage> createState() => _DisplayingTodoPageState();
}

class _DisplayingTodoPageState extends State<DisplayingTodoPage> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: Text('Todo List'),),
      body: FutureBuilder(
        future: todoService.getTodo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ValueListenableBuilder(
              valueListenable: Hive.box<TodoResponse>('todoBox').listenable(),
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.values.length,
                  itemBuilder: (context, index) {
                    var todo = value.getAt(index);
                    return ListTile(
                      title: Text(todo?.title ?? "Empty"),
                      leading: Checkbox(
                        value: todo?.isCompleted ?? false,
                        onChanged: (value) {
                          todoService.updateTodo(todo!, index);
                        },
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          todoService.deleteTodo(index);
                        },
                        icon: const Icon(
                          Icons.delete
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMyDialog();
        },
        backgroundColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        child: const Icon(Icons.add,color: Colors.white),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Todo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _controller,
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Write Something';
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () async {
                if(_formKey.currentState!.validate()) {
                  await todoService.addTodo(TodoResponse(title: _controller.text, isCompleted: false));
                  Navigator.of(context).pop();
                }
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
