import 'package:flutter/material.dart';
import 'package:todo_app/database/db_provider.dart';
import './task_card.dart';

class TodoList extends StatelessWidget {
  final Function insertTask;
  final Function deleteTask;

  var db = DBProvider();
  TodoList({required this.insertTask, required this.deleteTask, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTask(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data; //data to show
          var datalength = data!.length;

          return ListView.builder(
            itemCount: datalength,
            itemBuilder: (context, i) => TaskCard(
              id: data[i].id,
              title: data[i].title,
              status: data[i].status,
              insertTask: insertTask,
              deleteTask: deleteTask,
            ),
          );
        },
      ),
    );
  }
}
