import 'package:flutter/material.dart';
import 'package:tackle_the_box/services/tracks.dart';

class TaskTwentyThree extends StatefulWidget {
  const TaskTwentyThree({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskTwentyThree> {
  

  @override
  Widget build(BuildContext context) {
    GetTracks.getTracks();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task-23',
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
      body: Container(
        child: FutureBuilder<void>(
          future: GetTracks.getTracks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: GetTracks.tracks.length,
                itemBuilder: (context, index) {
                  var item = GetTracks.tracks[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Image.network(item.imageUrl),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Song : ${item.title}',
                                ),
                                Text('Artist : ${item.artist}'),
                              ],
                            ),
                            SizedBox(height: 10)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
