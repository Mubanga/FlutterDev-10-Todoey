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
        onTaskCheckedCallback(value);
      },
    );
  }
}
