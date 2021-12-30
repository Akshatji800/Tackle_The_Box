import 'package:flutter/material.dart';
import '../task_boxes.dart';

class TaskDescription extends StatelessWidget {
  final Items task;
  const TaskDescription({Key? key, required this.task,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Task Description'),
        backgroundColor: Colors.yellow.shade800,
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(task.title, style: const TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,),
              const SizedBox(height: 10,),
              Text(task.taskdescription, style: const TextStyle(color: Colors.black54, fontSize: 16),textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
