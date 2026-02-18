import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:planner_app/workout/workouts/workout.dart';
import 'package:planner_app/workout/workouts/workout_request.dart';

class WorkoutDetailScreen extends StatefulWidget {
  const WorkoutDetailScreen({super.key, required this.workout});

  final String workout;

  @override
  State<StatefulWidget> createState() {
    return _WorkoutDetailScreenState();
  }
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  late Future<WorkoutDetail> _workoutDetail;

  @override
  void initState() {
    super.initState();
    _workoutDetail = workoutDetail(widget.workout);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text(widget.workout)),
      body: SafeArea(
        child: FutureBuilder<WorkoutDetail>(
          future: _workoutDetail,
          builder:
              (BuildContext context, AsyncSnapshot<WorkoutDetail> snapshot) {
                if (snapshot.hasData) {
                  WorkoutDetail workoutDetail = snapshot.data!;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        AutoSizeText('When: ${workoutDetail.when}'),
                        const AutoSizeText('Exercises:'),
                        for (Step step in sortWorkoutStep(workoutDetail.steps))
                          AutoSizeText('${step.exercise.name}\n${step.note}'),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
        ),
      ),
    );
  }

  List<Step> sortWorkoutStep(List<Step> steps) {
    steps.sort((a, b) => a.order.compareTo(b.order));
    return steps;
  }
}
