import 'package:flutter/material.dart';
import 'package:todoey_flutter/model/task_model.dart';

class AddTasksScreen extends StatefulWidget {
  final List<Task> tasksList;

  AddTasksScreen({this.tasksList});

  @override
  _AddTasksScreenState createState() => _AddTasksScreenState();

  List<Task> getTaskList() {
    print("getter AddTasksScreen Task List Length = ${tasksList.length}");
    return tasksList;
  }
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  String _taskName;
  final _textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            /**
             *  Title:
             */
            Text(
              "Add Title",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            /**
             * TextField (EditText)
             */
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: TextField(
                /// ***N.B*** Always Align Your Text In Some Way Here ***N.B***
                controller: _textEditController,
                textAlign: TextAlign.center,
                //  autofocus: true,
                //     controller: _textEditController,
                onChanged: (newTaskName) {
                  _taskName = newTaskName;
                },
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Flexible(
              child: SizedBox(
                width: 300,
                height: 50,
                child: RaisedButton(
                    child: Text(
                      "Add",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      widget.tasksList.add(Task(taskName: _taskName));
                      _textEditController.clear();
                      setState(() {});
                      print(
                          "AddTasksScreen Length = ${widget.tasksList.length}");
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
