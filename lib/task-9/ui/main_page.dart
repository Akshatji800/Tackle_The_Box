import 'package:flutter/material.dart';
import 'package:tackle_the_box/task-9/api_call.dart';
import 'package:tackle_the_box/task-9/chart/bar_chart.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade100.withOpacity(.3),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.blue[400],
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 4,
                    offset: Offset(0, 8)),
              ],
            ),
            child: BarChart(),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              width: double.infinity,
              height: 345,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius:  const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 4,
                      offset: Offset(0, 8)),
                ],
              ),
              child: const ApiCall(),
            ),
          )
        ],
      ),
    );
  }
}
