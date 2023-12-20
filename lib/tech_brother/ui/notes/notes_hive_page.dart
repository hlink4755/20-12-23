import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_learning/flutter_guys/widgets/base_app_bar.dart';
import 'package:hive_learning/tech_brother/app_db/notes_response_store.dart';
import 'package:hive_learning/tech_brother/service/notes_service.dart';

@RoutePage()
class NotesHivePage extends StatefulWidget {
  const NotesHivePage({super.key});

  @override
  State<NotesHivePage> createState() => _NotesHivePageState();
}

class _NotesHivePageState extends State<NotesHivePage> {
  final box = NotesService.getData();

  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _descController.dispose();
    box.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          title: const Text('Notes Hive'),
          actions: [TextButton(onPressed: () {
            box.clear();
          }, child: const Text('Clear'))]),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {

          return ListView.builder(
            // itemCount: value.length,
            itemCount: value.values.length,
            // itemCount: box.values.length,


            itemBuilder: (context, index) {
              var todo = value.getAt(index);
              return Column(
                children: [
                  ListTile(

                    title: Text(value.get(index)?.tile ?? "Empty"),
                    // title: Text(value.values.toList()[index].tile.toString()),
                    subtitle: Text(box.get(index)?.desc.toString() ?? "Empty"),
                    trailing: IconButton(
                      onPressed: () {
                        // value.values.toList().removeAt(index);
                        box.deleteAt(index);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                  const Divider(height: 5,thickness: 1,endIndent: 10,indent: 10,)
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(
              "=============================${box.get(0)?.tile}==============");
          print(
              "=============================${box.get(1)?.tile}==============");
          print(
              "=============================${box.get(3)?.tile}==============");
          print(
              "=============================${box.get(2)?.tile}==============");
          print(
              "=============================${box.get(4)?.tile}==============");
          print(
              "=============================${box.values.length}==============");
          _showMyDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Notes'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: ListBody(
                children: <Widget>[
                  const Text('Would you like to add notes?'),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Name';
                      }
                    },
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  TextFormField(
                    controller: _descController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Description';
                      }
                    },
                    decoration: const InputDecoration(hintText: 'Description'),
                  )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  box.add(NotesResponseStore(
                      tile: _nameController.text, desc: _descController.text));
                  _nameController.clear();
                  _descController.clear();
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
