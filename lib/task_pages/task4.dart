import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class TaskFour extends StatefulWidget {
  const TaskFour({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: FutureBuilder(
          future: PlaylistItem.getPlaylist(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            } else {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: const Text(
                      "Anshuman (Task-4)",
                      style: TextStyle(fontSize: 17),
                    ),
                    backgroundColor: Colors.blueGrey,
                    systemOverlayStyle: SystemUiOverlayStyle.light,
                    floating: true,
                    centerTitle: false,
                    actions: [
                      TextButton.icon(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueGrey)),
                          label: Text('Follow me'),
                          onPressed: () => launch(
                              'https://open.spotify.com/user/bla2agijejjc9s8sbbespzz5f'),
                          icon: const Icon(
                            MdiIcons.spotify,
                            size: 33,
                            semanticLabel: 'Follow me',
                          ))
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                        height: 120,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 0.5,
                              ),
                              const Text(
                                "        Total Songs",
                                style: TextStyle(fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: 40,
                                      child: Text(
                                        398.toString(),
                                        textAlign: TextAlign.center,
                                      )),
                                  Container(
                                    height: 11,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 2,
                                        )),
                                    width: MediaQuery.of(context).size.width *
                                        0.73,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                              const Text(
                                "        Favorites",
                                style: TextStyle(fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: 40,
                                      child: Text(
                                        26.toString(),
                                        textAlign: TextAlign.center,
                                      )),
                                  Container(
                                    height: 11,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.pink,
                                          width: 2,
                                        )),
                                    width: MediaQuery.of(context).size.width *
                                        0.73 *
                                        (26 / 396),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1,
                              )
                            ],
                          ),
                          elevation: 8,
                        )),
                  ),
                  SliverList(
                    // pList.playlist    item
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        var iti = PlaylistItem.items[index];
                        return PlaylistTile(
                          index: index,
                        );
                      },
                      childCount: PlaylistItem.items.length,
                    ),
                  )
                ],
              );
            }
          },
        ));
  }
}

class Playlist {
  final String playlistId;
  final String imageUrl;
  final String title;
  final String owner;
  final int trackCount;
  final String playlistUrl;
  final String description;
  final int like;

  Playlist(this.playlistId, this.imageUrl, this.title, this.owner,
      this.trackCount, this.playlistUrl, this.description, this.like);
}

class Songs {
  final String title;
  final String id;
  final String artists;
  final String imageUrl;

  Songs(this.title, this.id, this.artists, this.imageUrl);
}

class PlaylistItem {
  static List<Playlist> _items = [];

  static List<Playlist> get items {
    return [..._items];
  }

  static List<Songs> _songItems = [];

  static List<Songs> get songItems {
    var l = _songItems;
    //_songItems.clear();
    return [..._songItems];
  }

// playlistid : 2RmTzxggEwc7mfy9K1LNa1
  static const userId = 'bla2agijejjc9s8sbbespzz5f';
  static const token =
      'Bearer BQBiAxsufjfjlvXvKqq_US9CrkZi2eoWOA7Vetjpijp8Dhv19abYct_IZGxBDoh1xLDScKDyy3Wst3-Y5nA1-RwrAq36bNgFHQuZifk_Q71XvVAFhgXJ6zVsECVCR5bU5fEXMTqCXRqk8JguUzXgrxksdSvaUK89pRlRXxs6UfwW-rY';

  static Future<void> getPlaylist() async {
    try {
      final url =
          Uri.parse('https://api.spotify.com/v1/users/$userId/playlists');
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
        'Accept': 'application/json'
      });
      //print(response);
      var data = await json.decode(response.body).cast<String, dynamic>();
      if (data == null) {
        return;
      }

      _items.clear();
      int a = 0;
      for (var p in data['items']) {
        _items.add(Playlist(
            p['id'],
            p['images'][0]['url'],
            p['name'],
            p['owner']['display_name'],
            int.parse(p['tracks']['total'].toString()),
            p['external_urls']['spotify'],
            p['description'],
            lik[a++]));
      }
    } catch (e) {
      print(e);
    }
  }

  static var lik = [7, 3, 5, 4, 6];
  static Future<void> getSongs(playlistId) async {
    try {
      final url = Uri.parse(
          'https://api.spotify.com/v1/playlists/$playlistId/tracks?market=IN&fields=items(track(name%2Chref%2Calbum(name%2Chref%2Cimages(url)%2Cartists(name))))');
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
        'Accept': 'application/json'
      });

      var data = await json.decode(response.body).cast<String, dynamic>();
      if (data == null) {
        return;
      }
      //print(data);
      var d = data['items'][1];
      _songItems.clear();
      for (var i in data['items']) {
        _songItems.add(Songs(
            i['track']['name'],
            i['track']['album']['id'].toString(),
            i['track']['album']['artists'][0]['name'],
            i['track']['album']['images'][0]['url']));
      }
    } catch (e) {
      print(e);
    }
  }
}

