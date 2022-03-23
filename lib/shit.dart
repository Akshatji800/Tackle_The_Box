import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

void main() async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQDX5Kc9suLnvCWKFa1tvyTb4bWwnsWdzqmCeRxMOaMNgx256fl9HSJVMCJbumzrmiFoQnhoU0-NRp3pJNudVJhYunpF67Znct8w7RxBgyNpAdTU2kd4i_5b4nP9n_lKcSldRkPGMGDaxTlJJBK1NKU1MH5zg9cHfrGJFiudWZStq2FbBsGx175RZA',
  };
  var params = {
    'fields': 'name,tracks(total),followers(total)',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url1 = Uri.parse(
      'https://api.spotify.com/v1/playlists/0eYa7x9rNE3kuKve4dfOV7?$query'); //You
  var url2 = Uri.parse(
      'https://api.spotify.com/v1/playlists/1B8bcQz65Pjhd5DTc5cQaZ?$query'); //dancing with your long lost love
  var url3 = Uri.parse(
      'https://api.spotify.com/v1/playlists/23BliEjdvxhphQ1PCxNKfi?$query'); //james&alyssa
  var url4 = Uri.parse(
      'https://api.spotify.com/v1/playlists/2PpwIA5slwJAb8rFcKwtPu?$query'); //MAGNESIUM
  var url5 = Uri.parse(
      'https://api.spotify.com/v1/playlists/6xa5r0NstnF3g51MLzg5Cp?$query'); //Telugu songs
  var url6 = Uri.parse(
      'https://api.spotify.com/v1/playlists/4bW2mF404vsOdYpGq1JqM0?$query'); //Douple
  var res1 = await http.get(url1, headers: headers);
  var res2 = await http.get(url2, headers: headers);
  var res3 = await http.get(url3, headers: headers);
  var res4 = await http.get(url4, headers: headers);
  var res5 = await http.get(url5, headers: headers);
  var res6 = await http.get(url6, headers: headers);
  if (res1.statusCode == 200) {
    var x1 = jsonEncode(jsonDecode(res1.body));
    var x2 = jsonEncode(jsonDecode(res2.body));
    var x3 = jsonEncode(jsonDecode(res3.body));
    var x4 = jsonEncode(jsonDecode(res4.body));
    var x5 = jsonEncode(jsonDecode(res5.body));
    var x6 = jsonEncode(jsonDecode(res6.body));
    //print(x1);
    File('assets/suss.json').writeAsStringSync('{ "items": [' + '$x1');
    File('assets/suss.json')
        .writeAsStringSync(',' + '$x2', mode: FileMode.append);
    File('assets/suss.json')
        .writeAsStringSync(',' + '$x3', mode: FileMode.append);
    File('assets/suss.json')
        .writeAsStringSync(',' + '$x4', mode: FileMode.append);
    File('assets/suss.json')
        .writeAsStringSync(',' + '$x5', mode: FileMode.append);
    File('assets/suss.json')
        .writeAsStringSync(',' + '$x6' + ']}', mode: FileMode.append);
  } else if (res1.statusCode != 401) {
    throw Exception('http.get error: statusCode= ${res1.statusCode}');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/suss.json');
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
          'Kindacode.com',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Load Data'),
              onPressed: readJson,
            ),

            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            leading: Text(
                                _items[index]["followers"]["total"].toString()),
                            title: Text(_items[index]["name"]),
                            subtitle: Text(_items[index]["tracks"]["total"]),
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}