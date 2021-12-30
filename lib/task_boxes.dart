import 'package:flutter/material.dart';
import 'package:tackle_the_box/task_pages/allTasks.dart';
import 'package:tackle_the_box/task_thumbnail.dart';

class TaskDashboard extends StatefulWidget {
  const TaskDashboard({Key? key}) : super(key: key);

  @override
  TaskDashboardState createState() => TaskDashboardState();
}

class TaskDashboardState extends State<TaskDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Task Dashboard',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.yellow.shade800,
          elevation: 1,
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.black,
                Colors.grey.shade700,
                Colors.black,
              ])),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          "https://user-images.githubusercontent.com/73401649/147521955-b3e51be2-c08d-470a-9bbc-3aacd98cc0c8.gif"),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            "Flutter Curriculum Task",
                            style: (
                                 TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "amFOSS 2021",
                            style: (
                                TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const OptionsCreater()
            ],
          ),
        ));
  }
}

class OptionsCreater extends StatefulWidget {

  const OptionsCreater({Key? key}) : super(key: key);

  @override
  State<OptionsCreater> createState() => _OptionsCreaterState();
}

class _OptionsCreaterState extends State<OptionsCreater> {
  Items item1 = Items(
    title: "Adithya Rajendran",
    img: "assets/members/Adithya_Rajendran.jpg",
    taskdescription: "Tasks description",
    widName: const TaskOne(),
  );

  Items item2 = Items(
    title: "Akshaj S R",
    img: "assets/members/Akshaj _SR.jpeg",
    taskdescription: "Tasks description",
    widName: const TaskTwo(),
  );

  Items item3 = Items(
    title: "Amruth Ganesh JM",
    img: "assets/members/David_Veliath.png",
    taskdescription: "Tasks description",
    widName: const TaskThree(),
  );

  Items item4 = Items(
    title: "Anshuman Swain",
    img: "assets/members/Anshuman_Swain.jpg",
    taskdescription: "Tasks description",
    widName: const TaskFour(),
  );

  Items item5 = Items(
    title: "Chaithanya Kalyan",
    img: "assets/members/Chaithanya_Kalyan.jpg",
    taskdescription: "Tasks description",
    widName: const TaskFive(),
  );

  Items item6 = Items(
    title: "David Veliath",
    img: "assets/members/David_Veliath.png",
    taskdescription: "Tasks description",
    widName: const TaskSix(),
  );

  Items item7 = Items(
    title: "Gautham Krishnan",
    img: "assets/members/Gautham_Krishnan.png",
    taskdescription: "Tasks description",
    widName: const TaskSeven(),
  );

  Items item8 = Items(
    title: "Himanshu Lath",
    img: "assets/members/Himanshu_Lath.jpeg",
    taskdescription: "Tasks description",
    widName: const TaskEight(),
  );

  Items item9 = Items(
    title: "Justin Jiji",
    img: "assets/members/Justin_Jiji.png",
    taskdescription: "Tasks description",
    widName: const TaskNine(),
  );

  Items item10 = Items(
    title: "Manikandan M",
    img: "assets/members/Manikandan_M.png",
    taskdescription: "Tasks description",
    widName: const TaskTen(),
  );

  Items item11 = Items(
    title: "Manoj Sadanala",
    img: "assets/members/Manoj_Parasuram_Sadanala.jpg",
    taskdescription: "Tasks description",
    widName: const TaskEleven(),
  );

  Items item12 = Items(
    title: "Mohith Nair",
    img: "assets/members/Mohith_Nair.jpg",
    taskdescription: "Tasks description",
    widName: const TaskTwelve(),
  );

  Items item13 = Items(
    title: "N Rizwan",
    img: "assets/members/N_Rizwan.jpg",
    taskdescription: "Tasks description",
    widName: const TaskThirteen(),
  );

  Items item14 = Items(
    title: "Pooja Dileep",
    img: "assets/members/Pooja_Dileep.jpeg",
    taskdescription: "Tasks description",
    widName: const TaskFourteen(),
  );

  Items item15 = Items(
    title: "Pranav Krishnan",
    img: "assets/members/Pranav_Krishnan.jpg",
    taskdescription: "Tasks description",
    widName: const TaskFifteen(),
  );

  Items item16 = Items(
    title: "Prashanth_Chandra",
    img: "assets/members/Prashanth_Chandra.png",
    taskdescription: "Tasks description",
    widName: const TaskSixteen(),
  );

  Items item17 = Items(
    title: "Shiv Sanjay",
    img: "assets/members/Shiv_Sanjay.png",
    taskdescription: "Tasks description",
    widName: const TaskSeventeen(),
  );

  Items item18 = Items(
    title: "Siddharth Reddy",
    img: "assets/members/Siddharth_Reddy.jpg",
    taskdescription: "Tasks description",
    widName: const TaskEighteen(),
  );

  Items item19 = Items(
    title: "Tejasvin Vimal",
    img: "assets/members/Tejasvin_Vimal.jpg",
    taskdescription: "Tasks description",
    widName: const TaskNineteen(),
  );

  Items item20 = Items(
    title: "Yash Arora",
    img: "assets/members/Yash_Arora.jpg",
    taskdescription: "Tasks description",
    widName: const TaskTwenty(),
  );

  Items item21 = Items(
    title: "Aashraya Katiyar",
    img: "assets/members/Aashraya_Katiyar.jpg",
    taskdescription: "Tasks description",
    widName: const TaskTwentyOne(),
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15, item16, item17, item18, item19, item20, item21,];
    List<Widget> classname = [TaskOne(),];
    return Flexible(
        child:Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: myList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            itemBuilder: (context,index){
              return TaskThumbnail(task: myList[index]);
            },
          ),
        )
    );
  }
}

class Items {
  String title;
  String img;
  String taskdescription;
  Widget widName;
  Items(
      {
      required this.title,
      required this.img,
      required this.taskdescription,
      required this.widName,
      }
  );
}
