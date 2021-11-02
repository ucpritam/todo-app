import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void insertTask(Task task) {
    _tasks.insert(0, task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.removeWhere((element) => element.id == task.id);
    notifyListeners();
  }

  void updateTask(Task task) {
    int index = _tasks.indexWhere((element) => element.id == task.id);
    _tasks[index].status = !_tasks[index].status;
    notifyListeners();
  }

  void multiTask(List<Task> val) {
    _tasks = val;
    notifyListeners();
  }
}
