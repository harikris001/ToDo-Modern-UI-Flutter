

import 'package:hive_flutter/hive_flutter.dart';

class TasksList {
  List todoList = [];

  final _db = Hive.box('tasks');

  void createIntialTasks () {
    todoList = [
      ['Wake up Early', false],
      ['Workout', false],
    ];
  }

  void loadData () {
    todoList = _db.get('TODOLIST');
  }

  void updateData () {
    _db.put('TODOLIST', todoList);
  }
}
