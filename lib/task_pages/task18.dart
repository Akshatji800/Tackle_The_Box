import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

Future<Map> getData() async {
  var data1 = {
    'client_id': '8405d6c38ef244c98c5f35297a05ddae',
    'client_secret': '6a4a1d59a4af4b73aa1cf398dbe1e14f',
    'grant_type': 'refresh_token',
    'refresh_token':
        'AQAsKWPDRyysN3XD9YKOl4Xfc5PYGJ4-r1o7VxcBawPU32b1uK0AhyNnPW5dFnH4pxIWMZdABnsvbU94AzQ8A56mf354nh_T3TPC79U4c2mshfeu5QgxtcuJC84u-Mw6a-M',
    'code':
        'AQB4KjZHHYfDrXRfargOElVTH78JNrk7bpEoUQD3sCBR679HeAItC_ZXXBHEPihq4xBntZ-EfgCjqiTq5Xi8Ix1ZaLVOkZ3mfctckhKwrJf6JJerU3VyrKQdXMFE8P6kJ5HZuw_hlWacqzO6kzufa6kLZCNGYvqh7Jp4rT1e8pw',
    'redirect_uri': 'https://task18.com/callback/',
  };
  var urltoken = Uri.parse('https://accounts.spotify.com/api/token');
  var tkresponse = await http.post(urltoken, body: data1);
  if (tkresponse.statusCode != 200) {
    throw Exception('http.post error: statusCode= ${tkresponse.statusCode}');
  }
  print(tkresponse.body);
  final dataToken = json.decode(tkresponse.body).cast<String, dynamic>();
  print(dataToken['access_token']);
  var Bearer = dataToken['access_token'];
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer $Bearer',
  };
  var url = Uri.parse('https://api.spotify.com/v1/me/playlists');
  var resplaylists = await http.get(url, headers: headers);
  if (resplaylists.statusCode != 200) {
    throw Exception('http.get error: statusCode= ${resplaylists.statusCode}');
  }

  final playlistdata = json.decode(resplaylists.body).cast<String, dynamic>();
  num numplaylists = playlistdata['total'];
  print(playlistdata);
  List<String> playlists_link = [];
  List<String> name = [];
  List<int> likes = [];
  List<int> Song_num = [];
  List<String> playlist_profile_pic = [];
  for (int i = 1; i <= numplaylists; i++) {
    //print();
    playlists_link.add(playlistdata['items'][i - 1]['href']);
    name.add(playlistdata['items'][i - 1]['name']);
    try {
      playlist_profile_pic
          .add(playlistdata['items'][i - 1]['images'][0]['url']);
    } catch (s) {
      playlist_profile_pic.add(
          "https://images-na.ssl-images-amazon.com/images/I/61E1238sN%2BL.__AC_SY300_QL70_ML2_.jpg");
    }
  }
  print(playlist_profile_pic);

  for (int i = 1; i <= numplaylists; i++) {
    var link = playlists_link[i - 1];
    var eachplaylist = Uri.parse(link);
    var eachplaylist_res = await http.get(eachplaylist, headers: headers);
    if (eachplaylist_res.statusCode != 200) {
      throw Exception('http.get error: statusCode= ${eachplaylist_res.statusCode}');
    }
    //print(res.body);
    final parsed = json.decode(eachplaylist_res.body).cast<String, dynamic>();
    likes.add(parsed['followers']['total']);
  }

  for (int i = 1; i <= numplaylists; i++) {
    var link = playlists_link[i - 1] + "/tracks";
    var eachplaylist = Uri.parse(link);
    var eachplaylist_res = await http.get(eachplaylist, headers: headers);
    if (eachplaylist_res.statusCode != 200) {
      throw Exception('http.get error: statusCode= ${eachplaylist_res.statusCode}');
    }
    final parsed = json.decode(eachplaylist_res.body).cast<String, dynamic>();
    Song_num.add(parsed['total']);
  }
  final numsongseach = numplaylists;
  final pl_links_api = playlists_link;
  final names = name;
  final numlikes = likes;
  final pl_song_cnt = Song_num;
  final pl_image_link = playlist_profile_pic;

  var output = {
    "Total Play Lists": numsongseach,
    "Play List Names": names,
    "Play List Likes": numlikes,
    "Total Song Count": pl_song_cnt,
    "Play List Image Link": pl_image_link,
  };
  print(output);
  return output;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify playlists that I like',
      home: TaskEighteen(),
    );
  }
}

class TaskEighteen extends StatefulWidget {
  const TaskEighteen({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskEighteen> {
  Map? dataFetched;
  List _items = [];
  int a = 0;
  Future<void> readJson() async {
    final String res2 = await rootBundle.loadString('assets/json/Apidata.json');
    final data = await json.decode(res2);
    setState(() {
      _items = data["items"];
    });
  }

  _TaskDashboardState() {
    getData().then((value) => setState(() {
          dataFetched = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    final numsongseach = dataFetched?["Total Play Lists"];
    final names = dataFetched?["Play List Names"];
    final numlikes = dataFetched?["Play List Likes"];
    final pl_song_cnt = dataFetched?["Total Song Count"];
    return Scaffold(
      backgroundColor: const Color.fromRGBO(46, 52, 63, 1),
      appBar: AppBar(
        title: const Text(
          'Task-18',
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
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Load Data'),
              onPressed: readJson,
            ),
            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Table(
                            defaultColumnWidth: const FixedColumnWidth(150),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            border: TableBorder.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            children: [
                              TableRow(children: [
                                Column(children: const [
                                  Text("Playlist Name",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color:
                                              Color.fromARGB(255, 25, 248, 200),
                                          fontWeight: FontWeight.bold))
                                ]),
                                Column(children: const [
                                  Text("Number of Tracks",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color:
                                              Color.fromARGB(255, 25, 248, 200),
                                          fontWeight: FontWeight.bold))
                                ]),
                                Column(children: const [
                                  Text("Number of likes",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color:
                                              Color.fromARGB(255, 25, 248, 200),
                                          fontWeight: FontWeight.bold))
                                ]),
                              ]),
                              for (int i = 0; i < numsongseach; i++)
                                TableRow(children: [
                                  Column(children: [
                                    Container(
                                      child: Text(
                                        names[i],
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 25, 248, 200)),
                                      ),
                                    )
                                  ]),
                                  Column(children: [
                                    Text(pl_song_cnt[i].toString(),
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 25, 248, 200)))
                                  ]),
                                  Column(children: [
                                    Text(
                                      numlikes[i].toString(),
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 25, 248, 200)),
                                    )
                                  ]),
                                ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
