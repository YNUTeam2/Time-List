import 'package:flutter/material.dart';

class Task {
  String title;
  String? moreInfo;
  DateTime? date;
  Color color = Colors.blue;
  bool isDone = false;
  int usedTime = 0;

  Task.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        moreInfo = json['moreInfo'] as String?,
        date = json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        color =
            json['color'] == null ? Colors.blue : Color(json['color'] as int),
        isDone = json['isDone'] as bool,
        usedTime = json['usedTime'] as int;
  Task.simple(this.title, [this.moreInfo, this.date]);
  Task.all(this.title, this.color, [this.moreInfo, this.date]);
}

class TaskModel extends ChangeNotifier {
  List<Task> _tasks = [];

  Task getByIndex(int index) => _tasks[index];

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}
