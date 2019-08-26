import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/model/task_model.dart';
import 'package:todoey_flutter/screens/add_tasks_screen.dart';

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
    AddTasksScreen _buildAddTasksScreen = AddTasksScreen(
      tasksList: _TaskList,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => _buildAddTasksScreen).then((_) {
                setState(() {
                  _TaskList = _buildAddTasksScreen.getTaskList();
                });
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
                    "${_TaskList.length} Tasks",
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
                    //  shrinkWrap: true,
                    itemCount: _TaskList.length,
                    itemBuilder: (context, int ItemIndex) {
                      print("Building with length = ${_TaskList.length}");
                      return _buildSingleTask(ItemIndex);
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

  CheckboxListTile _buildSingleTask(int ItemIndex) {
    return CheckboxListTile(
      //controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.lightBlueAccent,
      value: _TaskList[ItemIndex].isComplete,
      title: Text(
        _TaskList[ItemIndex].taskName,
        style: TextStyle(
            fontSize: 20.0,
            decoration: _TaskList[ItemIndex].isComplete
                ? TextDecoration.lineThrough
                : null),
      ),
      onChanged: (value) {
        /// Instead Of Having This In A Stateful Widget As It Were You Can Lift
        /// The State Up And Have This As A Stateless Widget That Just Takes In
        /// An Anonymous Function That Passes In The Value To Change The Underlying
        /// Model's "isComplete" Property.
        setState(() {
          print("Task Completed Was = ${_TaskList[ItemIndex].isComplete}");
          _TaskList[ItemIndex].isComplete = value;
          print("Task Completed Is Now = ${_TaskList[ItemIndex].isComplete}");
        });
      },
    );
  }
}
