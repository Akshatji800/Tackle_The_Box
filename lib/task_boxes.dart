import 'package:flutter/material.dart';
import 'package:tackle_the_box/task_pages/task1.dart';
import 'package:tackle_the_box/task_pages/task10.dart';
import 'package:tackle_the_box/task_pages/task11.dart';
import 'package:tackle_the_box/task_pages/task12.dart';
import 'package:tackle_the_box/task_pages/task13.dart';
import 'package:tackle_the_box/task_pages/task14.dart';
import 'package:tackle_the_box/task_pages/task15.dart';
import 'package:tackle_the_box/task_pages/task16.dart';
import 'package:tackle_the_box/task_pages/task17.dart';
import 'package:tackle_the_box/task_pages/task18.dart';
import 'package:tackle_the_box/task_pages/task19.dart';
import 'package:tackle_the_box/task_pages/task2.dart';
import 'package:tackle_the_box/task_pages/task20.dart';
import 'package:tackle_the_box/task_pages/task21.dart';
import 'package:tackle_the_box/task_pages/task3.dart';
import 'package:tackle_the_box/task_pages/task4.dart';
import 'package:tackle_the_box/task_pages/task5.dart';
import 'package:tackle_the_box/task_pages/task6.dart';
import 'package:tackle_the_box/task_pages/task7.dart';
import 'package:tackle_the_box/task_pages/task8.dart';
import 'package:tackle_the_box/task_pages/task9.dart';

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
          title: const Text(
            'Task \'s Dashboard',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.cyan,
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
          actions: const <Widget>[
          ],
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.cyan.shade700,
                Colors.cyan.shade300,
                Colors.cyanAccent
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
                height: 30,
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
  );

  Items item2 = Items(
    title: "Akshaj S R",
    img: "assets/members/Akshaj _SR.jpeg",
  );

  Items item3 = Items(
    title: "Amruth Kumar",
    img: "assets/members/Amruth_Kumar.jpg",
  );

  Items item4 = Items(
    title: "Anshuman Swain",
    img: "assets/members/Anshuman_Swain.jpg",
  );

  Items item5 = Items(
    title: "Chaithanya Kalyan",
    img: "assets/members/Chaithanya_Kalyan.jpg",
  );

  Items item6 = Items(
    title: "David Veliath",
    img: "assets/members/David_Veliath.png",
  );

  Items item7 = Items(
    title: "Gautham Krishnan",
    img: "assets/members/Gautham_Krishnan.png",
  );

  Items item8 = Items(
    title: "Himanshu Lath",
    img: "assets/members/Himanshu_Lath.jpeg",
  );

  Items item9 = Items(
    title: "Justin Jiji",
    img: "assets/members/Justin_Jiji.png",
  );

  Items item10 = Items(
    title: "Manikandan M",
    img: "assets/members/Manikandan_M.png",
  );

  Items item11 = Items(
    title: "Manoj Sadanala",
    img: "assets/members/Manoj_Parasuram_Sadanala.jpg",
  );

  Items item12 = Items(
    title: "Mohith Nair",
    img: "assets/members/Mohith_Nair.jpg",
  );

  Items item13 = Items(
    title: "N Rizwan",
    img: "assets/members/N_Rizwan.jpg",
  );

  Items item14 = Items(
    title: "Pooja Dileep",
    img: "assets/members/Pooja_Dileep.jpeg",
  );

  Items item15 = Items(
    title: "Pranav Krishnan",
    img: "assets/members/Pranav_Krishnan.jpg",
  );

  Items item16 = Items(
    title: "Prashanth_Chandra",
    img: "assets/members/Prashanth_Chandra.png",
  );

  Items item17 = Items(
    title: "Shiv Sanjay",
    img: "assets/members/Shiv_Sanjay.png",
  );

  Items item18 = Items(
    title: "Siddharth Reddy",
    img: "assets/members/Siddharth_Reddy.jpg",
  );

  Items item19 = Items(
    title: "Tejasvin Vimal",
    img: "assets/members/Tejasvin_Vimal.jpg",
  );

  Items item20 = Items(
    title: "Yash Arora",
    img: "assets/members/Yash_Arora.jpg",
  );

  Items item21 = Items(
    title: "Aashraya Katiyar",
    img: "assets/members/Aashraya_Katiyar.jpg",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15, item16, item17, item18, item19, item20, item21,];
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: const EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return InkWell(
              onTap: () {
                if (data.title == "Adithya Rajendran") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskOne()));
                } else if (data.title == "Akshaj S R") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskTwo()));
                }
                else if (data.title == "Amruth Kumar") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskThree()));
                }
                else if (data.title == "Anshuman Swain") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskFour()));
                }
                else if (data.title == "Chaithanya Kalyan") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskFive()));
                }
                else if (data.title == "David Veliath") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskSix()));
                }
                else if (data.title == "Gautham Krishnan") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskSeven()));
                }
                else if (data.title == "Himanshu Lath") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskEight()));
                }
                else if (data.title == "Justin Jiji") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskNine()));
                }
                else if (data.title == "Manikandan M") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskTen()));
                }
                else if (data.title == "Manoj Sadanala") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskEleven()));
                }
                else if (data.title == "Mohith Nair") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskTwelve()));
                }
                else if (data.title == "N Rizwan") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskThirteen()));
                }
                else if (data.title == "Pooja Dileep") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskFourteen()));
                }
                else if (data.title == "Pranav Krishnan") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskFifteen()));
                }
                else if (data.title == "Prashanth_Chandra") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskSixteen()));
                }
                else if (data.title == "Shiv Sanjay") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskSeventeen()));
                }
                else if (data.title == "Siddharth Reddy") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskEighteen()));
                }
                else if (data.title == "Tejasvin Vimal") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskNineteen()));
                }
                else if (data.title == "Yash Arora") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskTwenty()));
                }
                else if (data.title == "Aashraya Katiyar") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const TaskTwentyOne()));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 40,
                          offset: Offset(0, 8))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 100,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      data.title,
                      style: (
                          const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  Items(
      {required this.title,
        required this.img});
}
