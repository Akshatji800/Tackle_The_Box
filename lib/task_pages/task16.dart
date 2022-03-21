// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;

// @override
// Widget build(BuildContext context) {
//   var x = getData();
//   print("Values of x are");
//   print(x);

//   return Scaffold(
//     appBar: AppBar(
//       title: const Text(
//         'Task-16',
//         style: TextStyle(color: Colors.white),
//       ),
//       backgroundColor: Colors.yellow.shade800,
//       elevation: 16,
//       leading: IconButton(
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//         icon: const Icon(
//           Icons.arrow_back,
//           color: Colors.white,
//         ),
//       ),
//     ),
//   );
// }
//}

////// I F   Y O U   W A N T   T O   T E S T   T H E   A P I   F U N C T I O N A L I T Y   C O P Y   T H E   B A R E R   T O K E N   A N D   R E P L A C E
//////   T H E   O L D   B E A R E R   T O K E N   W I T H   A   N E W   O N E   I T   I N   L I N E   4 1   A F T E R   " B e a r e r "

Future<Map> getData() async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQBEztXmVnzbdKVcc3jSXZy16wTXYwJt3op9dPM_8TpiZ-IC43wqYqzzzdF8RwlAxjErFLlNSLUyW4b8Ef_EUWn-VwYo9ojoFSfP7AQScYoK3G9M3XzhCT5gCX4UpTQtmF1CeLYFkPMVa9Q92Q_X00n8kNFBCN3WSCKHNCuqcNKElrfNmjjzqvbI1SXi49eBdKwKe-n0VSJpizgaDFk7jjTLU6W9bDeH',
  };
  try {
    var url = Uri.parse('https://api.spotify.com/v1/me/playlists');
    var res = await http.get(url, headers: headers);
    if (res.statusCode != 200)
      throw Exception('http.get error: statusCode= ${res.statusCode}');

    final parsed = json.decode(res.body).cast<String, dynamic>();
    var total = parsed['total'];
    List<String> playlist_links = [];
    List<String> playlist_name = [];
    List<int> playlist_likes = [];
    List<int> playlist_song_count = [];
    List<String> playlist_pic_link = [];

    //FOR COLLECTING LINKS AND NAMES OF " P L A Y   L I S T S"

    for (int i = 1; i <= total; i++) {
      //print();
      playlist_links.add(parsed['items'][i - 1]['href']);
      playlist_name.add(parsed['items'][i - 1]['name']);
      try {
        playlist_pic_link.add(parsed['items'][i - 1]['images'][0]['url']);
      } catch (s) {
        playlist_pic_link.add(
            "https://images-na.ssl-images-amazon.com/images/I/61E1238sN%2BL.__AC_SY300_QL70_ML2_.jpg");
      }
      ;
      //print('\n\n');
    }
    print(playlist_pic_link);

    //FOR COLLECTING LIKES OF " P L A Y   L I S T S"

    for (int i = 1; i <= total; i++) {
      var link = playlist_links[i - 1];
      var url_temp = Uri.parse(link);
      var res_temp = await http.get(url_temp, headers: headers);
      if (res_temp.statusCode != 200)
        throw Exception('http.get error: statusCode= ${res_temp.statusCode}');
      //print(res.body);
      final parsed = json.decode(res_temp.body).cast<String, dynamic>();
      playlist_likes.add(parsed['followers']['total']);
    }

    //TODO : FIND NUMBER OF SONGS IN EACH PLAYLIST

    for (int i = 1; i <= total; i++) {
      var link = playlist_links[i - 1] + "/tracks";
      var url_temp = Uri.parse(link);
      var res_temp = await http.get(url_temp, headers: headers);
      if (res_temp.statusCode != 200)
        throw Exception('http.get error: statusCode= ${res_temp.statusCode}');
      final parsed = json.decode(res_temp.body).cast<String, dynamic>();
      playlist_song_count.add(parsed['total']);
    }

    // print(total);
    // print(playlist_links);
    // print(playlist_name);
    // print(playlist_likes);
    // print(playlist_song_count);

    final pl_count = total;
    final pl_links_api = playlist_links;
    final pl_names = playlist_name;
    final pl_likes = playlist_likes;
    final pl_song_cnt = playlist_song_count;
    final pl_image_link = playlist_pic_link;
    print(
      pl_count,
    );
    print(
      pl_names,
    );
    print(
      pl_likes,
    );
    print(
      pl_song_cnt,
    );
    print(
      pl_image_link,
    );

    var output = {
      "Total Play Lists": pl_count,
      "Play List Names": pl_names,
      "Play List Likes": pl_likes,
      "Total Song Count": pl_song_cnt,
      "Play List Image Link": pl_image_link,
    };
    //print(pl_image_link);
    return await output;
  } catch (exc) {
    ////// T H I S   P A R T   I S   S O   T H A T   I T   W I L L   S H O W   D A T A   E V E N   I F   T H E   A P I   E X P I R E S
    ////// I F   Y O U   W A N T   T O   T E S T   T H E   A P I   F U N C T I O N A L I T Y   C O P Y   T H E   B A R E R   T O K E N   A N D   R E P L A C E
    //////   T H E   O L D   B E A R E R   T O K E N   W I T H   A   N E W   O N E   I T   I N   L I N E   4 1   A F T E R   " B e a r e r "
    print("Error: $exc");
    var output = {
      "Total Play Lists": 7,
      "Play List Names": [
        "Latest Telugu",
        "City Back to Kasi",
        "Bollywood Acoustic",
        "REM sleep",
        "Top 50 - India",
        "Hi",
        "Telugu Romance"
      ],
      "Play List Likes": [205129, 12178, 149110, 60092, 287940, 0, 78732],
      "Total Song Count": [70, 60, 47, 44, 50, 11, 101],
      "Play List Image Link": [
        "https://i.scdn.co/image/ab67706f000000032cfa1cc4381a707accda25c6",
        "https://i.scdn.co/image/ab67706f00000003b9ccf87dfaad821588fcf41c",
        "https://i.scdn.co/image/ab67706f0000000373b6bd23c3a67f83b4acc521",
        "https://i.scdn.co/image/ab67706f00000003ef48a5a9c020069725ca9ee2",
        "https://charts-images.scdn.co/assets/locale_en/regional/daily/region_in_large.jpg",
        "https://mosaic.scdn.co/640/ab67616d0000b27355d06097244512041e6877d6ab67616d0000b27363118748c712b6ac32c0feecab67616d0000b2736f3d477e1f31b354c5de3d56ab67616d0000b273c45f8ae0957ab4b8c45dd4fc",
        "https://i.scdn.co/image/ab67706f00000003895e50c186f1ca4de90975fc"
      ],
    };
    print("1");
    return await output;
  }
}

