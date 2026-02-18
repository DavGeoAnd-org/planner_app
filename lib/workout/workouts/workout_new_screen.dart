import 'package:flutter/material.dart';
import 'package:planner_app/workout/workouts/workout.dart';
import 'package:planner_app/workout/workouts/workout_request.dart';

import '../../main.dart';
import '../exercises/exercise.dart';
import '../exercises/exercise_request.dart';

class WorkoutNewScreen extends StatefulWidget {
  const WorkoutNewScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WorkoutNewScreenState();
  }
}

class _WorkoutNewScreenState extends State<WorkoutNewScreen> {
  late Future<List<Exercise>> exercises;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController whenController = TextEditingController();
  List<StepInput> stepInputs = [];

  @override
  void initState() {
    super.initState();
    exercises = allExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text('New Workout')),
      body: FutureBuilder(
        key: ValueKey(stepInputs.length),
        future: exercises,
        builder:
            (BuildContext context, AsyncSnapshot<List<Exercise>> snapshot) {
              if (snapshot.hasData) {
                List<Exercise> exerciseList = snapshot.data!;
                return SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsetsGeometry.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Name',
                          ),
                          controller: nameController,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'When',
                          ),
                          controller: whenController,
                        ),
                        for (var i = 0; i < stepInputs.length; i++)
                          Column(
                            spacing: 5,
                            children: [
                              stepInputs[i],
                              FloatingActionButton.extended(
                                onPressed: () async {
                                  setState(() {
                                    stepInputs.removeAt(i);
                                  });
                                },
                                icon: Icon(Icons.remove),
                                label: Text('Remove Step'),
                              ),
                            ],
                          ),
                        FloatingActionButton.extended(
                          onPressed: () async {
                            setState(() {
                              addStepInput(exerciseList);
                            });
                          },
                          icon: Icon(Icons.add),
                          label: Text('Add Step'),
                        ),
                        FloatingActionButton.extended(
                          onPressed: () async {
                            await addWorkout(
                              nameController.text,
                              whenController.text,
                              stepInputs,
                            );
                            navigatorKey.currentState?.pop(true);
                          },
                          icon: Icon(Icons.add),
                          label: Text('Add Workout'),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Center(child: CircularProgressIndicator());
            },
      ),
    );
  }

  void addStepInput(List<Exercise> exerciseList) {
    stepInputs.add(StepInput(exercises: exerciseList));
  }
}
