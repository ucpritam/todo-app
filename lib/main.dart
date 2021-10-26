import 'package:flutter/material.dart';
import 'package:todo_app/listProvider/task_provider.dart';
import 'package:todo_app/screen/homepage.dart';
import 'package:provider/provider.dart';
import './theme/mode.dart';
import './theme/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: Consumer<ThemeProvider>(builder: (_, value, __) {
        return MaterialApp(
          theme: Mode.themeData(value.darkTheme),
          title: 'ToDo List',
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      }),
    );
  }
}
