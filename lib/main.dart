import 'package:flutter/material.dart';
import 'package:todo_app/screen/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ToDo List',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
