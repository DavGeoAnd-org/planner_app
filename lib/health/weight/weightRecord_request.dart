import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:planner_app/health/weight/weight_record.dart';

Future<List<WeightRecord>> allWeightRecords() async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/health/weightRecords",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    List<WeightRecord> weightRecordList = (json.decode(response.body) as List)
        .map((data) => WeightRecordMapper.fromMap(data))
        .toList();
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
        body: weightRecord.weightJson(),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 201) {
    return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to add WeightRecord');
  }
}

Future<List<WeightRecord>> weightRecordsByDayRange(int days) async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/health/weightRecords/range/days?days=$days",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    List<WeightRecord> weightRecordList = (json.decode(response.body) as List)
        .map((data) => WeightRecordMapper.fromMap(data))
        .toList();
    return weightRecordList;
  } else {
    throw Exception('Failed to load WeightRecord list');
  }
}
