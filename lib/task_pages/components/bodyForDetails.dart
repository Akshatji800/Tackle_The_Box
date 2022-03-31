// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class bodyForDetails extends StatefulWidget {
  const bodyForDetails({
    Key? key,
    required this.count,
    required this.playlistName,
    required this.playlistImg,
    required this.playlistCount,
    required this.totalSongs,
    required this.followers,
    required this.owners,
    required this.tracks,
    required this.index,
  }) : super(key: key);
  final count;
  final playlistName;
  final playlistImg;
  final playlistCount;
  final totalSongs;
  final followers;
  final owners;
  final tracks;
  final index;

  @override
  _bodyForDetailsState createState() => _bodyForDetailsState();
}

class _bodyForDetailsState extends State<bodyForDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 203, 13, 236),
      body: Scrollbar(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 43),
              height: size.width * 0.8,
              child: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 20.0,
                      offset: Offset(10, 10),
                    ),
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(22),
                  image: DecorationImage(
                      image: NetworkImage(widget.playlistImg[widget.count]),
                      fit: BoxFit.fitHeight),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      alignment: Alignment.topCenter,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Text('#',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width / 4),
                            child: Text('Song Name',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: InteractiveViewer(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: DataTable(
                              dividerThickness: 0,
                              columnSpacing: 50,
                              headingRowHeight: 0,
                              columns: [
                                DataColumn(label: Text('')),
                                DataColumn(label: Text(''))
                              ],
                              rows: [
                                for (var j = 1;
                                    j <= widget.tracks[widget.index].length;
                                    j++)
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                          '$j',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          '${widget.tracks[widget.index][j - 1]}',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
