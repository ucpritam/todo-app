import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo_app/listProvider/task_provider.dart';
import 'package:todo_app/model/task_model.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Function insertTask;
  final Function deleteTask;
  final Function updateTask;

  const TaskCard(
      {required this.task,
      required this.insertTask, //change in checkbox
      required this.deleteTask, //delete button
      required this.updateTask,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  task.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Checkbox(
            value: task.status,
            onChanged: (bool? value) {
              task.status = value ?? false;
              updateTask(task);
              context.read<TaskProvider>().updateTask(task);
            },
          ),
        ),
        IconButton(
          onPressed: () {
            deleteTask(task);
            context.read<TaskProvider>().deleteTask(task);
          },
          icon: const Icon(Icons.delete_forever),
        )
      ],
    ));
  }
}
