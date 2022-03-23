import 'package:flutter/material.dart';
import 'package:tackle_the_box/task-9/ui/main_page.dart';

class TaskNine extends StatefulWidget {
  const TaskNine({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskNine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task-9',
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.blue.shade100.withOpacity(.3),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
    
      ),
      body: MainPage(),
    );
  }
}
