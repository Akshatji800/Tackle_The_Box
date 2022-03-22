import 'package:flutter/material.dart';
import 'package:tackle_the_box/Screens/graph.dart';
import 'package:tackle_the_box/Screens/home.dart';
import 'package:tackle_the_box/Screens/playlist.dart';


class TaskThirteen extends StatefulWidget {
  const TaskThirteen({Key? key}) : super(key: key);

  @override
  _TaskThirteenState createState() => _TaskThirteenState();
}

class _TaskThirteenState extends State<TaskThirteen> {
  final Tabs = [Home(), Playlist(), Graph()];
  int currentTabIndex = 0;
  //ui design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTabIndex,
        onTap: (currentIndex){
          currentTabIndex = currentIndex;
          setState(() {});
        },
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedItemColor: Colors.white,
        backgroundColor:Colors.black45,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.table_view,color: Colors.white,),label: 'Graph')
      ],),
    );
  }
}
