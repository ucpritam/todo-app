import 'package:flutter/material.dart';
import '../widget/user_input.dart';

class AddToDoPage extends StatefulWidget {
  final Function addItem;
  const AddToDoPage({required this.addItem, Key? key}) : super(key: key);

  @override
  _AddToDoPageState createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add To Do'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            UserInput(
              insertTask: widget.addItem,
            ),
          ],
        ),
      ),
    );
  }
}
