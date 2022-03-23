import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:tackle_the_box/linechart.dart';
import 'package:flutter/services.dart';

class Solution extends StatefulWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  State<Solution> createState() => _SolutionState();
}

class _SolutionState extends State<Solution> {
  List _items = [];
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'PLAYLISTS',
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Playlist Details'),
              onPressed: readJson,
              style: ElevatedButton.styleFrom(
                primary: Colors.red
              ),

            ),
            ElevatedButton(onPressed: () => LineChartWidget,child: const Text('Graph'),style: ElevatedButton.styleFrom(
                primary: Colors.red
            ),),

            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
              child:  ListView(children: <Widget>[
                Center(
                    child: Text(
                      'Spotify Playlists',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                DataTable(
                  columns: [
                    DataColumn(label: Text(
                        'Name',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    )),
                    DataColumn(label: Text(
                        'Owner',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    )),
                    DataColumn(label: Text(
                        'Tracks',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    )),
                    DataColumn(label: Text(
                        'Id',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    )),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text(_items[0]["name"])),
                      DataCell(Text(_items[0]["owner"]['display_name'])),
                      DataCell(Text(_items[0]["tracks"]['total'].toString())),
                      DataCell(Text(_items[0]["id"])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(_items[1]["name"])),
                      DataCell(Text(_items[1]["owner"]['display_name'])),
                      DataCell(Text(_items[1]["tracks"]['total'].toString())),
                      DataCell(Text(_items[1]["id"])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(_items[2]["name"])),
                      DataCell(Text(_items[2]["owner"]['display_name'])),
                      DataCell(Text(_items[2]["tracks"]['total'].toString())),
                      DataCell(Text(_items[2]["id"])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(_items[3]["name"])),
                      DataCell(Text(_items[3]["owner"]['display_name'])),
                      DataCell(Text(_items[3]["tracks"]['total'].toString())),
                      DataCell(Text(_items[3]["id"])),
                    ]),
                  ],
                ),
              ])
            )
                : Container()
          ],
        ),
      ),
    );
  }
}




