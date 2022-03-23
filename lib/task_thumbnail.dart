import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tackle_the_box/task_boxes.dart';
import 'package:tackle_the_box/task_pages/task_description.dart';
import 'package:tackle_the_box/solution.dart';

class TaskThumbnail extends StatelessWidget {
  final Items task;
  const TaskThumbnail({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                child: Image.asset('${task.img}', fit: BoxFit.cover,),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 3,),
            Text(task.title),
            const SizedBox(height: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => TaskDescription(task: task)
                    ));
                  },
                  child: Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Task", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 3,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Solution()
                    ));
                  },
                  child: Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Solution", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold,color: Colors.white),)
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
