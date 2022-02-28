import 'package:flutter/material.dart';
import 'package:tackle_the_box/task_pages/allTasks.dart';
import 'package:tackle_the_box/task_pages/task22.dart';
import 'package:tackle_the_box/task_pages/task23.dart';
import 'package:tackle_the_box/task_pages/task24.dart';
import 'package:tackle_the_box/task_pages/task25.dart';
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
  static const String spotifyTask = 'Use spotify API to fetch data about the playlists you love and display the details of those playlists in a table format. Also, make a graph comparing the number of likes, total number of songs.';
  Items item1 = Items(
    title: "Adithya Rajendran",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Adithya_Rajendran.jpg",
    taskdescription: spotifyTask,
    widName: const TaskOne(),
  );

  Items item2 = Items(
    title: "Akshaj S R",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Akshaj _SR.jpeg",
    taskdescription: spotifyTask,
    widName: const TaskTwo(),
  );

  Items item3 = Items(
    title: "Gaurav Sharma",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Gaurav_Sharma.jpg",
    taskdescription: spotifyTask,
    widName: const TaskThree(),
  );

  Items item4 = Items(
    title: "Anshuman Swain",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Anshuman_Swain.jpg",
    taskdescription: spotifyTask,
    widName: const TaskFour(),
  );

  Items item5 = Items(
    title: "Chaithanya Kalyan",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Chaithanya_Kalyan.jpg",
    taskdescription: spotifyTask,
    widName: const TaskFive(),
  );

  Items item6 = Items(
    title: "David Veliath",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/David_Veliath.png",
    taskdescription: spotifyTask,
    widName: const TaskSix(),
  );

  Items item7 = Items(
    title: "Gautham Krishnan",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Gautham_Krishnan.png",
    taskdescription: spotifyTask,
    widName: const TaskSeven(),
  );

  Items item8 = Items(
    title: "Himanshu Lath",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Himanshu_Lath.jpeg",
    taskdescription: spotifyTask,
    widName: const TaskEight(),
  );

  Items item9 = Items(
    title: "Justin Jiji",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Justin_Jiji.png",
    taskdescription: spotifyTask,
    widName: const TaskNine(),
  );

  Items item10 = Items(
    title: "Manikandan M",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Manikandan_M.png",
    taskdescription: spotifyTask,
    widName: const TaskTen(),
  );

  Items item11 = Items(
    title: "Manoj Sadanala",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Manoj_Parasuram_Sadanala.jpg",
    taskdescription: spotifyTask,
    widName: const TaskEleven(),
  );

  Items item12 = Items(
    title: "Mohith Nair",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Mohith_Nair.jpg",
    taskdescription: spotifyTask,
    widName: const TaskTwelve(),
  );

  Items item13 = Items(
    title: "N Rizwan",
    taskTitle: "",
    img: "assets/members/N_Rizwan.jpg",
    taskdescription: spotifyTask,
    widName: const TaskThirteen(),
  );

  Items item14 = Items(
    title: "Pooja Dileep",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Pooja_Dileep.jpeg",
    taskdescription: spotifyTask,
    widName: const TaskFourteen(),
  );

  Items item15 = Items(
    title: "Pranav Krishnan",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Pranav_Krishnan.jpg",
    taskdescription: spotifyTask,
    widName: const TaskFifteen(),
  );

  Items item16 = Items(
    title: "Prashanth_Chandra",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Prashanth_Chandra.png",
    taskdescription: spotifyTask,
    widName: const TaskSixteen(),
  );

  Items item17 = Items(
    title: "Harikrishna Pillai",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Harikrishna_Pillai.jpg",
    taskdescription: spotifyTask,
    widName: const TaskSeventeen(),
  );

  Items item18 = Items(
    title: "Siddharth Reddy",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Siddharth_Reddy.jpg",
    taskdescription: spotifyTask,
    widName: const TaskEighteen(),
  );

  Items item19 = Items(
    title: "Tejasvin Vimal",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Tejasvin_Vimal.jpg",
    taskdescription: spotifyTask,
    widName: const TaskNineteen(),
  );

  Items item20 = Items(
    title: "Yash Arora",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Yash_Arora.jpg",
    taskdescription: spotifyTask,
    widName: const TaskTwenty(),
  );

  Items item21 = Items(
    title: "Aashraya Katiyar",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Aashraya_Katiyar.jpg",
    taskdescription: spotifyTask,
    widName: const TaskTwentyOne(),
  );

  Items item22 = Items(
    title: "Rishav Kumar",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Rishav_Kumar.jpg",
    taskdescription: spotifyTask,
    widName: const TaskTwentyTwo(),
  );

  Items item23 = Items(
    title: "Sidharth S Kumar",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Sidharthssk.jpeg",
    taskdescription: spotifyTask,
    widName: const TaskTwentyThree(),
  );

  Items item24 = Items(
    title: "Vyshnav Unnikrishnan",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/Vyshnav.jpeg",
    taskdescription: spotifyTask,
    widName: const TaskTwentyFour(),
  );

  Items item25 = Items(
    title: "Amruth",
    taskTitle: "Spotify Music Comparison",
    img: "assets/members/missing_member.png",
    taskdescription: spotifyTask,
    widName: const TaskTwentyFive(),
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15, item16, item17, item18, item19, item20, item21, item22, item23, item24, item25];
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
  String taskTitle;
  String img;
  String taskdescription;
  Widget widName;
  Items(
      {
      required this.title,
        required this.taskTitle,
      required this.img,
      required this.taskdescription,
      required this.widName,
      }
  );
}
