import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaskFourteen extends StatefulWidget {
  const TaskFourteen({Key? key}) : super(key: key);

  @override
  _TaskDashboardState createState() => _TaskDashboardState();
}



class _TaskDashboardState extends State<TaskFourteen> {
  late String stringResponse;

  apicall() async{
  http.Response response;
  response= http.get(Uri.parse("https://developer.spotify.com/documentation/web-api/reference/#/operations/get-playlist")); 
  stringResponse= response.body;
  }
@override
  void initState() {
    apicall();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task-14',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.yellow.shade800,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Center(
            child: Text(stringResponse.toString())

          )    
        
          )
        )
      );
  }
}