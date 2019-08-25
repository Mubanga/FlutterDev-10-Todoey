import 'package:flutter/material.dart';
import 'package:todoey_flutter/model/task_model.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> _TaskList = [
    Task(taskName: "Buy milk"),
    Task(taskName: "Buy eggs"),
    Task(taskName: "Buy detergent")
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.add),
            onPressed: () {}),
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
                    "12 Tasks",
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
                child: ListView.builder(
                  itemCount: _TaskList.length,
                  itemBuilder: (BuildContext context, int ItemIndex) {
                    return _buildSingleTask(
                        _TaskList[ItemIndex].taskName, ItemIndex);
                  },
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

  Widget _buildSingleTask(String TaskName, int ItemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: CheckboxListTile(
        //controlAffinity: ListTileControlAffinity.leading,
        value: _TaskList[ItemIndex].isComplete,
        title: Text(
          _TaskList[ItemIndex].taskName,
          style: TextStyle(fontSize: 20.0),
        ),
        onChanged: (value) {
          setState(() {
            print("Task Completed Was = ${_TaskList[ItemIndex].isComplete}");
            _TaskList[ItemIndex].isComplete = value;
            print("Task Completed Is Now = ${_TaskList[ItemIndex].isComplete}");
          });
        },
      ),
    );
  }
}
