import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/main.dart';
import 'package:planner_app/workout/exercises/exercises_screen.dart';
import 'package:planner_app/workout/workouts/workouts_screen.dart';

class WorkoutHomeScreen extends StatelessWidget {
  const WorkoutHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Workout")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => ExercisesScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(100),
                backgroundColor: Colors.blueGrey[200],
              ),
              child: AutoSizeText(
                'Exercises',
                style: TextStyle(fontSize: 50, color: Colors.black),
                maxLines: 1,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => WorkoutsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(100),
                backgroundColor: Colors.blueGrey[200],
              ),
              child: AutoSizeText(
                'Workouts',
                style: TextStyle(fontSize: 50, color: Colors.black),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
