import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tackle_the_box/task_pages/task12/playlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chart.dart';

class RemoteService {
  Future<Playlist?> getPlaylists() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://api.spotify.com/v1/users/31kqd45nejfwvxcbh6tymjw4rxue/playlists');

    var response = await client.get(
      uri,
      headers: <String, String>{
        "Authorization":
            "Bearer BQCTzmd-K_jbnKzu8QKf1tiiFzGXJHfg-iGrQ589_Kw2RiDiwSQfDrTD1stHYt8vSF-_ly-RSKpQjibyU6LPcybwa8816JUlyWKvWmrejGfmfXBDZFXKcraV-BHMsmBVJ9Dnapx8yX0NwkCTyoxX0ucHQy3qLObkEXFJOjTAp1ujOorfWXY",
        'Content-Type': 'application/json',
      },
    );
    final prefs = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      var jsoN = response.body;
      await prefs.setString('data', jsoN);
      return playlistFromJson(jsoN);
    } else {
      final String? jsoN = prefs.getString('data');
      return playlistFromJson(jsoN!);
    }
  }
}

class TaskTwelve extends StatefulWidget {
  const TaskTwelve({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskTwelve> {
  Playlist? playlists;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    collectData();
  }

  collectData() async {
    playlists = (await RemoteService().getPlaylists());
    if (playlists != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            bottom: const TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.blueGrey,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.black87),
              tabs: [
                Tab(icon: Icon(Icons.music_note)),
                Tab(icon: Icon(Icons.bar_chart_rounded)),
              ],
            ),
            title: const Text(
              'Task-12',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
            shadowColor: Colors.black,
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
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Visibility(
                  visible: isLoaded,
                  child: ListView.builder(
                    itemCount: playlists?.items.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        playlists!.items[index].images[0].url),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      playlists!.items[index].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Color.fromRGBO(30, 215, 96, 1),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Owner: " +
                                          playlists!
                                              .items[index].owner.displayName
                                              .toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Total Songs: " +
                                          playlists!.items[index].tracks.total
                                              .toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              const BarChartSample2(),
            ],
          ),
        ),
      ),
    );
  }
}