//the block

class PlaylistTile extends StatefulWidget {
  final int index;
  PlaylistTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<PlaylistTile> createState() => _PlaylistTileState();
}

class _PlaylistTileState extends State<PlaylistTile> {
  var _isExpanded = false;
  int _height = 160;
  void _expandIt(String id) async {
    if (_isExpanded) {
      setState(() {
        _isExpanded = !_isExpanded;
        _height = 160;
      });
    } else {
      PlaylistItem.getSongs(id);
      setState(() {
        _height = 329;
      });
      await Future.delayed(const Duration(milliseconds: 400), () {});
      setState(() {
        _isExpanded = !_isExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var list = PlaylistItem.items[widget.index];

    return GestureDetector(
      onDoubleTap: () {
        _expandIt(list.playlistId);
      },
      onTap: () {
        _expandIt(list.playlistId);
      },
      child: Stack(
        children: [
          AnimatedContainer(
            curve: Curves.decelerate,
            duration: Duration(milliseconds: 360),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 4,
                blurRadius: 5,
                offset: Offset(5, 7), // changes position of shadow
              ),
            ], color: Colors.green, borderRadius: BorderRadius.circular(15)),
            height: _height.toDouble(),
            child: Stack(
              children: [
                AnimatedContainer(
                  curve: Curves.decelerate,
                  duration: Duration(milliseconds: 350),
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                  height: _height.toDouble(),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(1, 0), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.40, 1, 1, 1),
                        child: ListTile(
                          title: Text(
                            list.title.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 14,
                              ),
                              Text('Owner: ${list.owner}'),
                              SizedBox(
                                height: 7,
                              ),
                              Text("${list.trackCount} Songs"),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                // height: 60,
                                //color: Colors.blue,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.pinkAccent,
                                    ),
                                    Container(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.pink,
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                          height: 7,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25 *
                                              (list.like / list.trackCount),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            color: Colors.grey[200]),
                                        alignment: Alignment.topLeft,
                                        height: 8,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          trailing: Container(
                            margin: EdgeInsets.fromLTRB(0, 13, 0, 0),
                            height: 25,
                            width: 25,
                            child: IconButton(
                              icon: _isExpanded
                                  ? const Icon(
                                      Icons.keyboard_arrow_up_outlined,
                                      color: Colors.blueGrey,
                                    )
                                  : const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.blueGrey,
                                    ),
                              onPressed: () {
                                _expandIt(list.playlistId);
                              },
                            ),
                          ),
                        ),
                      ),
                      _isExpanded
                          ? SongList(playlistId: list.playlistId)
                          : Container()
                    ],
                  ),
                  //children: [],
                ),
                Positioned(
                    right: 10,
                    top: -7,
                    child: IconButton(
                        onPressed: () => launch(list.playlistUrl.toString()),
                        icon: const Icon(
                          Icons.play_circle_filled_outlined,
                          size: 40,
                          color: Colors.green,
                        ),
                        tooltip: ("Listen")))
              ],
            ),
          ),
          Positioned(
              child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(14),
                color: Colors.yellow,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(list.imageUrl.toString()))),
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 155,
            //color: Colors.blue,
            width: 150,
          ))
        ],
      ),
    );
  }
}

//old
class SongList extends StatelessWidget {
  final String playlistId;
  const SongList({Key? key, required this.playlistId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var song = PlaylistItem.songItems;

    return FutureBuilder(
        future: PlaylistItem.getSongs(playlistId),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(
              color: Colors.green,
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(7)),
              height: 166,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: song.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 2),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Image.network(
                            song[index].imageUrl.toString(),
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.music_video_sharp),
                          ),
                        ),
                        title: Text(song[index].title.toString()),
                        trailing: Text(song[index].artists.toString()),
                      ),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.blueGrey))),
                    );
                  }),
            );
          }
        });
  }
}
