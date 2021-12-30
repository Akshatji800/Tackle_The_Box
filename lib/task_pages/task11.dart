import 'package:flutter/material.dart';

class TaskEleven extends StatefulWidget {
  const TaskEleven({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}


class _TaskDashboardState extends State<TaskEleven> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task-11',
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