import 'package:flutter/material.dart';
import 'package:tackle_the_box/models/rick.dart';
import 'package:tackle_the_box/services/rick_operations.dart';

class Playlist extends StatelessWidget {
  const Playlist({Key? key}) : super(key: key);


  Widget createMusic(Rick rick){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 200,
            child:Image.network(
              rick.image, fit: BoxFit.cover,
            ),
          ),
          Text(rick.name,style: TextStyle(color: Colors.white),),
          Text(rick.desc,style: TextStyle(color: Colors.white))],
      ),
    );
  }

  Widget createRickList(String label) {
    List<Rick> musicList = RickOperations.getRick();
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[ Text(label, style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
          ),
            Container(
                height: 300,
                child: ListView.builder(
                  //padding: EdgeInsets.all(5),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index){
                    return createMusic(musicList[index]);

                  },
                  itemCount: musicList.length,)
            )
          ]),
    );
  }



  Widget createAppBar(String message){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(message),
      actions: [Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.access_alarm))
      ],
    );

  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
            child: Column(
              children: [
                createAppBar("Graph List of Songs"), SizedBox(height: 5,),
                createRickList('Latest Hits'),
                createRickList('Most Popular'),
              ],
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blueGrey.shade300,
                  Colors.black,
                  Colors.black,
                  Colors.black
                ],begin: Alignment.topLeft, end: Alignment.bottomRight)),)
      ),
    );
  }
}