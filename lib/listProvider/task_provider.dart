import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = List.empty();

  List<Task> get tasks => tasks;

  void insertTask(Task task) {
    _tasks.add(task);
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
