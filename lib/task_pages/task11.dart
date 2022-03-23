import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:tackle_the_box/task_pages/task11.dart';

List _items = [];

class TaskEleven extends StatefulWidget {
  const TaskEleven({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskEleven> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 102, 212, 110),
              Color.fromARGB(255, 102, 212, 110)
              //tried using gradient but it's looking awkward
              //also lazy to change it back left it like this
            ],
            stops: [0.5, 1.0],
          )),
        ),
        elevation: 0,
        title: const Text(
          'Task-11',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 46, 52, 65),
            Color.fromARGB(255, 18, 18, 18)
          ],
          stops: [0.5, 1.0],
        )),
        child: const Center(
          child: Text('Welcome',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
      floatingActionButton: Container(
        height: 75.0,
        width: 100.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondRoute()));
          },
          child: Icon(Icons.arrow_forward),
          backgroundColor: Color.fromARGB(255, 102, 212, 110),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
    //backgroundColor: Colors.transparent,
  }
}

class SecondRoute extends StatefulWidget {
  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  // Fetch content from the json file
  Future<void> dataParse() async {
    var data1 = {
      'client_id': '445901f1636940628d5a6ceab802553a',
      'client_secret': '36d085804c21424ab4449e3f4c62c635',
      'grant_type': 'refresh_token',
      'refresh_token':
          'AQBqNmImx83TRPzf3PIZSzf9vCj59uz8OvrVxHF-9Lacwkx5iQ1e0zbjdPhs1R3OZfodVwAXQKODLhCk2mN7A_RovV8jOyWKACbn52ysB0egMbaRyqVWwUg4WDTca_t_PNA',
      'code':
          'AQAbk7_GjC70I5kwXElPoNAWR8lRdy9QzJyZcmseqP4aoKNsIRGzkspmkpGcozREqgvPwsyAUYvZDxRXSjL4qAfXP1j3Ea3Co297jRfTn0I-wI1TZ2Pg9dd_Go3LZrEKFE2fezLRFdWYiT70BNKjlv3O4Ad6nTA6oWrTnzX2lrQ',
      'redirect_uri': 'http://example.com/callback/',
    };

    var url = Uri.parse('https://accounts.spotify.com/api/token');
    var res = await http.post(url, body: data1);
    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }
    //print(res.body);
    //print(res.body);
    final parsed = json.decode(res.body).cast<String, dynamic>();
    //print(parsed);
    //print(parsed['access_token']);
    //print(parsed['refresh_token']);

