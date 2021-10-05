import 'package:flutter/material.dart';
import 'package:todo_app/database/db_provider.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/screen/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = DBProvider();

  await db.insertTask(Task(id: 1, title: 'cricket', status: false));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ToDo List',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
