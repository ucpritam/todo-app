import 'package:flutter/material.dart';
import 'package:todo_app/database/db_provider.dart';
import 'package:todo_app/model/task_model.dart';
import '../widget/user_input.dart';
import '../widget/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var db = DBProvider();

  void addItem(Task task) async {
    await db.insertTask(task);
    setState(() {});
  }

  void deleteItem(Task task) async {
    await db.deleteTask(task);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App'),
      ),
      body: Column(
        children: [
          TodoList(
            insertTask: addItem,
            deleteTask: deleteItem,
          ),
          UserInput(
            insertTask: addItem,
          ),
        ],
      ),
    );
  }
}
