import 'dart:convert';
import 'package:http/http.dart' as http;


class GetTracks {
  static List<Songs> tracks = [];

  static Future<void> getTracks() async {
    final playlistId = '';
    final url = Uri.parse(
        'https://api.spotify.com/v1/playlists/$playlistId/tracks?market=IN&fields=items(track(name%2Chref%2Calbum(name%2Chref%2Cimages(url)%2Cartists(name))))');
    final token =
        '';
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    });

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString).cast<String, dynamic>();
      for (var i in jsonMap['items']) {
        tracks.add(Songs(
            i['track']['name'],
            i['track']['album']['artists'][0]['name'],
            i['track']['album']['images'][0]['url']));
      }
    } else {
      throw Exception(
          'Failed to get tracks. with status code ${response.statusCode}');
    }
  }
}

class Songs {
  final String title;

  final String artist;
  final String imageUrl;

  Songs(this.title, this.artist, this.imageUrl);
}
