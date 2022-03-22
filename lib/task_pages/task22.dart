import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class TaskTwentyTwo extends StatefulWidget {
  const TaskTwentyTwo({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();

}


class _TaskDashboardState extends State<TaskTwentyTwo> {
  String url="";
  List _items = [];
  List<Tag> tagObjs=[];
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/file.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["item"];
    });
    String objText = '{"name": "bezkoder", "age": 30}';
    var tagObjsJson = jsonDecode(response)['item'] as List;
    tagObjs = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
    if (kDebugMode) {
      print(tagObjs);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: const Text(
          'Task-22',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints)
    {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                    children: <Widget>[
                      Container(
                          child: const Text(
                            'Discover',
                            style: TextStyle(
                              fontSize: 26.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          alignment: Alignment.topLeft,
                          padding:
                          const EdgeInsets.only(
                              left: 18.0, right: 5.0, bottom: 5, top: 5)),
                      Container(
                        child: const Text(
                          'Explore the Favourite Music of Rishav!',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        alignment: Alignment.topLeft,
                          padding:
                          const EdgeInsets.only(
                              left: 18.0, right: 5.0, bottom: 5)),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 18, right: 25, bottom: 10
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:12.0,left: 12.0,right:12.0),
                        child: SizedBox(
                          height: 350,
                          width: 350,
                          child: Center(
                            child:Container(

                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                SfCircularChart(
                                  title: ChartTitle(text: "No. of Likes",
                                  textStyle: TextStyle(fontSize: 12)),
                                    legend: Legend(isVisible: true,
                                    width: "10%",
                                    position: LegendPosition.bottom,
                                    isResponsive: false,
                                    overflowMode: LegendItemOverflowMode.wrap),
                                    series: <CircularSeries>[
                                      // Renders radial bar chart
                                      RadialBarSeries<Tag, String>(
                                        maximumValue: 100,
                                          dataSource: tagObjs,
                                          xValueMapper: (Tag data, _) => data.name,
                                          yValueMapper: (Tag data, _) => data.like,
                                          radius: '100%',
                                          innerRadius: '25%',
                                          cornerStyle: CornerStyle.endCurve,
                                          dataLabelSettings: DataLabelSettings(
                                            // Renders the data label
                                              isVisible: true
                                          ),
                                          gap:'3%',
                                          legendIconType: LegendIconType.seriesType,
                                      )
                                    ]
                                ),
                             ]),
                            decoration: BoxDecoration(

                               //DecorationImage
                              border: Border.all(
                                  color: Colors.white,
                                  width: 3.0,
                                  style: BorderStyle.solid), //Border.all

                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                              color: Colors.black12,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 50.0,
                              spreadRadius: 10.0,
                            ),
                                  //BoxShadow
                                BoxShadow(
                                  color: Colors.white,
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ],
                            ), //BoxDecoration
                          ), //Container
                        ), //SizedBox
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          height: 350,
                          width: 350,
                          child: Center(
                            child:Container(

                              child:
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    SfCartesianChart(
                                      title: ChartTitle(
                                          text:"No. of Tracks",
                                      textStyle: TextStyle(fontSize: 12)),
                                        primaryXAxis: CategoryAxis(),
                                        legend: Legend(isVisible: false,
                                            width: "30%",
                                            position: LegendPosition.bottom,
                                            isResponsive: true,
                                            overflowMode: LegendItemOverflowMode.wrap),
                                        series: <ChartSeries>[
                                          // Renders radial bar chart
                                          LineSeries<Tag, String>(
                                            enableTooltip: true,
                                            animationDuration: 2.5,
                                            animationDelay: 2.5,
                                            dataSource: tagObjs,
                                            xValueMapper: (Tag data, _) => data.name,
                                            yValueMapper: (Tag data, _) => data.track,
                                            dataLabelSettings: DataLabelSettings(
                                              // Renders the data label
                                                isVisible: true
                                            ),
                                            legendIconType: LegendIconType.seriesType,
                                          )
                                        ]
                                    ),
                                  ]),
                              decoration: BoxDecoration(

                                //DecorationImage
                                border: Border.all(
                                    color: Colors.white,
                                    width: 3.0,
                                    style: BorderStyle.solid), //Border.all

                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 50.0,
                                    spreadRadius: 10.0,
                                  ),
                                  //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ), //BoxDecoration
                            ), //Container
                          ), //SizedBox
                        ),
                      ),
                      //Padding
            Expanded(
                     child: Container(
                        clipBehavior: Clip.none,
                       height: 380,
                       width: 400,
                       child:_items.isNotEmpty
                          ?Flex(
                            direction: Axis.vertical,
                            children:[
                              Expanded(
                                child: ListView.builder(
                                  itemCount: _items.length,
                                  itemBuilder: (context, index) {
                                  return Card(
                                    margin: const EdgeInsets.only(left:10,right:10,top:5,bottom: 5),
                                    child: ListTile(
                                      isThreeLine: false,
                                      leading: CircleAvatar(
                                        radius: 30,
                                        foregroundImage: NetworkImage(_items[index]["image"]),
                                        ),
                                      title: Text(_items[index]["Name"]),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[Padding(padding: EdgeInsets.only(top:0),
                                        child:Text(_items[index]["Artist"]),),
                                            Padding(padding: EdgeInsets.only(top:0),
                                              child:Row(
                                                  children:[
                                              Padding(padding: EdgeInsets.only(top:0),
                                                    child:Text("Total Tracks   ")
                                              ),Padding(padding: EdgeInsets.only(top:0),
                                      child:Text(_items[index]["Tracks"].toString()))]),)]),
                                      trailing: Column(
                                        children:[Padding(padding: EdgeInsets.only(top:5),
                                        child:Icon(
                                          Icons.favorite,
                                        ),),
                                          Padding(padding: EdgeInsets.only(top:5),
                                          child:Text(
                                        _items[index]["Like"].toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black38),
                                      ),)
                                      ]),
                                        onTap: () =>launch(_items[index]["url"])
                              ),
                            );
                          },
                        ),
                      ), ])
                          : Container(),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.only(
                           topRight: Radius.circular(40.0),
                           bottomRight: Radius.circular(0),
                           topLeft: Radius.circular(40.0),
                           bottomLeft: Radius.circular(0),
                         ),
                         boxShadow: [BoxShadow(
                           color: Colors.black12,
                           offset: const Offset(
                             5.0,
                             5.0,
                           ),
                           blurRadius: 50.0,
                           spreadRadius: 10.0,
                         ),],
                       )
                     ),
            )]
                ),
              )
          )
      );
    }
    )
    );
  }
}

class Tag {
  String artist;
  String name;
  int like;
  String image;
  String url;
  int track;
  Tag(this.artist,this.name, this.like,this.image,this.url,this.track);
  factory Tag.fromJson(dynamic json) {
    return Tag(json['Artist'] as String,json['Name'] as String, json['Like'] as int,json['image'] as String,json['url'] as String,json['Tracks'] as int);
  }
  @override
  String toString() {
    return '{ ${this.name}, ${this.like}, ${this.track} }';
  }
}