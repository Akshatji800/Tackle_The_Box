import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Record {
  final String playlistName;
  final String imageURL;
  final int trackCount;
  final int followerCount;

  Record({
    required this.playlistName,
    required this.imageURL,
    required this.trackCount,
    required this.followerCount,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      playlistName: json['playlistName'] as String,
      imageURL: json['imageURL'] as String,
      trackCount: json['trackCount'] as int,
      followerCount: json['followerCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'playlistName': playlistName,
      'imageURL': imageURL,
      'trackCount': trackCount,
      'followerCount': followerCount
    };
  }
}

class RecordList {
  List<Record> records = [];

  RecordList({required this.records});

  factory RecordList.fromJson(List<dynamic> parsedJson) {
    List<Record> records = [];

    records = parsedJson.map((i) => Record.fromJson(i)).toList();

    return RecordList(
      records: records,
    );
  }
}

class RecordService {
  Future<String> _loadRecordsAsset() async {
    return await rootBundle.loadString('assets/data/spotifyPlaylistData.json');
  }

  Future<RecordList> loadRecords() async {
    String jsonString = await _loadRecordsAsset();
    final jsonResponse = json.decode(jsonString);
    RecordList records = RecordList.fromJson(jsonResponse['items']);
    return records;
  }
}
