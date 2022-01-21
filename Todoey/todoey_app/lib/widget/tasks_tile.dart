// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  bool? isChecked;
  final String taskTitle;
  final ValueChanged<bool?> checkBoxCalllBack;
  final VoidCallback longPressCalllBack;


  TasksTile(
      {this.isChecked,
      required this.taskTitle,
      required this.checkBoxCalllBack, required this.longPressCalllBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCalllBack,
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked!
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        trailing: Checkbox(
            value: isChecked,
            activeColor: Colors.lightBlueAccent,
            onChanged: checkBoxCalllBack));
  }
}




