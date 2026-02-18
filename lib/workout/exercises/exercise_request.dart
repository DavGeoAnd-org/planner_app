import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:planner_app/workout/exercises/exercise.dart';

Future<List<Exercise>> allExercises() async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/workout/exercises",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service timeout");
        },
      );

  if (response.statusCode == 200) {
    List<Exercise> exerciseList = (json.decode(response.body) as List)
        .map((data) => ExerciseMapper.fromMap(data))
        .toList();
    return exerciseList;
  } else {
    throw Exception('Failed to load Exercise list');
  }
}

Future<String> addExercise(
  String name,
  String primaryMuscle,
  String secondaryMuscles,
  String equipment,
  String difficulty,
  String exerciseType,
  String instructions,
) async {
  Exercise exercise = Exercise(
    name: name,
    primaryMuscle: primaryMuscle,
    secondaryMuscles: secondaryMuscles,
    equipment: equipment,
    difficulty: difficulty,
    exerciseType: exerciseType,
    instructions: instructions,
  );

  final response = await http
      .post(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/workout/exercises",
        ),
        body: exercise.toJson(),
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
    throw Exception('Failed to add exercise');
  }
}
