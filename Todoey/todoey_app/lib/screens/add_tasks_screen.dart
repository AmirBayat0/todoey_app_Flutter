// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoey_app/model/task_data.dart';

class AddTasksScreen extends StatelessWidget {
    late String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add Tasks",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  cursorHeight: 25.0,
                  onChanged: (newTask) {
                    newTaskTitle = newTask;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  
                  Provider.of<TaskData>(context,listen: false).addTasks(newTaskTitle);
                  Navigator.pop(context);
                },
                color: Colors.lightBlueAccent,
                minWidth: 250,
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
