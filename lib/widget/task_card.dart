import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';

class TaskCard extends StatefulWidget {
  final int id;
  final String title;
  final bool status;
  final Function insertTask;
  final Function deleteTask;
  final Function updateTask;

  const TaskCard(
      {required this.id,
      required this.title,
      required this.status,
      required this.insertTask, //change in checkbox
      required this.deleteTask, //delete button
      required this.updateTask,
      Key? key})
      : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    //local todo
    var myTask =
        Task(id: widget.id, title: widget.title, status: widget.status);

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
                  widget.title,
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
            value: widget.status,
            onChanged: (bool? value) {
              // setState(() {
              //   widget.status = value!;
              // });

              myTask.status = value!;
              widget.updateTask(myTask);
            },
          ),
        ),
        IconButton(
          onPressed: () {
            widget.deleteTask(myTask);
          },
          icon: const Icon(Icons.delete_forever),
        )
      ],
    ));
  }
}
