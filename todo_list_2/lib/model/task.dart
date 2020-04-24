import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Task {
  final String id;
  String description;
  DateTime dueDate;
  TimeOfDay dueTime;
  bool isDone;

  Task({
    @required this.id,
    @required this.description,
    this.dueDate,
    this.dueTime,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'content': description, 'date': dueDate, 'time': dueTime};
  }
}

