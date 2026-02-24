import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/workout/exercises/exercise.dart';

import '../../main.dart';
import 'exercise_request.dart';

class ExerciseDetailScreen extends StatefulWidget {
  const ExerciseDetailScreen({super.key, required this.exercise});

  final Exercise exercise;

  @override
  State<StatefulWidget> createState() {
    return _ExerciseDetailScreenState();
  }
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  bool editMode = false;
  late final TextEditingController primaryMuscleController =
      TextEditingController(text: widget.exercise.primaryMuscle);
  late final TextEditingController secondaryMusclesController =
      TextEditingController(text: widget.exercise.secondaryMuscles);
  late final TextEditingController equipmentController = TextEditingController(
    text: widget.exercise.equipment,
  );
  late final TextEditingController difficultyController = TextEditingController(
    text: widget.exercise.difficulty,
  );
  late final TextEditingController exerciseTypeController =
      TextEditingController(text: widget.exercise.exerciseType);
  late final TextEditingController instructionsController =
      TextEditingController(text: widget.exercise.instructions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(widget.exercise.name)),
      body: editMode ? editScreen() : detailScreen(),
    );
  }

  Widget detailScreen() {
    return SafeArea(
      child: SingleChildScrollView(
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
            FloatingActionButton.extended(
              onPressed: () async {
                setState(() {
                  editMode = true;
                });
              },
              icon: Icon(Icons.add),
              label: Text('Edit Exercise'),
            ),
          ],
        ),
      ),
    );
  }

  Widget editScreen() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Primary Muscle',
              ),
              controller: primaryMuscleController,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Secondary Muscles',
              ),
              controller: secondaryMusclesController,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Equipment',
              ),
              controller: equipmentController,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Difficulty',
              ),
              controller: difficultyController,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Exercise Type',
              ),
              controller: exerciseTypeController,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Instructions',
              ),
              controller: instructionsController,
              minLines: 5,
              maxLines: null,
            ),
            FloatingActionButton.extended(
              onPressed: () async {
                await updateExercise(
                  widget.exercise,
                  primaryMuscleController.text,
                  secondaryMusclesController.text,
                  equipmentController.text,
                  difficultyController.text,
                  exerciseTypeController.text,
                  instructionsController.text,
                );
                navigatorKey.currentState?.pop(true);
              },
              icon: Icon(Icons.check_box),
              label: Text('Update & Exit'),
            ),
            FloatingActionButton.extended(
              onPressed: () async {
                setState(() {
                  editMode = false;
                });
              },
              icon: Icon(Icons.cancel),
              label: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
