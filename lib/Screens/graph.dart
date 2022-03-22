import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class Graph extends StatelessWidget {
  const Graph({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Scaffold(body: SfCartesianChart(//series: <ChartSeries>[
          //LineSeries<SongData, double>( //dataSource: chartData,
            //xValueMapper: (SongData songs, _) => songs.year,
            //yValueMapper: (SongData songs, _) => songs.songs)
        //],
        ),
        )
      //Text(
      //  "Graph",
      // style: TextStyle(fontSize: 40,color: Colors.yellow),
      //),
    );
  }
}


