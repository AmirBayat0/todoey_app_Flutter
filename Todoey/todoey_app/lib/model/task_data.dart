// ignore_for_file: unused_local_variable, prefer_final_fields

import 'package:flutter/widgets.dart';

import 'package:flutter/foundation.dart';
import 'package:todoey_app/model/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get task {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTasks(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updatesTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deletTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
