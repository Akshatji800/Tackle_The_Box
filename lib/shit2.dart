import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  //file = File('/assets/suss.json');
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQCbMS6e_LB0vnwQQ50rqAoSjlJUt3-Qc0QvWlR8vtJmlHz3rz71n4dLCf5rkm29qa4ZXBW6WfTH_u5n25bJN7O7XAKS7piWL_tCOQqYAt_JjcQ66QqBtdGj66thb4xdKRFOjSqZQ_mSoNoE_VAMr5z1IKzArxCHi3Q',
  };
  var params = {
    'fields': 'description,name,tracks(total),followers(total)',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse(
      'https://api.spotify.com/v1/playlists/0eYa7x9rNE3kuKve4dfOV7?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200)
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  //print(res.body);
  var x = jsonDecode(res.body);
  var x1 = x['name'];
  print(x);
 
  //print(x);
  //print(x['followers']['total']);
  //Map<String, dynamic> dat = jsonDecode(res.body);
  //songs = '${dat['total']}';
  //print(songs);
}