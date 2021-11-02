import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo_app/database/db_provider.dart';
import 'package:todo_app/listProvider/task_provider.dart';
import 'package:todo_app/model/task_model.dart';
import '../widget/todo_list.dart';
import './add_todo.dart';
import '../screen/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void addItem(Task task) async {
    await DBProvider.instance.insertTask(task);
  }

  void deleteItem(Task task) async {
    await DBProvider.instance.deleteTask(task);
  }

  void updateItem(Task task) async {
    await DBProvider.instance.updateTask(task);
  }

  @override
  void initState() {
    super.initState();
    DBProvider.instance.getTask().then((value) {
      context.read<TaskProvider>().multiTask(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingScreen(),
                )),
            icon: const Icon(Icons.settings),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddToDoPage(
                addItem: addItem,
              ),
            )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TodoList(
              insertTask: addItem,
              deleteTask: deleteItem,
              updateTask: updateItem,
            ),
          ],
        ),
      ),
    );
  }
}