    var Bearer = parsed['access_token'];
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $Bearer',
    };
    var params = {
      'fields': 'name,tracks(total),followers(total)',
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url1 = Uri.parse(
        'https://api.spotify.com/v1/playlists/0eYa7x9rNE3kuKve4dfOV7?$query'); //You
    var url2 = Uri.parse(
        'https://api.spotify.com/v1/playlists/1B8bcQz65Pjhd5DTc5cQaZ?$query'); //dancing with your long lost love
    var url3 = Uri.parse(
        'https://api.spotify.com/v1/playlists/23BliEjdvxhphQ1PCxNKfi?$query'); //james&alyssa
    var url4 = Uri.parse(
        'https://api.spotify.com/v1/playlists/2PpwIA5slwJAb8rFcKwtPu?$query'); //MAGNESIUM
    var url5 = Uri.parse(
        'https://api.spotify.com/v1/playlists/6xa5r0NstnF3g51MLzg5Cp?$query'); //Telugu songs
    var url6 = Uri.parse(
        'https://api.spotify.com/v1/playlists/4bW2mF404vsOdYpGq1JqM0?$query'); //Douple
    var res1 = await http.get(url1, headers: headers);
    var res2 = await http.get(url2, headers: headers);
    var res3 = await http.get(url3, headers: headers);
    var res4 = await http.get(url4, headers: headers);
    var res5 = await http.get(url5, headers: headers);
    var res6 = await http.get(url6, headers: headers);
    //print(res1.body);
    if (res1.statusCode == 200) {
      var x1 = res1.body;
      var x2 = res2.body;
      var x3 = res3.body;
      var x4 = res4.body;
      var x5 = res5.body;
      var x6 = res6.body;
      var json = ('{ "items": [' +
          '$x1' +
          ',' +
          '$x2' +
          ',' +
          '$x3' +
          ',' +
          '$x4' +
          ',' +
          '$x5' +
          ',' +
          '$x6' +
          ']}');
      //print(json);
      final jsonData = jsonDecode(json).cast<String, dynamic>();
      //print(jsonData);
      //print(jsonDecode(jsonData));
      //print(jsonEncode(jsonData));
      //print(jsonData['items']);
      final data = jsonData;
      //print(x1);
      setState(() {
        _items = data['items'];
      });
    } else if (res1.statusCode == 401) {
      throw Exception('http.get error: statusCode= ${res1.statusCode}');
    } else {
      throw Exception('http.get error: statusCode= ${res1.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    dataParse();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 52, 65),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 102, 212, 110),
              Color.fromARGB(255, 102, 212, 110)
              //tried using gradient but it's looking awkward
              //also lazy to change it back left it like this
            ],
            stops: [0.5, 1.0],
          )),
        ),
        centerTitle: true,
        title: const Text('Playlist Details',
            style: TextStyle(color: Colors.black)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
                    child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        dataRowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Playlist Name',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'No.Of Songs',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'No.Of Likes',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(_items[0]["name"],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(
                                  _items[0]["tracks"]["total"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(
                                  _items[0]["followers"]["total"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(_items[1]["name"],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(
                                  _items[1]["tracks"]["total"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(
                                  _items[1]["followers"]["total"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(_items[2]["name"],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(
                                  _items[2]["tracks"]["total"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(
                                  _items[2]["followers"]["total"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(_items[3]["name"],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(
                                  _items[3]["tracks"]["total"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(
                                  _items[3]["followers"]["total"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(_items[4]["name"],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(
                                  _items[4]["tracks"]["total"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(
                                  _items[4]["followers"]["total"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(_items[5]["name"],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(
                                  _items[5]["tracks"]["total"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text(
                                  _items[5]["followers"]["total"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),
                          const DataRow(
                            cells: <DataCell>[
                              DataCell(Text('*Horizontally Scrollable',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                              DataCell(Text('')),
                              DataCell(Text('')),
                            ],
                          ),
                        ]),
                  ))
                : Container()
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 75.0,
        width: 100.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ThirdRoute(),
                    settings: RouteSettings(arguments: _items)));
          },
          child: const Icon(Icons.bar_chart),
          backgroundColor: Color.fromARGB(255, 102, 212, 110),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  gradient() {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
          Color.fromARGB(255, 46, 52, 65),
          Color.fromARGB(255, 18, 18, 18)
        ])));
  }
}

class ThirdRoute extends StatefulWidget {
  const ThirdRoute({Key? key}) : super(key: key);

  @override
  State<ThirdRoute> createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  final List<BarChartLikesModel> data = [
    BarChartLikesModel(
      PlaylistNameA: '1',
      Likes: _items[0]["followers"]["total"],
      colorA: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    BarChartLikesModel(
      PlaylistNameA: '2',
      Likes: _items[1]["followers"]["total"],
      colorA: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartLikesModel(
      PlaylistNameA: '3',
      Likes: _items[2]["followers"]["total"],
      colorA: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartLikesModel(
      PlaylistNameA: '4',
      Likes: _items[3]["followers"]["total"],
      colorA: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartLikesModel(
      PlaylistNameA: '5',
      Likes: _items[4]["followers"]["total"],
      colorA: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartLikesModel(
      PlaylistNameA: '6',
      Likes: _items[5]["followers"]["total"],
      colorA: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartLikesModel, String>> series = [
      charts.Series(
        id: "Likes",
        data: data,
        domainFn: (BarChartLikesModel series, _) => series.PlaylistNameA,
        measureFn: (BarChartLikesModel series, _) => series.Likes,
        colorFn: (BarChartLikesModel series, _) => series.colorA,
      ),
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 52, 65),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 102, 212, 110),
              Color.fromARGB(255, 102, 212, 110)
              //tried using gradient but it's looking awkward
              //also lazy to change it back left it like this
            ],
            stops: [0.5, 1.0],
          )),
        ),
        centerTitle: true,
        title: const Text('Comparision By Likes',
            style: TextStyle(color: Colors.black)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        //margin: const EdgeInsets.all(10.0),
        //width: 48.0,
        height: 500.0,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
      floatingActionButton: Container(
        height: 75.0,
        width: 100.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FourthRoute(),
                    settings: RouteSettings(arguments: _items)));
          },
          child: const Icon(Icons.bar_chart),
          backgroundColor: Color.fromARGB(255, 102, 212, 110),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class BarChartLikesModel {
  String PlaylistNameA;
  int Likes;
  final charts.Color colorA;

  BarChartLikesModel({
    required this.PlaylistNameA,
    required this.Likes,
    required this.colorA,
  });
}

class FourthRoute extends StatefulWidget {
  @override
  State<FourthRoute> createState() => _FourthRouteState();
}

class _FourthRouteState extends State<FourthRoute> {
  final List<BarChartSongsModel> data = [
    BarChartSongsModel(
      PlaylistNameB: '1',
      Songs: _items[0]["tracks"]["total"],
      colorB: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    BarChartSongsModel(
      PlaylistNameB: '2',
      Songs: _items[1]["tracks"]["total"],
      colorB: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartSongsModel(
      PlaylistNameB: '3',
      Songs: _items[2]["tracks"]["total"],
      colorB: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartSongsModel(
      PlaylistNameB: '4',
      Songs: _items[3]["tracks"]["total"],
      colorB: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartSongsModel(
      PlaylistNameB: '5',
      Songs: _items[4]["tracks"]["total"],
      colorB: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartSongsModel(
      PlaylistNameB: '6',
      Songs: _items[5]["tracks"]["total"],
      colorB: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartSongsModel, String>> series = [
      charts.Series(
        id: "Songs",
        data: data,
        domainFn: (BarChartSongsModel series, _) => series.PlaylistNameB,
        measureFn: (BarChartSongsModel series, _) => series.Songs,
        colorFn: (BarChartSongsModel series, _) => series.colorB,
      ),
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 52, 65),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 102, 212, 110),
              Color.fromARGB(255, 102, 212, 110)
              //tried using gradient but it's looking awkward
              //also lazy to change it back left it like this
            ],
            stops: [0.5, 1.0],
          )),
        ),
        centerTitle: true,
        title: const Text('Comparision By Tracks',
            style: TextStyle(color: Colors.black)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        //margin: const EdgeInsets.all(10.0),
        //width: 48.0,
        height: 500.0,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }
}

class BarChartSongsModel {
  String PlaylistNameB;
  int Songs;
  final charts.Color colorB;

  BarChartSongsModel({
    required this.PlaylistNameB,
    required this.Songs,
    required this.colorB,
  });
}
