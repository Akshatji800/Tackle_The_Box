import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map> getData() async {
  // Have to find a way to hide this stuff
  const map = {
    "client_id": "d355eed5f9bd471db0f22cae934ac64d",
    "client_secret": "c33615f07d474e599370c2ad609ab252",
    "refresh_token":
        "AQAcup_MFZXyZVzrL6I_gGKCc2MZQrarvOPjeSUSmpWo2mQgYuA7QT5x0ASDvlqwHymOh_PCbUj6ocrqcVOU2H3rw3efSKhKqdHXb3fUo1hmiKLb4Fm9n6_UW_pYM5A-P1c",
    "grant_type": "refresh_token",
  };
  const dataforCalling = map;

  var tokenUrl = Uri.parse('https://accounts.spotify.com/api/token');
  var tokenResponse = await http.post(tokenUrl, body: dataforCalling);

  if (tokenResponse.statusCode != 200) {
    throw Exception('http.post error: statusCode= ${tokenResponse.statusCode}');
  }

  var accessToken =
      json.decode(tokenResponse.body).cast<String, dynamic>()['access_token'];

  var headersForRequests = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };

  var playlistUrl = Uri.parse('https://api.spotify.com/v1/me/playlists');
  var playlistResponse =
      await http.get(playlistUrl, headers: headersForRequests);

  final playlistData =
      json.decode(playlistResponse.body).cast<String, dynamic>();

  final noOfPlaylists = playlistData['total'];
  List<String> links = [];
  List<String> names = [];
  List<int> likes = [];
  List<int> songCount = [];
  List<String> imgLink = [];
  var trackNames = [];
  List<String> owners = [];
  List<int> s2 = [];

// Add names, links , song_count , playlistURLs(for getting followers)

  for (int i = 0; i < noOfPlaylists; i++) {
    names.add(playlistData['items'][i]['name']);
    imgLink.add(playlistData['items'][i]['images'][0]['url']);
    songCount.add(playlistData['items'][i]['tracks']['total']);
    links.add(playlistData['items'][i]['href']);
  }

// Add follower data

  for (int i = 0; i < noOfPlaylists; i++) {
    var playlistUrl = links[i];
    var playlistParsedUrl = Uri.parse(playlistUrl);

    var specificPlaylistResponse =
        await http.get(playlistParsedUrl, headers: headersForRequests);

    final specificPlaylistData =
        json.decode(specificPlaylistResponse.body).cast<String, dynamic>();

    likes.add(specificPlaylistData['followers']['total']);
    owners.add(specificPlaylistData['owner']['display_name']);
  }
  for (int i = 0; i < noOfPlaylists; i++) {
    var playlistUrl2 = links[i] + "/tracks";
    var playlistParsedUrl = Uri.parse(playlistUrl2);

    var specificPlaylistResponse =
        await http.get(playlistParsedUrl, headers: headersForRequests);

    final specificPlaylistData =
        json.decode(specificPlaylistResponse.body).cast<String, dynamic>();
    s2.add(specificPlaylistData['items'].length);
    for (int j = 0; j < specificPlaylistData['items'].length; j++) {
      trackNames.add(specificPlaylistData['items'][j]['track']['name']);
    }
  }

  int k = 0;
  int j = 0;
  var newlst = [];

  for (var i in s2) {
    k = k + i;

    newlst.add(trackNames.sublist(j, k));
    j = j + i;
  }

  var dataForOutput = {
    "count": noOfPlaylists,
    "names": names,
    "likes": likes,
    "song_count": songCount,
    "img_link": imgLink,
    "owner": owners,
    "tracks": newlst,
  };
  debugPrint('data fetched');

  return dataForOutput;
}
