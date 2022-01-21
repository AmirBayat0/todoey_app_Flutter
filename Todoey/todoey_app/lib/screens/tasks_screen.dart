// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/model/task_data.dart';
import 'package:todoey_app/screens/add_tasks_screen.dart';
import 'package:todoey_app/screens/drawerScreen/about_scree.dart';
import 'package:todoey_app/screens/drawerScreen/setting_screen.dart';
import 'package:todoey_app/screens/drawerScreen/termsofuse_screen.dart';
import 'package:todoey_app/screens/notask.dart';
import 'package:todoey_app/widget/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  bool notask = true;
/*
Instagram: @CodeWithFlexz
Github: AmirBayat0
Youtube: Programming with Flexz
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => AddTasksScreen());
          notask = false;
        },
        backgroundColor: Colors.lightBlueAccent,
        elevation: 2,
        child: Icon(
          Icons.add,
        ),
      ),
      body: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: IconButton(
                      icon: Icon(
                        Icons.list,
                        size: 35,
                        color: Colors.lightBlueAccent,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Todoey",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " ${Provider.of<TaskData>(context).taskCount} Tasks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    )),
                child: notask ? NoTask() : TasksList(),
              ),
            ),
          ],
        );
      }),
    );
  }

  buildDrawer(context) {
    return Drawer(
      backgroundColor: Colors.lightBlueAccent,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: ListView(
          children: [
            buildListTile(
                text: "About",
                icon: Icons.info,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutScreen()));
                }),
            buildListTile(
                text: "Terms of use",
                icon: Icons.verified_user,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TermsOfUseScreen()));
                }),
            buildListTile(
                text: "setting",
                icon: Icons.settings,
                onTap: () {
                  
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingScreen()));
                }),
            SizedBox(
              height: 50,
            ),
            buildListTile(
                text: "Exit",
                icon: Icons.exit_to_app_rounded,
                onTap: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                }),
          ],
        ),
      ),
    );
  }

  buildListTile({
    required String text,
    required IconData icon,
    Function()? onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      title: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
      ),
      onTap: onTap,
    );
  }
}
