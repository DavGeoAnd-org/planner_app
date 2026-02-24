import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:planner_app/workout/workouts/workout.dart';
import 'package:planner_app/workout/workouts/workout_request.dart';

import '../exercises/exercise.dart';
import '../exercises/exercise_request.dart';

class WorkoutDetailScreen extends StatefulWidget {
  const WorkoutDetailScreen({super.key, required this.workout});

  final String workout;

  @override
  State<StatefulWidget> createState() {
    return _WorkoutDetailScreenState();
  }
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  bool editMode = false;
  bool isLoading = true;
  late WorkoutDetail _workoutDetail;
  late List<Exercise> _exerciseList;
  late TextEditingController _whenController = TextEditingController();
  final List<StepInput> _stepInputs = [];

  @override
  void initState() {
    super.initState();
    workoutDetail(widget.workout)
        .then((value) {
          _workoutDetail = value;
          _whenController = TextEditingController(text: value.when);
        })
        .whenComplete(() {
          allExercises()
              .then((value) {
                _exerciseList = value;
                for (var step in _workoutDetail.steps) {
                  _stepInputs.add(
                    StepInput.fromStep(exercises: value, step: step),
                  );
                }
              })
              .whenComplete(() {
                setState(() {
                  isLoading = false;
                });
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text(widget.workout)),
      body: editMode ? editScreen() : detailScreen(),
    );
  }

  Widget detailScreen() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            AutoSizeText('When: ${_workoutDetail.when}'),
            const AutoSizeText('Exercises:'),
            for (Step step in sortWorkoutStep(_workoutDetail.steps))
              AutoSizeText('${step.exercise.name}\n${step.note}'),
            FloatingActionButton.extended(
              onPressed: () async {
                setState(() {
                  editMode = true;
                });
              },
              icon: Icon(Icons.add),
              label: Text('Edit Workout'),
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
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'When',
              ),
              controller: _whenController,
            ),
            for (var i = 0; i < _stepInputs.length; i++)
              Column(
                spacing: 5,
                children: [
                  _stepInputs[i],
                  FloatingActionButton.extended(
                    onPressed: () async {
                      setState(() {
                        _stepInputs.removeAt(i);
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
                  addStepInput(_exerciseList);
                });
              },
              icon: Icon(Icons.add),
              label: Text('Add Step'),
            ),
            FloatingActionButton.extended(
              onPressed: () async {
                await updateWorkout(
                  _workoutDetail,
                  _whenController.text,
                  _stepInputs,
                ).whenComplete(() {
                  setState(() {
                    editMode = false;
                  });
                });
              },
              icon: Icon(Icons.check_box),
              label: Text('Update'),
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

  List<Step> sortWorkoutStep(List<Step> steps) {
    steps.sort((a, b) => a.order.compareTo(b.order));
    return steps;
  }

  void addStepInput(List<Exercise> exerciseList) {
    _stepInputs.add(StepInput(exercises: exerciseList));
  }
}
