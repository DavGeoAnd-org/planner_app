import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/workout/exercises/exercise.dart';

class ExerciseDetailScreen extends StatefulWidget {
  const ExerciseDetailScreen({super.key, required this.exercise});

  final Exercise exercise;

  @override
  State<StatefulWidget> createState() {
    return _ExerciseDetailScreenState();
  }
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(widget.exercise.name)),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            AutoSizeText(
              'Primary Muscle: ${widget.exercise.primaryMuscle}',
              maxFontSize: 30,
              maxLines: 1,
            ),
            AutoSizeText(
              'Secondary Muscles: ${widget.exercise.secondaryMuscles}',
              maxFontSize: 30,
              maxLines: 1,
            ),
            AutoSizeText(
              'Equipment: ${widget.exercise.equipment}',
              maxFontSize: 30,
              maxLines: 1,
            ),
            AutoSizeText(
              'Difficulty: ${widget.exercise.difficulty}',
              maxFontSize: 30,
              maxLines: 1,
            ),
            AutoSizeText(
              'Exercise Type: ${widget.exercise.exerciseType}',
              maxFontSize: 30,
              maxLines: 1,
            ),
            AutoSizeText(
              'Instructions:\n${widget.exercise.instructions}',
              maxFontSize: 30,
            ),
          ],
        ),
      ),
    );
  }
}
