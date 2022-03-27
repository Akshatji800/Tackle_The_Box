// ignore_for_file: prefer_const_constructors, unnecessary_new, camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'bodyForDetails.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({
    Key? key,
    required this.count,
    required this.playlistName,
    required this.playlistImg,
    required this.playlistCount,
    required this.totalSongs,
    required this.followers,
    required this.owners,
  }) : super(key: key);
  final count;
  final playlistName;
  final playlistImg;
  final playlistCount;
  final totalSongs;
  final followers;
  final owners;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 203, 13, 236),
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20),
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Platform.isIOS
                ? Icon(
                    CupertinoIcons.chevron_left,
                    size: 25,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.white,
                  ),
          ),
          centerTitle: true,
          title: Text('${widget.playlistName[widget.count]}',
              style: TextStyle(
                color: Colors.white,
              ))),
      body: bodyForDetails(
        count: widget.count,
        playlistName: widget.playlistName,
        playlistImg: widget.playlistImg,
        playlistCount: widget.playlistCount,
        totalSongs: widget.totalSongs,
        followers: widget.followers,
        owners: widget.owners,
      ),
    );
  }
}
