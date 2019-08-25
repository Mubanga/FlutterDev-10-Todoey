import 'package:flutter/cupertino.dart';

class Task {
  String taskName;
  bool isComplete;

//  set isComplete(value) {
//    _isComplete = value;
//  }

  Task({@required this.taskName}) {
    isComplete = false;
  }
}
