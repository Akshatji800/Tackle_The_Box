import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tackle_the_box/task_boxes.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.black,
                Colors.grey.shade700,
                Colors.black,
              ])),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(),
                Image.asset("assets/logo.png",
                    width: double.infinity, height: 500),
                const CircularProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<Color>(Colors.lightBlue),
                )
              ]
          )
      ),
    );
  }

  checkLogin() async {
    Timer(
        const Duration(seconds: 2),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const TaskDashboard())));
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }
}