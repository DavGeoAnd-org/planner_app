import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:planner_app/main.dart';

import 'weight_record.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WeightScreenState();
  }
}

class _WeightScreenState extends State<WeightScreen> {
  late Future<List<WeightRecord>> weightRecords;

  @override
  void initState() {
    super.initState();
    weightRecords = getWeightRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Weight")),
      body: FutureBuilder(
        future: weightRecords,
        builder:
            (BuildContext context, AsyncSnapshot<List<WeightRecord>> snapshot) {
              if (snapshot.hasData) {
                List<WeightRecord> weightRecordList = snapshot.data!;
                return ListView.builder(
                  itemCount: weightRecordList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(weightRecordList[index].toString()),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Center(child: CircularProgressIndicator());
            },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          TextEditingController weightController = TextEditingController();
          bool result = await showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter weight',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => navigatorKey.currentState?.pop(false),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    addWeightRecord(
                      weightController.text,
                    ).then((result) => navigatorKey.currentState?.pop(true));
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          );
          if (result) {
            setState(() {
              weightRecords = getWeightRecords();
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  static Future<List<WeightRecord>> getWeightRecords() async {
    final response = await http
        .get(
          Uri.parse(
            "${const String.fromEnvironment('BASE_SERVICE_URL')}/health/weightRecords",
          ),
        )
        .timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw const HttpException("Service Not Running");
          },
        );

    if (response.statusCode == 200) {
      List<WeightRecord> weightRecordList = (json.decode(response.body) as List)
          .map((data) => WeightRecord.fromMap(data))
          .toList();
      weightRecordList.sort((a, b) => a.timestamp!.compareTo(b.timestamp!));
      return weightRecordList;
    } else {
      throw Exception('Failed to load WeightRecord list');
    }
  }

  Future<String> addWeightRecord(String text) async {
    WeightRecord weightRecord = WeightRecord(weight: double.parse(text));

    final response = await http
        .post(
          Uri.parse(
            "${const String.fromEnvironment('BASE_SERVICE_URL')}/health/weightRecords",
          ),
          body: weightRecord.toJson(),
        )
        .timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw const HttpException("Service Not Running");
          },
        );

    if (response.statusCode == 201) {
      return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
    } else {
      throw Exception('Failed to add weight.');
    }
  }
}
