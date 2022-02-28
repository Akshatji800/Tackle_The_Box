import 'package:flutter/material.dart';
import '../task_boxes.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Text(task.taskTitle, style: const TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,),
              const SizedBox(height: 10,),
              Text(task.taskdescription, style: const TextStyle(color: Colors.black54, fontSize: 16),textAlign: TextAlign.center),
              const SizedBox(height: 10,),
              const Text('To view a demo implementation of fetching food data from Nutritionix API and displaying a table and a graph based on the data', style: TextStyle(color: Colors.black54, fontSize: 16),textAlign: TextAlign.center),
              Center(
                child: InkWell(
                    child: const Text('Click Here', style: TextStyle(color: Colors.red, fontSize: 16),textAlign: TextAlign.center),
                    onTap: () => launch('https://drive.google.com/file/d/19EnXQ8-XCCZ7VNFPatXNVhJmNIWgye0z/view?usp=drivesdk')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
