import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';
import 'constants.dart';
import 'playlistDataModel.dart';
import 'homePage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  late int maxTracks;
  late int maxFollowers;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString(pathToJSON);
    final data = await json.decode(response);
    setState(() {
      maxTracks = data["maxTracks"];
      maxFollowers = data["maxFollowers"];
    });
  }

  final TextEditingController _filter = TextEditingController();
  final RecordList _records = RecordList(records: []);
  final RecordList _filteredRecords = RecordList(records: []);

  Widget _appBarTitle = Text(appTitle);

  @override
  void initState() {
    super.initState();

    _records.records = [];
    _filteredRecords.records = [];

    _getRecords();
    readJson();
  }

  void _getRecords() async {
    RecordList records = await RecordService().loadRecords();
    setState(() {
      for (Record record in records.records) {
        this._records.records.add(record);
        this._filteredRecords.records.add(record);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      backgroundColor: appColor1,
      body: _buildList(context),
      resizeToAvoidBottomInset: false,
    );
  }

  PreferredSizeWidget _buildBar(BuildContext context) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: appColor1,
      centerTitle: true,
      title: _appBarTitle,
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: this
          ._filteredRecords
          .records
          .map((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Record record) {
    return Card(
      key: ValueKey(record.playlistName),
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      child: Container(
        decoration: BoxDecoration(color: appColor1),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              child: Hero(
                  tag: "avatar_" + record.playlistName,
                  child: CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(record.imageURL),
                  ))),
          title: Text(
            record.playlistName,
            style: TextStyle(color: textColor2, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Flexible(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    LinearPercentIndicator(
                      width: 250.0,
                      lineHeight: 14.0,
                      percent: record.followerCount / maxFollowers,
                      leading: Icon(
                        Icons.favorite,
                        color: textColor2,
                      ),
                      trailing: RichText(
                        text: TextSpan(
                          text: '(follower count\t: ' +
                              record.followerCount.toString() +
                              ')',
                          style: TextStyle(color: textColor2),
                        ),
                      ),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      backgroundColor: appColor1,
                      progressColor: textColor2,
                    ),
                    LinearPercentIndicator(
                      width: 250.0,
                      lineHeight: 14.0,
                      percent: record.trackCount / maxTracks,
                      leading: Icon(
                        Icons.audiotrack,
                        color: textColor1,
                      ),
                      trailing: Text(
                        '(track count     \t\t: ' +
                            record.trackCount.toString() +
                            ')',
                        style: TextStyle(color: textColor1),
                      ),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      backgroundColor: appColor1,
                      progressColor: textColor1,
                    ),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
