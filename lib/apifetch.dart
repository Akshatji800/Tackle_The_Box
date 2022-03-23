import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

var x;

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getUser(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Json Serializable'),
        centerTitle: true,
      ),
    );
  }

  parse() async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer BQB-KCvrLPm6jFcLb5ReYjYyFK1SfWEqy2kb7rUKqG9hBVu48zrQO-NJjr6L9MuMMI5Vy8DIE7sMkknfHfchspkYSXw5tqviTXP_pQzcVdLORiwVJubLpMlJt5pa1uKCZEGYok-1FGexe85k2nAVNyriJ9bSr0xyoe4lAZC-d1EkOLOcowPU',
    };
    var params = {
      'fields': 'name,tracks(total),followers(total)',
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url = Uri.parse(
        'https://api.spotify.com/v1/playlists/0eYa7x9rNE3kuKve4dfOV7?$query');
    var res = await http.get(url, headers: headers);
    if (res.statusCode == 200) {
      print(jsonEncode(res.body));
      return x = jsonDecode(res.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  getUser(BuildContext context) async {
    parse();
    // print(x);
    final file = await rootBundle.loadString(x);

    final json = jsonDecode(file);

    // print(json);
  }
}