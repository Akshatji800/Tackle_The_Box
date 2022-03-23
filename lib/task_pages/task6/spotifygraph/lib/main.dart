import 'package:flutter/material.dart';

import 'constants.dart';
import 'playlistDataModel.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

void task6() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: HomePage(),
    );
  }
}
