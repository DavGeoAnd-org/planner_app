import 'package:flutter/material.dart';

import '../../main.dart';
import 'exercise_request.dart';

class ExerciseNewScreen extends StatelessWidget {
  ExerciseNewScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController primaryMuscleController = TextEditingController();
  final TextEditingController secondaryMusclesController =
      TextEditingController();
  final TextEditingController equipmentController = TextEditingController();
  final TextEditingController difficultyController = TextEditingController();
  final TextEditingController exerciseTypeController = TextEditingController();
  final TextEditingController instructionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('New Exercise')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                controller: nameController,
              ),
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
                  labelText: 'Instructions',
                ),
                controller: instructionsController,
                minLines: 5,
                maxLines: null,
              ),
              FloatingActionButton.extended(
                onPressed: () async {
                  await addExercise(
                    nameController.text,
                    primaryMuscleController.text,
                    secondaryMusclesController.text,
                    equipmentController.text,
                    difficultyController.text,
                    exerciseTypeController.text,
                    instructionsController.text,
                  );
                  navigatorKey.currentState?.pop(true);
                },
                icon: Icon(Icons.add),
                label: Text('Add Exercise'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
