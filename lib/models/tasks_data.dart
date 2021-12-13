import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TasksData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task('Buy milk'),
    Task('Buy goat'),
    Task('Buy CPU'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get tasksCount => _tasks.length;

  void addTask(String name) {
    _tasks.add(Task(name));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
