import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';

class UserInput extends StatelessWidget {
  var textController = TextEditingController();
  final Function insertTask; //receive addItem method
  UserInput({required this.insertTask, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEEEEEE),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'Add new task',
                border: InputBorder.none,
              ),
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              var myTodo = Task(title: textController.text, status: false);
              insertTask(myTodo);
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
