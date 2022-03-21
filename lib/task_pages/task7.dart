import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';

import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

void _launchURL(_url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}

const String _basePlaylistUrl =
    'https://api.spotify.com/v1/me/playlists?limit=50';
const String _baseUserUrl = 'https://api.spotify.com/v1/me';

late StreamSubscription _sub;

class PlayList extends StatelessWidget {
  const PlayList(
      {Key? key, required this.name, required this.tracks, required this.index})
      : super(key: key);

  final String name;
  final int tracks;
  final int index;

  factory PlayList.fromJson(Map<String, dynamic> json, int index) {
    return PlayList(name: json['name'], tracks: json['tracks'], index: index);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(flex: 1, fit: FlexFit.loose, child: Text(index.toString())),
        Flexible(flex: 1, fit: FlexFit.tight, child: Text(name)),
        Flexible(flex: 1, fit: FlexFit.loose, child: Text(tracks.toString())),
      ]),
    );
  }
}

class TaskSeven extends StatefulWidget {
  const TaskSeven({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskSeven> {
  var _accessToken;
  List<PlayList> _playlists = [];
  String userName = '';
  final _graphScrollController = ScrollController();
  final _listScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getAccessToken();
    _playlists.add(const PlayList(name: 'No Data', tracks: 0, index: 0));
  }

  void clearData() {
    _playlists.clear();
    setState(() {});
  }

  void getData() {
    fetchPlaylist();
    setState(() {});
  }

  void getUserName() async {
    Uri _uri = Uri.parse(_baseUserUrl);
    final response = await http.get(_uri, headers: {
      'Authorization': 'Bearer ' + _accessToken,
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      userName = myMap['display_name'];
      setState(() {});
    }
  }

  Future<void> fetchPlaylist() async {
    Uri _uri = Uri.parse(_basePlaylistUrl);

    final response = await http.get(_uri, headers: {
      'Authorization': 'Bearer ' + _accessToken,
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      final int _total = myMap['total'];
      int _offset = 0;
      for (var item in myMap['items']) {
        var trk = item['tracks']['total'];
        _playlists.add(PlayList(
          name: item['name'],
          tracks: trk,
          index: _playlists.length,
        ));
      }

      if (_playlists.length < _total) {
        _offset = _playlists.length;
        _uri = Uri.parse(_basePlaylistUrl + ('&offset=' + _offset.toString()));
        final response = await http.get(_uri, headers: {
          'Authorization': 'Bearer ' + _accessToken,
          'Content-Type': 'application/json'
        });

        Map<String, dynamic> myMap = json.decode(response.body);

        for (var item in myMap['items']) {
          var trk = item['tracks']['total'];
          _playlists.add(PlayList(
            name: item['name'],
            tracks: trk,
            index: (_playlists.length + 1),
          ));
        }
      }
      setState(() {});
    } else {
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
    _sub = uriLinkStream.listen((Uri? uri) {
      final _uristr = uri.toString();

      const start = "access_token=";
      const end = "&";

      final startIndex = _uristr.indexOf(start);
      final endIndex = _uristr.indexOf(end, startIndex + start.length);

      _accessToken = _uristr.substring(startIndex + start.length, endIndex);

      clearData();
      getData();
      getUserName();
    }, onError: (err) {});
  }

  @override
  void dispose() {
    super.dispose();
    _sub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildSpotifyTheme(),
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text(
              'Task-7',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xff1db954),
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
          body: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                  child: Text(
                'Welcome! ' + userName,
                style: Theme.of(context).textTheme.headline5,
              )),
            ),
            Column(
              children: <Widget>[
                Card(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Flexible(
                            flex: 1, fit: FlexFit.loose, child: Text('INDEX')),
                        Flexible(
                            flex: 1, fit: FlexFit.tight, child: Text('NAME')),
                        Flexible(
                            flex: 1, fit: FlexFit.loose, child: Text('TRACKS')),
                      ]),
                ),
                SizedBox(
                  height: 280,
                  child: Scrollbar(
                    isAlwaysShown: true,
                    controller: _listScrollController,
                    child: ListView.builder(
                      controller: _listScrollController,
                      padding: const EdgeInsets.all(8.0),
                      itemBuilder: (_, index) => _playlists[index],
                      itemCount: _playlists.length,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('Total ' + _playlists.length.toString())],
              ),
            ),
            Row(children: [
              const RotatedBox(
                  quarterTurns: -1,
                  child: Text('Tracks', style: TextStyle(color: Colors.black))),
              Expanded(
                child: Scrollbar(
                  isAlwaysShown: true,
                  scrollbarOrientation: ScrollbarOrientation.bottom,
                  controller: _graphScrollController,
                  child: SingleChildScrollView(
                    //padding: EdgeInsets.all(10.0),
                    scrollDirection: Axis.horizontal,
                    controller: _graphScrollController,
                    child: SizedBox(
                        width: _playlists.length * 20 > 200
                            ? _playlists.length * 20
                            : 200,
                        height: 300,
                        child:
                            Expanded(child: PlayListChart(data: _playlists))),
                  ),
                ),
              ),
            ]),
            const Center(
                child: Text('Playlist', style: TextStyle(color: Colors.black))),
            ButtonBar(
              children: <Widget>[
                TextButton(onPressed: clearData, child: const Text('CLEAR')),
                ElevatedButton(
                    onPressed: getData,
                    child: const Text(
                      'REFRESH',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ])),
    );
  }
}

class PlayListChart extends StatelessWidget {
  final List<PlayList> data;

  PlayListChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<PlayList, String>> series = [
      charts.Series(
          id: "tracks",
          data: data,
          domainFn: (PlayList series, _) => series.index.toString(),
          measureFn: (PlayList series, _) => series.tracks),
    ];

    return charts.BarChart(
      series,
      animate: true,
    );
  }
}

ThemeData _buildSpotifyTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: Color(0xff1db954),
      onPrimary: Color(0xff1ed760),
      secondary: Color(0xff1ed760),
      error: Colors.red,
    ),
    textTheme: _buildSpotifyTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xff1db954),
    ),
  );
}

TextTheme _buildSpotifyTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: Color(0xff1db954),
        bodyColor: Color(0xff1db954),
      );
}
