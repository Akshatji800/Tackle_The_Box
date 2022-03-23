import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:tackle_the_box/task_pages/allTasks.dart';
String img_URL2 = "https://cdn.dribbble.com/users/2207/screenshots/2254886/media/74403b1f22eb0d52e3feaabb47a42bc4.gif";
String img_URL = "https://assets.teenvogue.com/photos/57e3fd61940fe4b8164defc0/16:9/w_1,c_limit/instagram-likes.gif";
Future<Map> getPlayListData() async{
  var body = {
    'client_id': 'd222926687f84c3f8ae0febace492438',
    'client_secret': 'ef66e0f85a2d4b1ca2b27db289dfb183',
    'grant_type': 'refresh_token',
    'refresh_token': 'AQAXIW20OkJm8dZgJJ32ppPFhX7Kzs0XAmTArIvgeujnxa8stCWRrtaEVvLzkLltFPTg8vt31Uw7SI1ObmDoePSE-hZTrB1dcPVO-udPa0Vpmf2vsfFkDCOhSlm7O8XF_LU',
    'code': 'AQA6SyreuojSCO8U-mNI7QcJhGbz6U1Jcd05vXjB8EBptWZvXlS3NEvF-c7n_X4FdDPE2OmuDstzYOvhGJOpNpWqutNxfae6zEHftHGHUQ3oJVaHI7QHfHM_F2bbOAme872IsU_z12LRTWtef-PPGOaF31nw8Ie1ORz73ZtqcwGVRIrx0v4Hj5X4XvnqpvGP6c-IT6PvaZSkdLLd2xSQZa02BNOx40DjZE4L9gW66Y2wA4DWH_ewW7rS6T2AhR-yxonJjxbOI-aWEdcL-aD1ik9M81qy6YYNo3cpOgRXMkE5KoIIHZ0SsI5yhEFas6BLTNp_mKuM081HSOYxNc374pqmfgx8pK8_jCMSd8tFSepMNONACK7_NapsZoj4fOpBhlRq9vbfirloTqyAbMUfjiMPiI6MKoNoH1W-StRdI-hZzHn5oII',
    'redirect_uri': 'http://mysite.com/callback/',
  };
  var uri2 = Uri.parse('https://accounts.spotify.com/api/token');
  var response2 = await http.post(uri2, body: body);
  if(response2.statusCode!=200)
    throw Exception('error: StatusCode=${response2.statusCode}');
  // print(response2.body);
  final parsed = json.decode(response2.body).cast<String, dynamic>();
  // print(parsed['access_token']);
  // print(parsed['refresh_token']);
  final access_token = parsed['access_token'];




  // final access_token = "BQBoJmHVF-5VqdcOyaxj5_2eDTXTVyOOsFmQii5mPlNn8LxHWoi4YRQJNCuqS_XFbOZhepcKR3D_iN7710672DSW6PRN-7kseRiiyLB4NUqHzqB3O-uRP28VpXgyyIPBLyotN1zJ8slhcVfhPredcTZyE6z_28ILCU5LA_v6HH2FG0ofE0z4dTZvjxgkN4mMNRD7CqarBY-XKyn-ypCI_Q";
  final url = "https://api.spotify.com/v1/me/playlists";
  Map<String, String> HEADERS = {'Content-Type':'application/json','Authorization': ('Bearer ' + access_token)};
  Map params = {'limit':20};
  var response = await http.get(Uri.parse(url), headers: HEADERS);
  if(response.statusCode!=200){
    throw Exception('Failed to load the playlists');
  }
  final Playdata = json.decode(response.body).cast<String, dynamic>();

  // print(Playdata['items'][0]['tracks']['total']);
  // String name = Playdata['items'][0]['name'];
  // print(name);
  // print(Playdata['items'][0]['owner']['href']);
  // print(Playdata['items'][0]['external_urls']);
  var total = Playdata['total'];
  List<String> playlist_links = [];
  List<String> playlist_name = [];
  List<int> playlist_likes = [];
  List<int> playlist_song_count = [];
  List<String> playlist_pic_link = [];
  List<String> playlist_spotify_link = [];
  // print(total);
  for(int i=0;i<20;i++){
    playlist_song_count.add(Playdata['items'][i]['tracks']['total']);
    playlist_name.add(Playdata['items'][i]['name']);
    playlist_links.add(Playdata['items'][i]['owner']['href']);
  }
  print(playlist_song_count);
  final pl_count = total;
  final pl_links_api = playlist_links;
  final pl_names = playlist_name;
  final pl_likes = playlist_likes;
  final pl_song_cnt = playlist_song_count;
  final pl_image_link = playlist_pic_link;
  final pl_links_spotify = playlist_spotify_link;
  print(pl_links_spotify);
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
    "Play List Link": pl_links_spotify,
  };
  //print(pl_image_link);
  return await output;




}

