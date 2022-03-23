// ignore_for_file: prefer_const_constructors, unnecessary_new, camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'components/data.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'components/items.dart';

class ChartModel {
  String year;
  int financial;
  final charts.Color color;

  ChartModel({
    required this.year,
    required this.financial,
    required this.color,
  });
}

class LikesChart {
  String name;
  int likes;
  final charts.Color color;

  LikesChart({
    required this.name,
    required this.likes,
    required this.color,
  });
}

class SongsChart {
  String name;
  int songs;
  final charts.Color color;

  SongsChart({
    required this.name,
    required this.songs,
    required this.color,
  });
}

class TaskTwenty extends StatefulWidget {
  const TaskTwenty({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskTwenty> {
  Map? finalData;

  final List<ChartModel> data = [
    ChartModel(
        year: "2002",
        financial: 100,
        color: charts.ColorUtil.fromDartColor(Colors.black)),
    ChartModel(
        year: "2002",
        financial: 100,
        color: charts.ColorUtil.fromDartColor(Colors.black))
  ];
  final List<LikesChart> likes = [];
  final List<SongsChart> songs = [];

  _TaskDashboardState() {
    getData().then((value) => setState(() {
          finalData = value;
        }));
  }
  @override
  Widget build(BuildContext context) {
    final playlist_count = finalData?["count"];
    final playlist_names = finalData?["names"];
    final playlist_likes = finalData?["likes"];
    final playlist_song_count = finalData?["song_count"];
    final playlist_images_url = finalData?["img_link"];
    Size size = MediaQuery.of(context).size;

    while (playlist_count == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Yash\'s App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 203, 13, 236),
          elevation: 0,
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
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    for (int count = 1; count <= playlist_count; count++) {
      likes.add(LikesChart(
          name: "$count",
          likes: playlist_likes[count - 1],
          color: charts.ColorUtil.fromDartColor(Colors.white)));
    }
    for (int count = 1; count <= playlist_count; count++) {
      songs.add(SongsChart(
          name: "$count",
          songs: playlist_song_count[count - 1],
          color: charts.ColorUtil.fromDartColor(Colors.white)));
    }

    List<charts.Series<LikesChart, String>> seriesLikes = [
      charts.Series(
        id: "Playlist Followers",
        data: likes,
        domainFn: (LikesChart seriesLikes, _) => seriesLikes.name,
        measureFn: (LikesChart seriesLikes, _) => seriesLikes.likes,
        colorFn: (_, __) => charts.MaterialPalette.white,
      ),
    ];

    List<charts.Series<SongsChart, String>> seriesSongs = [
      charts.Series(
        id: "Number of Songs",
        data: songs,
        domainFn: (SongsChart seriesSongs, _) => seriesSongs.name,
        measureFn: (SongsChart seriesSongs, _) => seriesSongs.songs,
        colorFn: (_, __) => charts.MaterialPalette.white,
      ),
    ];
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 50,
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.format_list_bulleted_rounded)),
                      Tab(icon: Icon(Icons.groups_rounded)),
                      Tab(icon: Icon(Icons.multitrack_audio_rounded)),
                    ],
                  ),
                  backgroundColor: Color.fromARGB(255, 203, 13, 236),
                  title: Text(
                    'Yash\'s App',
                    style: TextStyle(color: Colors.white),
                  ),
                  elevation: 0,
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
                body: TabBarView(children: [
                  //Page-1: Playlists
                  Scaffold(
                    appBar: AppBar(
                      backgroundColor: Color.fromARGB(255, 203, 13, 236),
                      title: Center(child: Text("Saved Playlists")),
                      elevation: 0,
                    ),
                    body: Scrollbar(
                      child: Container(
                        color: Color.fromARGB(255, 203, 13, 236),
                        child: Column(
                          children: <Widget>[
                            getWidget(
                                playlist_count: playlist_count,
                                playlist_images_url: playlist_images_url,
                                size: size,
                                playlist_names: playlist_names,
                                playlist_song_count: playlist_song_count,
                                playlist_likes: playlist_likes),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //Page- 2
                  Scaffold(
                    backgroundColor: Color(0xffb06ab3),
                    appBar: AppBar(
                      backgroundColor: Color.fromARGB(255, 203, 13, 236),
                      title: Center(child: Text("Followers")),
                      elevation: 0,
                    ),
                    body: Scrollbar(
                      child: Column(
                        children: [
                          Container(
                            height: 275,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    colors: [
                                  Color.fromARGB(255, 89, 122, 232),
                                  Color(0xff7A69C7),
                                ])),
                            padding: const EdgeInsets.all(10),
                            child: charts.BarChart(
                              seriesLikes,
                              animate: true,
                              behaviors: [
                                new charts.SeriesLegend(
                                  position: charts.BehaviorPosition.top,
                                  horizontalFirst: false,
                                  cellPadding: new EdgeInsets.only(
                                      right: 4.0, bottom: 4.0),
                                  showMeasures: true,
                                )
                              ],
                              domainAxis: new charts.OrdinalAxisSpec(
                                  renderSpec: new charts.SmallTickRendererSpec(

                                      // Tick and Label styling here.
                                      labelStyle: new charts.TextStyleSpec(
                                          fontSize: 12, // size in Pts.
                                          color: charts.MaterialPalette.black),

                                      // Change the line colors to match text color.
                                      lineStyle: new charts.LineStyleSpec(
                                          color:
                                              charts.MaterialPalette.black))),
                              primaryMeasureAxis: new charts.NumericAxisSpec(
                                  renderSpec: new charts.GridlineRendererSpec(

                                      // Tick and Label styling here.
                                      labelStyle: new charts.TextStyleSpec(
                                          fontSize: 12, // size in Pts.
                                          color: charts.MaterialPalette.black),

                                      // Change the line colors to match text color.
                                      lineStyle: new charts.LineStyleSpec(
                                          color:
                                              charts.MaterialPalette.black))),
                            ),
                          ),
                          InteractiveViewer(
                            constrained: true,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    colors: [
                                      Color(0xff7A69C7),
                                      Color(0xffb06ab3),
                                    ]),
                              ),
                              height: 419,
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: DataTable(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  columns: [
                                    DataColumn(
                                        label: Text('#',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))),
                                    DataColumn(
                                        label: Text('Playlist',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))),
                                    DataColumn(
                                        label: Text('Followers',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))),
                                  ],
                                  rows: [
                                    for (int count = 1;
                                        count <= playlist_count;
                                        count++)
                                      DataRow(cells: [
                                        DataCell(Text('$count',
                                            style: TextStyle(
                                                color: Colors.white))),
                                        DataCell(Text(
                                            '${playlist_names[count - 1]}',
                                            style: TextStyle(
                                                color: Colors.white))),
                                        DataCell(Text(
                                            '${playlist_likes[count - 1]}',
                                            style: TextStyle(
                                                color: Colors.white))),
                                      ]),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Page- 3

                  Scaffold(
                    backgroundColor: Color(0xffb06ab3),
                    appBar: AppBar(
                      title: Center(child: Text("Number of Songs")),
                      backgroundColor: Color.fromARGB(255, 203, 13, 236),
                      elevation: 0,
                    ),
                    body: Scrollbar(
                      child: Column(
                        children: [
                          Container(
                            height: 275,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    colors: [
                                  Color.fromARGB(255, 89, 122, 232),
                                  Color(0xff7A69C7),
                                ])),
                            padding: const EdgeInsets.all(10),
                            child: charts.BarChart(
                              seriesSongs,
                              animate: true,
                              behaviors: [
                                new charts.SeriesLegend(
                                  position: charts.BehaviorPosition.top,
                                  horizontalFirst: false,
                                  cellPadding: new EdgeInsets.only(
                                      right: 4.0, bottom: 4.0),
                                  showMeasures: true,
                                )
                              ],
                              domainAxis: new charts.OrdinalAxisSpec(
                                  renderSpec: new charts.SmallTickRendererSpec(

                                      // Tick and Label styling here.
                                      labelStyle: new charts.TextStyleSpec(
                                          fontSize: 12, // size in Pts.
                                          color: charts.MaterialPalette.black),

                                      // Change the line colors to match text color.
                                      lineStyle: new charts.LineStyleSpec(
                                          color:
                                              charts.MaterialPalette.black))),
                              primaryMeasureAxis: new charts.NumericAxisSpec(
                                  renderSpec: new charts.GridlineRendererSpec(

                                      // Tick and Label styling here.
                                      labelStyle: new charts.TextStyleSpec(
                                          fontSize: 12, // size in Pts.
                                          color: charts.MaterialPalette.black),

                                      // Change the line colors to match text color.
                                      lineStyle: new charts.LineStyleSpec(
                                          color:
                                              charts.MaterialPalette.black))),
                            ),
                          ),
                          InteractiveViewer(
                            constrained: true,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    colors: [
                                      Color(0xff7A69C7),
                                      Color(0xffb06ab3),
                                    ]),
                              ),
                              alignment: Alignment.topCenter,
                              height: 419,
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: DataTable(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  columns: [
                                    DataColumn(
                                        label: Text('#',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))),
                                    DataColumn(
                                        label: Text('Playlist',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))),
                                    DataColumn(
                                        label: Text('Songs',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))),
                                  ],
                                  rows: [
                                    for (int count = 1;
                                        count <= playlist_count;
                                        count++)
                                      DataRow(cells: [
                                        DataCell(Text('$count',
                                            style: TextStyle(
                                                color: Colors.white))),
                                        DataCell(Text(
                                            '${playlist_names[count - 1]}',
                                            style: TextStyle(
                                                color: Colors.white))),
                                        DataCell(Text(
                                            '${playlist_song_count[count - 1]}',
                                            style: TextStyle(
                                                color: Colors.white))),
                                      ]),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]))));
  }
}

class getWidget extends StatelessWidget {
  const getWidget({
    Key? key,
    required this.playlist_count,
    required this.playlist_images_url,
    required this.size,
    required this.playlist_names,
    required this.playlist_song_count,
    required this.playlist_likes,
  }) : super(key: key);

  final playlist_count;
  final playlist_images_url;
  final Size size;
  final playlist_names;
  final playlist_song_count;
  final playlist_likes;

  @override
  Widget build(BuildContext context) {
    return page1build(
        playlist_count: playlist_count,
        playlist_images_url: playlist_images_url,
        size: size,
        playlist_names: playlist_names,
        playlist_song_count: playlist_song_count,
        playlist_likes: playlist_likes);
  }
}

class page1build extends StatelessWidget {
  const page1build({
    Key? key,
    required this.playlist_count,
    required this.playlist_images_url,
    required this.size,
    required this.playlist_names,
    required this.playlist_song_count,
    required this.playlist_likes,
  }) : super(key: key);

  final playlist_count;
  final playlist_images_url;
  final Size size;
  final playlist_names;
  final playlist_song_count;
  final playlist_likes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 70),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
          ),
          Builder(
              playlist_count: playlist_count,
              playlist_images_url: playlist_images_url,
              size: size,
              playlist_names: playlist_names,
              playlist_song_count: playlist_song_count,
              playlist_likes: playlist_likes)
        ],
      ),
    );
  }
}

class Builder extends StatelessWidget {
  const Builder({
    Key? key,
    required this.playlist_count,
    required this.playlist_images_url,
    required this.size,
    required this.playlist_names,
    required this.playlist_song_count,
    required this.playlist_likes,
  }) : super(key: key);

  final playlist_count;
  final playlist_images_url;
  final Size size;
  final playlist_names;
  final playlist_song_count;
  final playlist_likes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: playlist_count,
        itemBuilder: ((context, index) => Itmes(
              playlist_images_url: playlist_images_url,
              size: size,
              playlist_names: playlist_names,
              playlist_song_count: playlist_song_count,
              playlist_likes: playlist_likes,
              index: index,
            )));
  }
}
