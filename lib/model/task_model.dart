import 'package:flutter/material.dart';

class Task {
  String taskName;
  bool _isComplete;

  Task({@required this.taskName}) {
    _isComplete = false;
  }

  void toggleComplete() {
    _isComplete = !_isComplete;
  }

  bool get isComplete => _isComplete;
}
