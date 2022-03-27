// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class bodyForDetails extends StatefulWidget {
  const bodyForDetails(
      {Key? key,
      required this.count,
      required this.playlistName,
      required this.playlistImg,
      required this.playlistCount,
      required this.totalSongs,
      required this.followers,
      required this.owners})
      : super(key: key);
  final count;
  final playlistName;
  final playlistImg;
  final playlistCount;
  final totalSongs;
  final followers;
  final owners;

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
              // width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 43),
              height: size.width * 0.8,
              child: Container(
                // height: size.width * 0.7,
                // width: size.width * 0.7,

                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 20.0,
                      offset: Offset(10, 10),
                    ),
                  ],
                  color: Colors.black, //del_later
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(22),
                  image: DecorationImage(
                      image: NetworkImage(widget.playlistImg[widget.count]),
                      fit: BoxFit.fitHeight),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 43, vertical: 20),
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 20.0,
                      offset: Offset(10, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  // gradient: LinearGradient(
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //     // ignore: prefer_const_literals_to_create_immutables
                  //     colors: [
                  //       Color(0xff7A69C7),
                  //       Color(0xffb06ab3),
                  //     ]),
                  color: Colors.white,
                ),
                alignment: Alignment.topCenter,
                height: size.width * 0.5,
                // width: MediaQuery.of(context).size.width,
                // child: SingleChildScrollView(
                //   scrollDirection: Axis.vertical,
                // child: DataTable(
                //   columns: [
                //     DataColumn(
                //         label: Text('#',
                //             style: TextStyle(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.black))),
                //     DataColumn(
                //         label: Text('Song Name',
                //             style: TextStyle(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.black)))
                //   ],
                //   rows: [
                //     for (int counter = 1;
                //         counter <= widget.playlistCount;
                //         counter++)
                //       DataRow(cells: [
                //         DataCell(Text('$counter',
                //             style: TextStyle(color: Colors.black))),
                //         DataCell(Text(
                //             '${widget.playlistName[counter - 1]}',
                //             style: TextStyle(color: Colors.black))),
                //       ]),
                //   ],
                // ),
                // ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Spacer(),
                    Container(
                      // alignment: Alignment.topCenter,
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 25),
                      child: Text('${widget.playlistName[widget.count]}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ))),
                    ),
                    // Spacer(),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Songs: ${widget.totalSongs[widget.count]}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      child: Text(
                        'Followers: ${widget.followers[widget.count]}',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                    Container(
                      // padding: const EdgeInsets.symmetric(
                      //   horizontal: 5,
                      //   vertical: 15,
                      // ),
                      child: Text(
                        'By ${widget.owners[widget.count]}',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
