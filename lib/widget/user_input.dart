import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';

class UserInput extends StatefulWidget {
  final Function insertTask; //receive addItem method
  const UserInput({required this.insertTask, Key? key}) : super(key: key);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final textController = TextEditingController();
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEEEEEE),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Add new task',
                  border: InputBorder.none,
                  errorText: validate ? 'Enter a task' : null,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                textController.text.isEmpty
                    ? validate = true
                    : validate = false;
              });
              if (validate == false) {
                var myTodo = Task(title: textController.text, status: false);
                widget.insertTask(myTodo);
                Navigator.pop(context);
              }
            },
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
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
