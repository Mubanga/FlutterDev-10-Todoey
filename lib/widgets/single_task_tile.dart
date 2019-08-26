import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task_data.dart';
import 'package:todoey_flutter/model/task_model.dart';

class SingleTaskTile extends StatelessWidget {
  final int index;
  final Function onTaskCheckedCallback;

  SingleTaskTile({@required this.index, @required this.onTaskCheckedCallback});

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TasksDataList>(context).taskList[index];
    return CheckboxListTile(
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
//        task.toggleComplete();
//        print("Task Is Now = ${task.isComplete}");
        onTaskCheckedCallback(value);

        /// Instead Of Having This In A Stateful Widget As It Were You Can Lift
        /// The State Up And Have This As A Stateless Widget That Just Takes In
        /// An Anonymous Function That Passes In The Value To Change The Underlying
        /// Model's "isComplete" Property.
//          setState(() {
//            print("Task Completed Was = ${_TaskList[ItemIndex].isComplete}");
//            _TaskList[ItemIndex].toggleComplete();
//            // _TaskList[ItemIndex].isComplete = value;
//            print("Task Completed Is Now = ${_TaskList[ItemIndex].isComplete}");
//          });
      },
    );
  }
}
