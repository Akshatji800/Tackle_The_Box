import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tackle_the_box/task-9/api_model.dart';
import 'package:tackle_the_box/task-9/constants.dart';

class ApiCall extends StatefulWidget {
  const ApiCall({Key? key}) : super(key: key);

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  Future<Json>? _jsonModel;

  @override
  void initState() {
    GetData _getData = GetData();
    _jsonModel = _getData.apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Json>(
      future: _jsonModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.items.length,
            itemBuilder: (context, index) {
              var item = snapshot.data?.items[index];
              String name = item!.name;
              String description = item.description;
              return Card(
                margin: const EdgeInsets.all(8),
                color: Colors.grey.shade100,
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }
}

class GetData {
  Future<Json> apiCall() async {
    var client = http.Client();
    var jsonModel;
    try {
      var response = await client.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        jsonModel = Json.fromJson(jsonMap);
      }
    } catch (e) {
      return jsonModel;
    }

    return jsonModel;
  }
}
