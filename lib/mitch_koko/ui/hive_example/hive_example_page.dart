import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@RoutePage()
class HiveExamplePage extends StatefulWidget {
  const HiveExamplePage({super.key});

  @override
  State<HiveExamplePage> createState() => _HiveExamplePageState();
}

class _HiveExamplePageState extends State<HiveExamplePage> {

  final _mybox = Hive.box('myBox');

  void write() {
    _mybox.put(1, 'Sheikh');
  }
  void read() {
    print(_mybox.get(1));
  }
  void delete() {
    _mybox.delete(1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildElevatedButton(() {
              write();
            }, 'Write'),
            buildElevatedButton(() {
              read();
            }, 'Read'),
            buildElevatedButton(() {
              delete();
            }, 'Delete'),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(VoidCallback onPressed, String text) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
