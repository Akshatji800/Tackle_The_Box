import 'package:flutter/material.dart';

class TaskFourteen extends StatefulWidget {
  const TaskFourteen({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}


class _TaskDashboardState extends State<TaskFourteen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task-14',
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