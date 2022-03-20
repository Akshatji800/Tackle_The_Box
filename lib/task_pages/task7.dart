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

// ...

late StreamSubscription _sub;

Future<void> initUniLinks() async {
  // ... check initialUri

  // Attach a listener to the stream
  _sub = uriLinkStream.listen((Uri? uri) {
    // Use the uri and warn the user, if it is not correct
    print('URI RECEIVED #######################');
    throw Exception('URL Received');
  }, onError: (err) {
    // Handle exception by warning the user their action did not succeed
  });

  // NOTE: Don't forget to call _sub.cancel() in dispose()
}

// ...

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/3'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<PlayList> fetchPlaylist() async {
  var client_id = '9c9ca140425246ac88c2678fb27777db';
  var redirect_uri = 'http://flutterbooksample.com';

  var url = 'https://accounts.spotify.com/authorize';
  url += '?response_type=token';
  url += '&client_id=' + Uri.encodeComponent(client_id);
  url += '&redirect_uri=' + Uri.encodeComponent(redirect_uri);

  print(url);

  _launchURL(url);

  final response = await http.get(
      //Uri.parse('https://api.spotify.com/v1/playlists/37i9dQZF1DX76Wlfdnj7AP'));
      //Uri.parse(url));
      Uri.parse('https://jsonplaceholder.typicode.com/albums/3'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return PlayList.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class PlayList {
  final int followers;

  const PlayList({
    required this.followers,
  });

  factory PlayList.fromJson(Map<String, dynamic> json) {
    return PlayList(followers: json['followers']['total']);
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

//#####################

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
  late final _accessToken;
  late Future<PlayList> futurePL;

  @override
  void initState() {
    super.initState();
    getAccessToken();
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
      print('URI RECEIVED #######################');
      print(uri.toString());
      print(_accessToken);
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

  void updateTOD(String txt) {
    _text = TimeOfDay.now().toString();
    //_text = http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')).toString();
    setState(() {});
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
                  onSubmitted: updateTOD,
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
            /*Center(
              child: FutureBuilder<PlayList>(
                future: futurePL,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.followers.toString());
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),*/
          ]),
        ));
  }
}
