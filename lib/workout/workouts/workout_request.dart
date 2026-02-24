import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:planner_app/workout/workouts/workout.dart';

import '../exercises/exercise.dart';

Future<List<Workout>> allWorkouts() async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/workout/workouts",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service timeout");
        },
      );

  if (response.statusCode == 200) {
    List<Workout> workoutList = (json.decode(response.body) as List)
        .map((data) => WorkoutMapper.fromMap(data))
        .toList();
    return workoutList;
  } else {
    throw Exception('Failed to load Exercise list');
  }
}

Future<WorkoutDetail> workoutDetail(String id) async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/workout/workouts/$id",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    return WorkoutDetailMapper.fromJson(response.body);
  } else {
    throw Exception('Failed to load WorkoutDetail');
  }
}

Future<String> addWorkout(
  String name,
  String when,
  List<StepInput> stepInputs,
) async {
  List<Step> steps = List.empty(growable: true);
  for (var i = 0; i < stepInputs.length; i++) {
    Exercise exercise =
        stepInputs[i].selectController.selectedItems.first.value;
    steps.add(
      Step(
        exercise: exercise,
        note: stepInputs[i].noteController.text,
        order: i,
      ),
    );
  }

  WorkoutDetail workoutDetail = WorkoutDetail(
    name: name,
    when: when,
    steps: steps,
  );

  final response = await http
      .post(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/workout/workouts",
        ),
        body: workoutDetail.toJson(),
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
    throw Exception('Failed to add workout');
  }
}

Future<String> updateWorkout(
  WorkoutDetail workoutDetail,
  String when,
  List<StepInput> stepInputs,
) async {
  List<Step> steps = List.empty(growable: true);
  for (var i = 0; i < stepInputs.length; i++) {
    Exercise exercise =
        stepInputs[i].selectController.selectedItems.first.value;
    steps.add(
      Step(
        exercise: exercise,
        note: stepInputs[i].noteController.text,
        order: i,
      ),
    );
  }

  workoutDetail.when = when;
  workoutDetail.steps = steps;

  final response = await http
      .put(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/workout/workouts",
        ),
        body: workoutDetail.toJson(),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to update workout');
  }
}
