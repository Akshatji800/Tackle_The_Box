import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tackle_the_box/task_pages/task12/playlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_table/json_table.dart';

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
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.music_note)),
                Tab(icon: Icon(Icons.bar_chart_rounded)),
              ],
            ),
            title: const Text(
              'Task-12',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color.fromRGBO(30, 215, 96, 1),
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
              Visibility(
                visible: isLoaded,
                child: ListView.builder(
                  itemCount: playlists?.items.length,
                  itemBuilder: (context, index) {
                    return Container(
                        child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[300]),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                playlists!.items[index].name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Owner: " +
                                    playlists!.items[index].owner.displayName
                                        .toString(),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Total Songs: " +
                                    playlists!.items[index].tracks.total
                                        .toString(),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
                  },
                ),
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              const Icon(Icons.bar_chart_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
