import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task_data.dart';
import 'package:todoey_flutter/model/task_model.dart';

class AddTasksScreen extends StatefulWidget {
  @override
  _AddTasksScreenState createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  String _taskName;
  final _textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _tasksList = Provider.of<TasksDataList>(context);
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
                autofocus: true,
                controller: _textEditController,
                textAlign: TextAlign.center,
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
                      _tasksList.addTask(Task(taskName: _taskName));
                      _textEditController.clear();
                      setState(() {});
                      print(
                          "AddTasksScreen Length = ${_tasksList.taskList.length}");
                      Navigator.pop(context);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
