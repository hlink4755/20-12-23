import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_learning/flutter_guys/widgets/base_app_bar.dart';


@RoutePage()
class HiveTodoPage extends StatefulWidget {
  const HiveTodoPage({super.key});

  @override
  State<HiveTodoPage> createState() => _HiveTodoPageState();
}

class _HiveTodoPageState extends State<HiveTodoPage> {

  final _nameController = TextEditingController();
  final _qualityController = TextEditingController();

  List<Map<String,dynamic>> _item = [];
  final _shoppingBox = Hive.box('shopping_box');

  _createItem(Map<String,dynamic> newItem) async {
    await _shoppingBox.add(newItem);
    print('amount data is ${_shoppingBox.length}');
    print('item data is ${_item.length}');
  }

  void _showForm(BuildContext ctx,int? itemKey) async {
    showModalBottomSheet(context: ctx,elevation: 0,isScrollControlled: true,builder: (context) {
      return Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom,top: 15,left: 15,right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            10.verticalSpace,
            TextFormField(
              controller: _qualityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Quality'),
            ),
            20.verticalSpace,
            ElevatedButton(onPressed: () {
              _createItem({
                "name": _nameController.text,
                "quantity" : _qualityController.text
              });
              context.popRoute();

            }, child: const Text('Create New'))
          ],
        ),
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: Text('Hive')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showForm(context,1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
