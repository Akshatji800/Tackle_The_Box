import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:tackle_the_box/task-9/api_model.dart';
import 'package:tackle_the_box/task-9/constants.dart';

class BarChart extends StatefulWidget {
  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  var chart;

  Future<List<Item>> getChartData(widget) async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((data) => Item.fromJson(data)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
      future: getChartData(widget),
      builder: (context, dataapi) {
        return dataapi.hasData
            ? ShowChart(data: dataapi.data!)
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
      },
    );
  }
}

class ShowChart extends StatelessWidget {
  final List<Item> data;

  const ShowChart({required this.data});

  List<charts.Series<Item, String>> _creatingBarData(dataAPI) {
    return [
      charts.Series<Item, String>(
        data: dataAPI,
        id: 'songs',
        domainFn: (Item itemModel, _) => itemModel.name,
        measureFn: (Item itemModel, _) => itemModel.tracks.total,
        colorFn: (Item itemModel, _) =>
            charts.MaterialPalette.green.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: charts.BarChart(
        _creatingBarData(data),
        animate: true,
        animationDuration: const Duration(seconds: 1),
      ),
    );
  }
}
