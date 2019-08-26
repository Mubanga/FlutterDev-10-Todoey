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
    );
  }

//  Widget _buildBottomSheet() {
//    TextEditingController _textEditController = TextEditingController();
//    String _taskName;
//    return Container(
//      color: Color(0xff757575),
//      child: Container(
//        decoration: BoxDecoration(
//            color: Colors.white,
//            borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(20.0),
//                topRight: Radius.circular(20.0))),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            SizedBox(
//              height: 20,
//            ),
//            /**
//             *  Title:
//             */
//            Text(
//              "Add Title",
//              style: TextStyle(
//                  color: Colors.blue,
//                  fontSize: 35.0,
//                  fontWeight: FontWeight.bold),
//            ),
//            SizedBox(
//              height: 10,
//            ),
//            /**
//             * TextField (EditText)
//             */
//            SizedBox(
//              width: MediaQuery.of(context).size.width - 100,
//              child: TextField(
//                /// ***N.B*** Always Align Your Text In Some Way Here ***N.B***
//                textAlign: TextAlign.center,
//                //  autofocus: true,
//                //     controller: _textEditController,
//                onChanged: (newTaskName) {
//                  _taskName = newTaskName;
//                },
//                style: TextStyle(
//                  fontSize: 15,
//                ),
//              ),
//            ),
//            SizedBox(
//              height: 25,
//            ),
//            Flexible(
//              child: SizedBox(
//                width: 300,
//                height: 50,
//                child: RaisedButton(
//                    child: Text(
//                      "Add",
//                      style: TextStyle(fontSize: 16.0, color: Colors.white),
//                    ),
//                    color: Colors.blue,
//                    onPressed: () {
//                      _TaskList.add(Task(taskName: _taskName));
//                      //  _textEditController.clear();
//                    }),
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
}
