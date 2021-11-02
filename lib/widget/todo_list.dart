import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/listProvider/task_provider.dart';
import 'package:todo_app/model/task_model.dart';
import './task_card.dart';

class TodoList extends StatelessWidget {
  final Function insertTask;
  final Function deleteTask;
  final Function updateTask;

  const TodoList(
      {required this.insertTask,
      required this.deleteTask,
      required this.updateTask,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TaskProvider>(
        builder: (_, todos, __) {
          var data = todos.tasks; //data to show
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, i) => TaskCard(
              task: Task(
                id: data[i].id,
                title: data[i].title,
                status: data[i].status,
              ),
              insertTask: insertTask,
              deleteTask: deleteTask,
              updateTask: updateTask,
            ),
          );
        },
      ),
    );
  }
}
