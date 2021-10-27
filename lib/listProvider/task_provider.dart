import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void insertTask(Task task) {
    _tasks.add(task);
    print('inside addtask of task provider');
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  //used delete method for testing, will update later
  void updateTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
