import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/model/task_model.dart';

class TasksDataList extends ChangeNotifier {
  List<Task> _TaskList = [
    Task(taskName: "Buy milk"),
    Task(taskName: "Buy eggs"),
    Task(taskName: "Buy detergent"),
  ];

  void addTask(Task newTask) {
    _TaskList.add(newTask);

    ///**N.B** When Changing State With ChangeNotifierProvider It Is Really Important
    ///That You Update All Listeners Of The Changes To The Underlying Model **N.B**
    notifyListeners();
  }

  /// This Will Most Definitely Throw An Exception If You Attempt To Add Or Manipulate
  /// The ListView In Any Way.
  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_TaskList);
  }

  void updateTask(Task currentTask) {
    currentTask.toggleComplete();

    ///**N.B** When Changing State With ChangeNotifierProvider It Is Really Important
    ///That You Update All Listeners Of The Changes To The Underlying Model **N.B**
    notifyListeners();
  }

  void deleteTask(int RemovedTaskIndex) {
    _TaskList.removeAt(RemovedTaskIndex);

    ///**N,B** When Changing State With ChangeNotifierProvider It Is Really Important
    ///That You Update All Listeners Of The Changes To The Underlying Model **N.B**
    notifyListeners();
  }
}
