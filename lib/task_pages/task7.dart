import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:io';

import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

void _launchURL(_url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}

late StreamSubscription _sub;

class PlayList extends StatelessWidget {
  const PlayList({Key? key, required this.name, required this.tracks})
      : super(key: key);

  final String name;
  final int tracks;

  factory PlayList.fromJson(Map<String, dynamic> json) {
    return PlayList(name: json['name'], tracks: json['tracks']);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(flex: 1, fit: FlexFit.loose, child: Text(name)),
        Flexible(flex: 1, fit: FlexFit.loose, child: Text(tracks.toString()))
      ]),
    );
  }
}

class TaskSevenDeepLink extends StatelessWidget {
  const TaskSevenDeepLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TaskSeven extends StatefulWidget {
  const TaskSeven({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskSeven> {
  final _playlistTextController = TextEditingController();
  var _text = TimeOfDay.now().toString();
  var _accessToken;
  List<PlayList> _playlists = [];
  late Future<PlayList> futurePL;

  @override
  void initState() {
    super.initState();
    getAccessToken();
    _playlists.add(PlayList(name: 'Test T1', tracks: 20));
    //futurePL = fetchPlaylist();
  }

  Future<void> fetchPlaylist(String userID) async {
    Uri _uri = Uri.parse('https://api.spotify.com/v1/users/smedjan/playlists');
//BQA4PIuYxY0kk_Ca2IBdkV5uLf6BM9DxKVn8DRmynZ6E04aVqacPZDWjI77OLSpbn5ysPv9OJqS_LK20HjeQdwkevgTSX1Kkcy4IjJ20GhKx2gPjdBSqE4_BADh1Pls70zcbMBiAEjyZzGIxzfuiuzVZxhnjmCDYfzg';
    print(
        '########################################## TOKEN ##################################');
    print(_accessToken);
    final response = await http.get(_uri, headers: {
      'Authorization': 'Bearer ' + _accessToken,
      'Content-Type': 'application/json'
    });

    print('Requesting URI');
    print(_uri.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //return PlayList.fromJson(jsonDecode(response.body));
      Map<String, dynamic> myMap = json.decode(response.body);

      for (var item in myMap['items']) {
        var trk = item['tracks']['total'];
        _playlists.add(PlayList(name: item['name'], tracks: trk));
      }
      setState(() {});
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to load album');
    }
  }

  void getAccessToken() {
    var client_id = '9c9ca140425246ac88c2678fb27777db';
    var redirect_uri = 'http://flutterbooksample.com';

    var url = 'https://accounts.spotify.com/authorize';
    url += '?response_type=token';
    url += '&client_id=' + Uri.encodeComponent(client_id);
    url += '&redirect_uri=' + Uri.encodeComponent(redirect_uri);

    _launchURL(url);

    initUniLinks();
  }

  Future<void> initUniLinks() async {
    // ... check initialUri

    // Attach a listener to the stream
    _sub = uriLinkStream.listen((Uri? uri) {
      // Use the uri and warn the user, if it is not correct
      final _uristr = uri.toString();

      const start = "access_token=";
      const end = "&";

      final startIndex = _uristr.indexOf(start);
      final endIndex = _uristr.indexOf(end, startIndex + start.length);

      _accessToken = _uristr.substring(startIndex + start.length, endIndex);
      print(
          '################################################# URI RECEIVED #########################################################################');
      print(uri.toString());
      print(_accessToken);
      throw Exception('Uri Received');
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Task-7',
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
          child: Column(children: <Widget>[
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _playlistTextController,
                  onSubmitted: fetchPlaylist,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 77, 201, 81),
                            width: 2.0),
                      ),
                      hintText: 'Enter Plalist Name'),
                  //onSubmitted: (playlistTextController.text) {},
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, index) => _playlists[index],
                itemCount: _playlists.length,
              ),
            ),
          ]),
        ));
  }
}
