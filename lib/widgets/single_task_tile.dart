import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task_data.dart';

class SingleTaskTile extends StatelessWidget {
  final int index;
  final Function onTaskCheckedCallback;

  SingleTaskTile({@required this.index, @required this.onTaskCheckedCallback});

  @override
  Widget build(BuildContext context) {
    final taskList = Provider.of<TasksDataList>(context).taskList;
    final task = taskList[index];
    return GestureDetector(
      onLongPress: () {
        /// Delete Task. Should Probably Bring Up An AlertDialogue Here With Confirm
        /// Yes Or No? Kind Of Thing.
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  "Delete Task",
                  style: TextStyle(fontSize: 30.0),
                ),
                content: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.title,
                    children: <TextSpan>[
                      TextSpan(
                          text: "Are You Sure You Want To Delete ",
                          style: TextStyle(fontSize: 20)),
                      TextSpan(
                          text: "${task.taskName}",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      TextSpan(text: " ?", style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
//                content: Text(
//                  "Are You Sure You Want To Remove ${task.taskName} Task?",
//                  style: TextStyle(fontSize: 20.0),
//                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Provider.of<TasksDataList>(context).deleteTask(index);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "YES",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "NO",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ],
              );
            });
      },
      child: CheckboxListTile(
        //controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.lightBlueAccent,
        value: task.isComplete,
        title: Text(
          task.taskName,
          style: TextStyle(
              fontSize: 20.0,
              decoration: task.isComplete ? TextDecoration.lineThrough : null),
        ),
        onChanged: (value) {
          print("Toggling Checkbox Now..... Index = $index");
          onTaskCheckedCallback(value);
        },
      ),
    );
  }
}
