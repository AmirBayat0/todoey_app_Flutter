// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors,, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:todoey_app/widget/tasks_tile.dart';
import 'package:provider/provider.dart';
import '../model/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (BuildContext context, int index) {
              final task = taskData.task[index];
              return TasksTile(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkBoxCalllBack: (bool? checkBoxState) {
                    if (checkBoxState != null) {
                     taskData.updatesTask(task);
                    }
                  }, longPressCalllBack: () { 
                    taskData.deletTask(task);
                   },);
            });
      },
    );
  }
}
