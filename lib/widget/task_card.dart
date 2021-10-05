import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final int id;
  final String title;
  bool status;
  final Function insertTask;

  TaskCard(
      {required this.id,
      required this.title,
      required this.status,
      required this.insertTask,
      Key? key})
      : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
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
              setState(() {
                widget.status = value!;
              });
            },
          ),
        ),
      ],
    ));
  }
}