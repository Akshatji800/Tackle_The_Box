import 'package:flutter/material.dart';

class TaskEight extends StatefulWidget {
  const TaskEight({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}


class _TaskDashboardState extends State<TaskEight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task-8',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.yellow.shade800,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}