// Future<String> getData() async {
//   var headers = {
//     'Accept': 'application/json',
//     'Content-Type': 'application/json',
//     'Authorization':
//         'Bearer BQAwVKkZcEBkvoiUMOwp3M7vvesrMVGGDQv2FpvXp1A1e-kEfzB3mih-Fy-A1we0BV0ahiFTUgSicsJkMkiC7Yi59SvdzgrOlYqtFvUhx1UVYdk4QunPSDFbDKDfCuJ7UYeAhjkCH_5qzVJ_EGOpHYd7OHSSuSncjQmkA-R0HhUpFj07zDWt17kHagiz7Uc-8iS3C0La7W6Nr_19-PGOriBHwyb5FJ-8',
//   };

//   try {
//     var url = Uri.parse(
//         'https://api.spotify.com/v1/playlists/37i9dQZEVXbLZ52XmnySJg/tracks');
//     var res = await http.get(url, headers: headers);
//     if (res.statusCode != 200)
//       throw Exception('http.get error: statusCode= ${res.statusCode}');
//     return(res.body);
//   } catch (exc) {
//     print("Error: $exc");
//     return "null";
//   }
// }

class TaskSixteen extends StatefulWidget {
  const TaskSixteen({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskSixteen> {
  Map? dataFuture;
  final List<BarChartModel> data = [
    BarChartModel(
        year: "2014",
        financial: 250,
        color: charts.ColorUtil.fromDartColor(Colors.black)),
    BarChartModel(
        year: "2015",
        financial: 450,
        color: charts.ColorUtil.fromDartColor(Colors.green))
  ];
  final List<BarChartModelLikes> likeData = [];
  final List<BarChartModelSongs> songData = [];

  _TaskDashboardState() {
    getData().then((value) => setState(() {
          dataFuture = value;
        }));
  }

  // @override
  // void initState() {
  //   super.initState();

  //   dataFuture = getData();
  // }

  @override
  //Widget build(BuildContext context) {
  // print(dataFuture?.then((value) => x = value));
  // print(x);
  // print(dataFuture?.then((value) => x = value));
  //print(dataFuture);
  Widget build(BuildContext context) {
    final pl_count = dataFuture?["Total Play Lists"];
    final pl_names = dataFuture?["Play List Names"];
    final pl_likes = dataFuture?["Play List Likes"];
    final pl_song_cnt = dataFuture?["Total Song Count"];
    final pl_picture = dataFuture?["Play List Image Link"];
    print(dataFuture);
    while (pl_count == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Task-16',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.yellow.shade800,
          elevation: 16,
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
        body: Center(child: CircularProgressIndicator()),
      );
    }

    for (int index = 1; index <= pl_count; index++)
      likeData.add(BarChartModelLikes(
          name: "$index", //pl_names[index - 1],
          likes: pl_likes[index - 1],
          color: charts.ColorUtil.fromDartColor(Colors.green)));
    for (int index = 1; index <= pl_count; index++)
      songData.add(BarChartModelSongs(
          name: "$index", //pl_names[index - 1],
          songs: pl_song_cnt[index - 1],
          color: charts.ColorUtil.fromDartColor(Colors.green)));

    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "Finanacial",
        data: data,
        domainFn: (BarChartModel series, _) => series.year,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    List<charts.Series<BarChartModelLikes, String>> seriesLikes = [
      charts.Series(
        id: "Likes",
        data: likeData,
        domainFn: (BarChartModelLikes seriesLikes, _) => seriesLikes.name,
        measureFn: (BarChartModelLikes seriesLikes, _) => seriesLikes.likes,
        colorFn: (BarChartModelLikes seriesLikes, _) => seriesLikes.color,
      ),
    ];

    List<charts.Series<BarChartModelSongs, String>> seriesSongs = [
      charts.Series(
        id: "Number of Songs",
        data: songData,
        domainFn: (BarChartModelSongs seriesSongs, _) => seriesSongs.name,
        measureFn: (BarChartModelSongs seriesSongs, _) => seriesSongs.songs,
        colorFn: (BarChartModelSongs seriesSongs, _) => seriesSongs.color,
      ),
    ];
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            //automaticallyImplyLeading: false,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.audiotrack),
                ),
                Tab(icon: Icon(Icons.favorite)),
                Tab(icon: Icon(Icons.mic_external_on)),
                Tab(icon: Icon(Icons.info)),
              ],
            ),
            title: Text(
              'Task-16',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.yellow.shade800,
            elevation: 16,
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
              Scaffold(
                appBar: AppBar(
                  title: Center(child: Text("Saved Playlists")),
                  backgroundColor: Colors.yellow.shade800,
                ),
                body: Scrollbar(
                  child: ListView(
                    restorationId: 'list_demo_list_view',
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    children: [
                      for (int index = 1; index <= pl_count; index++)
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                // child: ListTile(
                                //   leading: ExcludeSemantics(
                                //     child: Image.network(pl_picture[index - 1]),
                                //   ),
                                //   title: Text(
                                //     pl_names[index - 1],
                                //   ),
                                // ),
                                //child: Image.network(pl_picture[index - 1]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Container(
                                  height: 130.0,
                                  width: 130.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(pl_picture[index - 1]),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              //child: Image(image: NetworkImage(pl_picture[index - 1]))),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Expanded(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Container(
                                          //   height: 170.0,
                                          //   width: 170.0,
                                          //   child: Text(
                                          //     pl_names[index - 1],
                                          //   ),
                                          // )
                                          Container(
                                            child: Text(
                                              "${pl_names[index - 1]}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),

                                          SizedBox(
                                            width: 80,
                                          ),
                                          Container(
                                            child: Flexible(
                                              child: Text(
                                                "Likes : ${pl_likes[index - 1]}",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Flexible(
                                              child: Text(
                                                "Number of Songs : ${pl_song_cnt[index - 1]}",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Scaffold(
                appBar: AppBar(
                  title: Center(child: Text("Number Of Likes")),
                  backgroundColor: Colors.yellow.shade800,
                ),
                body: Scrollbar(
                  child: ListView(
                    restorationId: 'list_demo_list_view',
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    children: [
                      Container(
                        height: 500,
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        child: charts.BarChart(
                          seriesLikes,
                          animate: true,
                          behaviors: [
                            new charts.SeriesLegend(
                              position: charts.BehaviorPosition.top,
                              horizontalFirst: false,
                              cellPadding:
                                  new EdgeInsets.only(right: 4.0, bottom: 4.0),
                              showMeasures: true,
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: DataTable(columns: [
                            DataColumn(
                                label: Text('ID',
                                    //overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Playlist Name',
                                    //overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Number Of Likes',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Number Of Songs',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                          ], rows: [
                            for (int index = 1; index <= pl_count; index++)
                              DataRow(cells: [
                                DataCell(Text('$index')),
                                DataCell(Text('${pl_names[index - 1]}')),
                                DataCell(Text('${pl_likes[index - 1]}')),
                                DataCell(Text('${pl_song_cnt[index - 1]}')),
                              ]),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Scaffold(
                appBar: AppBar(
                  title: Center(child: Text("Number Of Songs In Playlists")),
                  backgroundColor: Colors.yellow.shade800,
                ),
                body: Scrollbar(
                  child: ListView(
                    restorationId: 'list_demo_list_view',
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    children: [
                      Container(
                        height: 500,
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        child: charts.BarChart(
                          seriesSongs,
                          animate: true,
                          behaviors: [
                            new charts.SeriesLegend(
                              position: charts.BehaviorPosition.top,
                              horizontalFirst: false,
                              cellPadding:
                                  new EdgeInsets.only(right: 4.0, bottom: 4.0),
                              showMeasures: true,
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: DataTable(columns: [
                            DataColumn(
                                label: Text('ID',
                                    //overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Playlist Name',
                                    //overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Number Of Likes',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Number Of Songs',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                          ], rows: [
                            for (int index = 1; index <= pl_count; index++)
                              DataRow(cells: [
                                DataCell(Text('$index')),
                                DataCell(Text('${pl_names[index - 1]}')),
                                DataCell(Text('${pl_likes[index - 1]}')),
                                DataCell(Text('${pl_song_cnt[index - 1]}')),
                              ]),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Center(
                      child: Text(
                    "Info",
                    style: TextStyle(
                      color: Colors.black, // 2
                    ),
                  )),
                ),
                body: Scrollbar(
                  child: ListView(
                    restorationId: 'list_demo_list_view',
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    children: [
                      Text("The data is Scrollable in both axis"),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: DataTable(columns: [
                            DataColumn(
                                label: Text('ID',
                                    //overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Playlist Name',
                                    //overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Number Of Likes',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Number Of Songs',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                          ], rows: [
                            for (int index = 1; index <= pl_count; index++)
                              DataRow(cells: [
                                DataCell(Text('$index')),
                                DataCell(Text('${pl_names[index - 1]}')),
                                DataCell(Text('${pl_likes[index - 1]}')),
                                DataCell(Text('${pl_song_cnt[index - 1]}')),
                              ]),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Icon(Icons.directions_car),
              //Icon(Icons.directions_transit),
              //Icon(Icons.directions_bike),
            ],
          ),
          // body: Scrollbar(
          //   child: ListView(
          //     restorationId: 'list_demo_list_view',
          //     padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          //     children: [
          //       Container(
          //         height: 500,
          //         width: 100,
          //         padding: const EdgeInsets.all(10),
          //         child: charts.BarChart(
          //           seriesLikes,
          //           animate: true,
          //           behaviors: [
          //             new charts.SeriesLegend(
          //               position: charts.BehaviorPosition.top,
          //               horizontalFirst: false,
          //               cellPadding:
          //                   new EdgeInsets.only(right: 4.0, bottom: 4.0),
          //               showMeasures: true,
          //             )
          //           ],
          //         ),
          //       ),
          //       Container(
          //         height: 500,
          //         width: 100,
          //         padding: const EdgeInsets.all(10),
          //         child: charts.BarChart(
          //           seriesSongs,
          //           animate: true,
          //           behaviors: [
          //             new charts.SeriesLegend(
          //               position: charts.BehaviorPosition.top,
          //               horizontalFirst: false,
          //               cellPadding:
          //                   new EdgeInsets.only(right: 4.0, bottom: 4.0),
          //               showMeasures: true,
          //             )
          //           ],
          //         ),
          //       ),
          //       // Container(
          //       //   margin: EdgeInsets.all(20),
          //       //   child: Table(
          //       //     defaultColumnWidth: FixedColumnWidth(120.0),
          //       //     border: TableBorder.all(
          //       //         color: Colors.black, style: BorderStyle.solid, width: 2),
          //       //     children: [
          //       //       TableRow(children: [
          //       //         Column(children: [
          //       //           Text('Playlist Name', style: TextStyle(fontSize: 15.0))
          //       //         ]),
          //       //         Column(children: [
          //       //           Text('Playlist ID', style: TextStyle(fontSize: 15.0))
          //       //         ]),
          //       //         Column(children: [
          //       //           Text('Number Of Likes', style: TextStyle(fontSize: 15.0))
          //       //         ]),
          //       //       ]),
          //       //       TableRow(children: [
          //       //         Column(children: [Text('Javatpoint')]),
          //       //         Column(children: [Text('Flutter')]),
          //       //         Column(children: [Text('5*')]),
          //       //       ]),
          //       //       TableRow(children: [
          //       //         Column(children: [Text('Javatpoint')]),
          //       //         Column(children: [Text('MySQL')]),
          //       //         Column(children: [Text('5*')]),
          //       //       ]),
          //       //       TableRow(children: [
          //       //         Column(children: [Text('Javatpoint')]),
          //       //         Column(children: [Text('ReactJS')]),
          //       //         Column(children: [Text('5*')]),
          //       //       ]),
          //       //       for (int index = 1; index <= pl_count; index++)
          //       //         TableRow(children: [
          //       //           Column(children: [Text('${pl_names[index - 1]}')]),
          //       //           Column(children: [Text('$index')]),
          //       //           Column(children: [Text('${pl_likes[index - 1]}')]),
          //       //         ]),
          //       //     ],
          //       //   ),
          //       // ),
          //       SingleChildScrollView(
          //         scrollDirection: Axis.horizontal,
          //         child: Container(
          //           child: DataTable(columns: [
          //             DataColumn(
          //                 label: Text('ID',
          //                     //overflow: TextOverflow.ellipsis,
          //                     style: TextStyle(
          //                         fontSize: 15, fontWeight: FontWeight.bold))),
          //             DataColumn(
          //                 label: Text('Playlist Name',
          //                     //overflow: TextOverflow.ellipsis,
          //                     style: TextStyle(
          //                         fontSize: 15, fontWeight: FontWeight.bold))),
          //             DataColumn(
          //                 label: Text('Number Of Likes',
          //                     overflow: TextOverflow.ellipsis,
          //                     style: TextStyle(
          //                         fontSize: 15, fontWeight: FontWeight.bold))),
          //             DataColumn(
          //                 label: Text('Number Of Songs',
          //                     overflow: TextOverflow.ellipsis,
          //                     style: TextStyle(
          //                         fontSize: 15, fontWeight: FontWeight.bold))),
          //           ], rows: [
          //             for (int index = 1; index <= pl_count; index++)
          //               DataRow(cells: [
          //                 DataCell(Text('$index')),
          //                 DataCell(Text('${pl_names[index - 1]}')),
          //                 DataCell(Text('${pl_likes[index - 1]}')),
          //                 DataCell(Text('${pl_song_cnt[index - 1]}')),
          //               ]),
          //           ]),
          //         ),
          //       ),
          //       for (int index = 1; index <= pl_count; index++)
          //         Padding(
          //           padding: const EdgeInsets.all(0.0),
          //           child: Row(
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.all(1.0),
          //                 // child: ListTile(
          //                 //   leading: ExcludeSemantics(
          //                 //     child: Image.network(pl_picture[index - 1]),
          //                 //   ),
          //                 //   title: Text(
          //                 //     pl_names[index - 1],
          //                 //   ),
          //                 // ),
          //                 //child: Image.network(pl_picture[index - 1]),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(vertical: 5.0),
          //                 child: Container(
          //                   height: 170.0,
          //                   width: 170.0,
          //                   decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                       image: NetworkImage(pl_picture[index - 1]),
          //                       fit: BoxFit.fill,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               //child: Image(image: NetworkImage(pl_picture[index - 1]))),
          //               Column(children: [
          //                 // Container(
          //                 //   height: 170.0,
          //                 //   width: 170.0,
          //                 //   child: Text(
          //                 //     pl_names[index - 1],
          //                 //   ),
          //                 // )

          //                 Text(pl_names[index - 1]),
          //                 Text("Likes : ${pl_likes[index - 1]}"),
          //                 Text("Number of Songs : ${pl_song_cnt[index - 1]}")
          //               ])
          //             ],
          //           ),
          //         ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}

class BarChartModel {
  String year;
  int financial;
  final charts.Color color;

  BarChartModel(
      {required this.year, required this.financial, required this.color});
}

class BarChartModelLikes {
  String name;
  int likes;
  final charts.Color color;

  BarChartModelLikes(
      {required this.name, required this.likes, required this.color});
}

class BarChartModelSongs {
  String name;
  int songs;
  final charts.Color color;

  BarChartModelSongs(
      {required this.name, required this.songs, required this.color});
}
