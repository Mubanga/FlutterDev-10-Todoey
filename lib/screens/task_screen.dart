import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task_data.dart';
import 'package:todoey_flutter/model/task_model.dart';
import 'package:todoey_flutter/screens/add_tasks_screen.dart';
import 'package:todoey_flutter/widgets/single_task_tile.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> _TaskList = [
    Task(taskName: "Buy milk"),
    Task(taskName: "Buy eggs"),
    Task(taskName: "Buy detergent"),
  ];

  @override
  Widget build(BuildContext context) {
    // AddTasksScreen _buildAddTasksScreen = AddTasksScreen();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => AddTasksScreen()).then((_) {
                print("BottomSheet Closed.........");
              });
            }),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /**
             * Todey Header
             */
            Padding(
              padding: EdgeInsets.only(
                  top: 50.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Todoey",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "${Provider.of<TasksDataList>(context).taskList.length} Tasks",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
            /**
             * Todey Task List
             */
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount:
                        Provider.of<TasksDataList>(context).taskList.length,
                    itemBuilder: (context, int ItemIndex) {
                      print(
                          "Building with length = ${Provider.of<TasksDataList>(context).taskList.length}");
                      return SingleTaskTile(
                          index: ItemIndex,
                          onTaskCheckedCallback: (isChecked) {
                            Provider.of<TasksDataList>(context).updateTask(
                                Provider.of<TasksDataList>(context)
                                    .taskList[ItemIndex]);
                          });
                    },
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
