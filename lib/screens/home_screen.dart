import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/db/tasks_database.dart';
import 'package:todo/utils/cutsom_snackbar.dart';
import 'package:todo/utils/dialog_box.dart';
import 'package:todo/utils/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _hiveBox = Hive.box('tasks');
  final TasksList db = TasksList();
  final _controller = TextEditingController();

  @override
  void initState() {
    if (_hiveBox.get('TODOLIST') == null) {
      db.createIntialTasks();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index, BuildContext context) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
    db.todoList[index][1]
        ? popupSnackBar("Task Completed 🎉", Colors.teal, context)
        : popupSnackBar("Task Unmarked ❗️", Colors.orange.shade400, context);
  }

  void onTaskSave() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void creatNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: onTaskSave,
          onCancel: () => Navigator.of(context).pop(),
          content: 'Add New Task',
        );
      },
    );
  }

  void onTaskDelete(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });

    db.updateData();
  }

  void onTaskEdit(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: () {
              setState(() {
                db.todoList[index][0] = _controller.text;
              });
              _controller.clear();
              Navigator.of(context).pop();
            },
            onCancel: () => Navigator.of(context).pop(),
            content: 'Edit Task',
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text(
            'Todo',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: creatNewTask,
          child: const Icon(Icons.add_task),
        ),
        backgroundColor: Colors.indigo[200],
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.todoList[index][0],
              taskStatus: db.todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index, context),
              onDelete: (context) => onTaskDelete(index),
              onEdit: (context) => onTaskEdit(index),
            );
          },
        ));
  }
}