class Playlist{
  final String name;
  final int total;

  const Playlist({
    required this.name,
    required this.total,
});
  factory Playlist.fromJson(Map<String, dynamic> json){
    return Playlist(
        name: json['items'][0]['name'],
        total: json['total'],
    );
  }
}
class TaskSeventeen extends StatefulWidget {
  const TaskSeventeen({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();

}


class _TaskDashboardState extends State<TaskSeventeen> {
  Map? dataFuture;
  Future<void>? _launched;
  // late Future<Map> futurePlaylist;

  _TaskDashboardState(){
    getPlayListData().then((value)=>setState((){
      dataFuture = value;
    }));

  // @override
  // void initState(){
  //   super.initState();
  //
  // }

  }



  @override
  Widget build(BuildContext context) {
    final pl_count = dataFuture?["Total Play Lists"];
    final pl_names = dataFuture?["Play List Names"];
    final pl_likes = dataFuture?["Play List Likes"];
    final pl_song_cnt = dataFuture?["Total Song Count"];
    final pl_picture = dataFuture?["Play List Image Link"];
    final pl_link = dataFuture?["Play List Link"];
    print(dataFuture);
    return Scaffold(

      appBar: AppBar(

        title: const Text(
          'Spotify Api',
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
        body: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            padding: EdgeInsets.symmetric(horizontal: 4.0,vertical: 8.0),
            itemBuilder: (c,i){
              if(i==2 || i==1) {
                return Container(
                  // color: i%2==0? Colors.black: Colors.deepOrange,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.favorite),

                              // Icon(Icons.favorite),
                              Text(pl_count.toString(),
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 20.0,
                                  ))
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 5.0),
                            blurRadius: 6.0
                        )
                      ]
                  ),

                );
              }

              else{
                return Container(
                  // color: i%2==0? Colors.black: Colors.deepOrange,

                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      DataTable(
                          columns:[DataColumn(label: Text('Name'),),
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('Followers'),),
                            DataColumn(label: Text('Tracks'),)],
                          rows: [
                            for(int index = 0;index<=10;index++)
                              DataRow(cells:[
                                DataCell(Text('$index')),
                                DataCell(Text('${pl_names[index]}')),
                                DataCell(Text('Hello')),
                                DataCell(Text('${pl_song_cnt[index]}')),
                              ])
                          ]),
                    ],
                  ),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 5.0),
                            blurRadius: 6.0
                        )
                      ]
                  ),

                );
              }
            },
            staggeredTileBuilder:(index){
              if(index==0){
              return StaggeredTile.count(2, 4);}
              if(index<=2 && index>=1){
                return StaggeredTile.count(1, 1);
              }
            },

        ),
        // body: Container(
        //   child: Column(children: <Widget>[
        //     Flexible(
        //       child: Container(
        //
        //         padding: const EdgeInsets.all(8.0),
        //         child: TextField(
        //           controller: _playlistTextController,
        //           // onSubmitted: updateTOD,
        //           decoration: const InputDecoration(
        //               enabledBorder: OutlineInputBorder(
        //                 borderSide: BorderSide(
        //                     color: Color.fromARGB(255, 77, 201, 81),
        //                     width: 2.0),
        //               ),
        //               hintText: 'Enter Plalist Name'),
        //
        //           // onSubmitted: (playlistTextController.text) {},
        //         ),
        //       ),
        //     ),
        //     Center(
        //
        //       child: FutureBuilder<Playlist>(
        //         future: futurePlaylist,
        //         builder: (context, snapshot) {
        //           if (snapshot.hasData) {
        //             return Text((snapshot.data!.name) + (snapshot.data!.total.toString()));
        //           } else if (snapshot.hasError) {
        //             return Text('${snapshot.error}');
        //           }
        //
        //           // By default, show a loading spinner.
        //           return const CircularProgressIndicator();
        //         },
        //       ),
        //     ),
        //   ]),
        // )


    );
  }
}
class Data{
  final String name, total;
  Data(this.name, this.total);
}