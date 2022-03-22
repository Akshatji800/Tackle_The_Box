import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';
import 'dart:convert';

class TaskTwentyFour extends StatefulWidget {
  const TaskTwentyFour({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskTwentyFour> {
  Map mapResponse = {};
  //List itemsData = [];
  var itemsData = List.from(itemdata);
  /*Fetching Data
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Authorization':
        'Bearer BQDBxCk1DAqax8LdPVKCNVgLW7e4mJ1EJiH4HjTncDbxaOsY0Yr_b5sGebX5X2p47Xsu6ygqF8OjVqukqgoAeg3teNweRmJyaMzwJ8fHpRSXPSyfMcsByvOqcuKuskW7U2qvB9DXlEyyWsiMJFBsXJAf9IoLGHpMd46jgc4duqB0zWU'
  };
  Future fetchData() async {
    final response = await http.get(
        Uri.parse(
            'https://api.spotify.com/v1/users/tkpoehyrxnmjh3bxu10tfjcfm/playlists'),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        itemsData = mapResponse['items'];
      });
      ;
    } else {
      itemsData = List.from(itemdata);
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task-24',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.playlist_add,
              color: Colors.green,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlaylistPage()),
              );
            },
          )
        ],
      ),
      body: itemsData == null
          ? Container()
          : Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/members/Task24/Background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Your Current Playlists',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  itemsData[index]['images'][0]['url'],
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(
                                  width: 25,
                                  height: 125,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      itemsData[index]['name'],
                                      style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Total Tacks:' +
                                          itemsData[index]['tracks']['total']
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                      itemCount: itemsData == null ? 0 : itemsData.length,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/members/Task24/Background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Track Distribution',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                PieChart(
                  dataMap: trackspie,
                  animationDuration: const Duration(milliseconds: 800),
                  chartLegendSpacing: 50,
                  chartRadius: MediaQuery.of(context).size.width / 3.2,
                  colorList: colorList,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 30,
                  legendOptions: const LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: true,
                    decimalPlaces: 1,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'Follower Distribution per Playlist',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                PieChart(
                  dataMap: followersData,
                  animationDuration: const Duration(milliseconds: 800),
                  chartLegendSpacing: 50,
                  chartRadius: MediaQuery.of(context).size.width / 3.2,
                  colorList: colorList,
                  legendOptions: const LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValuesOutside: true,
                    showChartValuesInPercentage: true,
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const alertmsg =
    'This App basically Shows the playlists of a given user, With Graph analytics which can be accessed with the list icon on the right hand side of the AppBar';

List itemdata = [
  {
    'collaborative': 'False',
    'description': 'Camila Cabello is on top of the Hottest 50!',
    'external_urls': {
      'spotify': 'https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M'
    },
    'href': 'https://api.spotify.com/v1/playlists/37i9dQZF1DXcBWIGoYBM5M',
    'id': '37i9dQZF1DXcBWIGoYBM5M',
    'images': [
      {
        'height': 'None',
        'url':
            'https://i.scdn.co/image/ab67706f00000003bd5e3afef1dab26f4c78feec',
        'width': 'None'
      }
    ],
    'name': "Today's Top Hits",
    'owner': {
      'display_name': 'Spotify',
      'external_urls': {'spotify': 'https://open.spotify.com/user/spotify'},
      'href': 'https://api.spotify.com/v1/users/spotify',
      'id': 'spotify',
      'type': 'user',
      'uri': 'spotify:user:spotify'
    },
    'primary_color': 'None',
    'public': 'False',
    'snapshot_id':
        'MTY0Nzg2NjM4OSwwMDAwMDUyYzAwMDAwMTdmYWM3ZGEzY2UwMDAwMDE3Zjk4YTI4ZDc3',
    'tracks': {
      'href':
          'https://api.spotify.com/v1/playlists/37i9dQZF1DXcBWIGoYBM5M/tracks',
      'total': 50
    },
    'type': 'playlist',
    'uri': 'spotify:playlist:37i9dQZF1DXcBWIGoYBM5M'
  },
  {
    'collaborative': 'True',
    'description': 'Sound Matters!',
    'external_urls': {
      'spotify': 'https://open.spotify.com/playlist/6a4eUYA7xIKeCCmA4zocFr'
    },
    'href': 'https://api.spotify.com/v1/playlists/6a4eUYA7xIKeCCmA4zocFr',
    'id': '6a4eUYA7xIKeCCmA4zocFr',
    'images': [
      {
        'height': 'None',
        'url':
            'https://i.scdn.co/image/ab67706c0000bebb49c2c1a166f460120fafdbf1',
        'width': 'None'
      }
    ],
    'name': 'Insdrs',
    'owner': {
      'display_name': 'rageresistance',
      'external_urls': {
        'spotify': 'https://open.spotify.com/user/9bsq38qx5q7abeg3b9180by0p'
      },
      'href': 'https://api.spotify.com/v1/users/9bsq38qx5q7abeg3b9180by0p',
      'id': '9bsq38qx5q7abeg3b9180by0p',
      'type': 'user',
      'uri': 'spotify:user:9bsq38qx5q7abeg3b9180by0p'
    },
    'primary_color': 'None',
    'public': 'False',
    'snapshot_id':
        'MzM1LDQwNWYzYWIwNjNkMWJlODZmNjgwZDU3MTNlNTY1OGRmYzk3MmUyMWY=',
    'tracks': {
      'href':
          'https://api.spotify.com/v1/playlists/6a4eUYA7xIKeCCmA4zocFr/tracks',
      'total': 86
    },
    'type': 'playlist',
    'uri': 'spotify:playlist:6a4eUYA7xIKeCCmA4zocFr'
  },
  {
    'collaborative': 'False',
    'description': 'Top tracks that gamers love. ',
    'external_urls': {
      'spotify': 'https://open.spotify.com/playlist/37i9dQZF1DWTyiBJ6yEqeu'
    },
    'href': 'https://api.spotify.com/v1/playlists/37i9dQZF1DWTyiBJ6yEqeu',
    'id': '37i9dQZF1DWTyiBJ6yEqeu',
    'images': [
      {
        'height': 'None',
        'url':
            'https://i.scdn.co/image/ab67706f0000000376be4efc229494f1a48f4109',
        'width': 'None'
      }
    ],
    'name': 'Top Gaming Tracks',
    'owner': {
      'display_name': 'Spotify',
      'external_urls': {'spotify': 'https://open.spotify.com/user/spotify'},
      'href': 'https://api.spotify.com/v1/users/spotify',
      'id': 'spotify',
      'type': 'user',
      'uri': 'spotify:user:spotify'
    },
    'primary_color': 'None',
    'public': 'False',
    'snapshot_id':
        'MTY0Nzk2MDA5MywwMDAwMDAwMGQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0Mjdl',
    'tracks': {
      'href':
          'https://api.spotify.com/v1/playlists/37i9dQZF1DWTyiBJ6yEqeu/tracks',
      'total': 100
    },
    'type': 'playlist',
    'uri': 'spotify:playlist:37i9dQZF1DWTyiBJ6yEqeu'
  },
  {
    'collaborative': 'False',
    'description': '',
    'external_urls': {
      'spotify': 'https://open.spotify.com/playlist/0cPSm2vsuKd7wmBXcge6bQ'
    },
    'href': 'https://api.spotify.com/v1/playlists/0cPSm2vsuKd7wmBXcge6bQ',
    'id': '0cPSm2vsuKd7wmBXcge6bQ',
    'images': [
      {
        'height': 640,
        'url':
            'https://i.scdn.co/image/ab67616d0000b27301bd26c1b83918e0e4afd3ce',
        'width': 640
      }
    ],
    'name': 'All Over The Place',
    'owner': {
      'display_name': 'Vyshnav',
      'external_urls': {
        'spotify': 'https://open.spotify.com/user/tkpoehyrxnmjh3bxu10tfjcfm'
      },
      'href': 'https://api.spotify.com/v1/users/tkpoehyrxnmjh3bxu10tfjcfm',
      'id': 'tkpoehyrxnmjh3bxu10tfjcfm',
      'type': 'user',
      'uri': 'spotify:user:tkpoehyrxnmjh3bxu10tfjcfm'
    },
    'primary_color': 'None',
    'public': 'True',
    'snapshot_id': 'Miw0MTkzZTBlY2MwNTdjN2FiNDYyMjc1ZDI5NDMxOTc3NjEyOGVhZWM0',
    'tracks': {
      'href':
          'https://api.spotify.com/v1/playlists/0cPSm2vsuKd7wmBXcge6bQ/tracks',
      'total': 15
    },
    'type': 'playlist',
    'uri': 'spotify:playlist:0cPSm2vsuKd7wmBXcge6bQ'
  },
  {
    'collaborative': 'False',
    'description':
        'Spotify Wrapped presents the songs that you loved most this year.',
    'external_urls': {
      'spotify': 'https://open.spotify.com/playlist/37i9dQZF1EUMDoJuT8yJsl'
    },
    'href': 'https://api.spotify.com/v1/playlists/37i9dQZF1EUMDoJuT8yJsl',
    'id': '37i9dQZF1EUMDoJuT8yJsl',
    'images': [
      {
        'height': 'None',
        'url': 'https://lineup-images.scdn.co/wrapped-2021-top100_LARGE-en.jpg',
        'width': 'None'
      }
    ],
    'name': 'Your Top Songs 2021',
    'owner': {
      'display_name': 'Spotify',
      'external_urls': {'spotify': 'https://open.spotify.com/user/spotify'},
      'href': 'https://api.spotify.com/v1/users/spotify',
      'id': 'spotify',
      'type': 'user',
      'uri': 'spotify:user:spotify'
    },
    'primary_color': 'None',
    'public': 'False',
    'snapshot_id': 'MCwwMDAwMDAwMGQwN2FkN2RhYTFkNWNiN2ZmMGRlYmJmNmVkNTc4NDA4',
    'tracks': {
      'href':
          'https://api.spotify.com/v1/playlists/37i9dQZF1EUMDoJuT8yJsl/tracks',
      'total': 100
    },
    'type': 'playlist',
    'uri': 'spotify:playlist:37i9dQZF1EUMDoJuT8yJsl'
  },
  {
    'collaborative': 'False',
    'description': '',
    'external_urls': {
      'spotify': 'https://open.spotify.com/playlist/5AP1S3nH0qbIZc468fXJ6X'
    },
    'href': 'https://api.spotify.com/v1/playlists/5AP1S3nH0qbIZc468fXJ6X',
    'id': '5AP1S3nH0qbIZc468fXJ6X',
    'images': [
      {
        'height': 640,
        'url':
            'https://mosaic.scdn.co/640/ab67616d0000b273495ce6da9aeb159e94eaa453ab67616d0000b2738863bc11d2aa12b54f5aeb36ab67616d0000b27396e7bf531db05c85c5dd4cc1ab67616d0000b273a91c10fe9472d9bd89802e5a',
        'width': 640
      },
      {
        'height': 300,
        'url':
            'https://mosaic.scdn.co/300/ab67616d0000b273495ce6da9aeb159e94eaa453ab67616d0000b2738863bc11d2aa12b54f5aeb36ab67616d0000b27396e7bf531db05c85c5dd4cc1ab67616d0000b273a91c10fe9472d9bd89802e5a',
        'width': 300
      },
      {
        'height': 60,
        'url':
            'https://mosaic.scdn.co/60/ab67616d0000b273495ce6da9aeb159e94eaa453ab67616d0000b2738863bc11d2aa12b54f5aeb36ab67616d0000b27396e7bf531db05c85c5dd4cc1ab67616d0000b273a91c10fe9472d9bd89802e5a',
        'width': 60
      }
    ],
    'name': 'Random.',
    'owner': {
      'display_name': 'Vyshnav',
      'external_urls': {
        'spotify': 'https://open.spotify.com/user/tkpoehyrxnmjh3bxu10tfjcfm'
      },
      'href': 'https://api.spotify.com/v1/users/tkpoehyrxnmjh3bxu10tfjcfm',
      'id': 'tkpoehyrxnmjh3bxu10tfjcfm',
      'type': 'user',
      'uri': 'spotify:user:tkpoehyrxnmjh3bxu10tfjcfm'
    },
    'primary_color': 'None',
    'public': 'True',
    'snapshot_id':
        'MTAsMDUwNTFlMmFjMjA4ZTY2NTQzMzRmOWI3ZDk3NzNhZGZlYWU0OTNkMw==',
    'tracks': {
      'href':
          'https://api.spotify.com/v1/playlists/5AP1S3nH0qbIZc468fXJ6X/tracks',
      'total': 9
    },
    'type': 'playlist',
    'uri': 'spotify:playlist:5AP1S3nH0qbIZc468fXJ6X'
  },
  {
    'collaborative': 'True',
    'description': '',
    'external_urls': {
      'spotify': 'https://open.spotify.com/playlist/1ZU0mfic945Ev7qkSjIZhE'
    },
    'href': 'https://api.spotify.com/v1/playlists/1ZU0mfic945Ev7qkSjIZhE',
    'id': '1ZU0mfic945Ev7qkSjIZhE',
    'images': [
      {
        'height': 640,
        'url':
            'https://mosaic.scdn.co/640/ab67616d0000b273107d930ebe7cba0ff31c605cab67616d0000b27323852b7ef0ecfe29d38d97eeab67616d0000b273a787f718fb485b66d6219247ab67616d0000b273ff8d8c5662a96d41433e9ee1',
        'width': 640
      },
      {
        'height': 300,
        'url':
            'https://mosaic.scdn.co/300/ab67616d0000b273107d930ebe7cba0ff31c605cab67616d0000b27323852b7ef0ecfe29d38d97eeab67616d0000b273a787f718fb485b66d6219247ab67616d0000b273ff8d8c5662a96d41433e9ee1',
        'width': 300
      },
      {
        'height': 60,
        'url':
            'https://mosaic.scdn.co/60/ab67616d0000b273107d930ebe7cba0ff31c605cab67616d0000b27323852b7ef0ecfe29d38d97eeab67616d0000b273a787f718fb485b66d6219247ab67616d0000b273ff8d8c5662a96d41433e9ee1',
        'width': 60
      }
    ],
    'name': 'Insdrs',
    'owner': {
      'display_name': 'Vyshnav',
      'external_urls': {
        'spotify': 'https://open.spotify.com/user/tkpoehyrxnmjh3bxu10tfjcfm'
      },
      'href': 'https://api.spotify.com/v1/users/tkpoehyrxnmjh3bxu10tfjcfm',
      'id': 'tkpoehyrxnmjh3bxu10tfjcfm',
      'type': 'user',
      'uri': 'spotify:user:tkpoehyrxnmjh3bxu10tfjcfm'
    },
    'primary_color': 'None',
    'public': 'False',
    'snapshot_id':
        'MzEsODFjODhhMGQzNzUzYTY3YTg1NmU2MTFiNGVkZTJjZmNlM2EwYjhlZA==',
    'tracks': {
      'href':
          'https://api.spotify.com/v1/playlists/1ZU0mfic945Ev7qkSjIZhE/tracks',
      'total': 25
    },
    'type': 'playlist',
    'uri': 'spotify:playlist:1ZU0mfic945Ev7qkSjIZhE'
  }
];

Map<String, double> trackspie = {
  'Insdrs': 86,
  'Top Gaming Tracks': 100,
  'All Over The Place': 15,
  'Your Top Songs 2021': 100,
  'Random.': 9,
  "Today's Top Hits": 50
};

final colorList = <Color>[
  Color(0xfffdcb6e),
  Color(0xff0984e3),
  Color(0xfffd79a8),
  Color(0xffe17055),
  Color(0xff6c5ce7),
  Color(0x7f6c5cff)
];

Map<String, double> followersData = {
  "Today's Top Hits": 30687919,
  'Insdrs': 1,
  'Top Gaming Tracks': 4205427,
  'All Over The Place': 0,
  'Your Top Songs 2021': 0,
  'Random.': 0
};
