import 'package:flutter/material.dart';
import 'package:planner_app/workout/workouts/workout.dart';
import 'package:planner_app/workout/workouts/workout_detail_screen.dart';
import 'package:planner_app/workout/workouts/workout_new_screen.dart';
import 'package:planner_app/workout/workouts/workout_request.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../main.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WorkoutsScreenState();
  }
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  Future<List<Workout>> workouts = allWorkouts();

  void update() async {
    setState(() {
      workouts = allWorkouts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Workouts"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final bool? result = await navigatorKey.currentState?.push(
                MaterialPageRoute(builder: (_) => WorkoutNewScreen()),
              );
              if (result != null && result) {
                update();
              }
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: workouts,
        builder: (BuildContext context, AsyncSnapshot<List<Workout>> snapshot) {
          if (snapshot.hasData) {
            List<Workout> workoutList = snapshot.data!;
            return SafeArea(
              child: SearchableList<Workout>(
                key: ValueKey(workoutList.length),
                initialList: workoutList,
                itemBuilder: (workout) => Card(
                  child: ListTile(
                    title: Text(workout.name),
                    subtitle: Text(workout.when),
                    onTap: () {
                      navigatorKey.currentState?.push(
                        MaterialPageRoute(
                          builder: (_) =>
                              WorkoutDetailScreen(workout: workout.name),
                        ),
                      );
                    },
                  ),
                ),
                filter: (query) => workoutList
                    .where(
                      (workout) => workout.name.toLowerCase().contains(
                        query.toLowerCase(),
                      ),
                    )
                    .toList(),
                inputDecoration: InputDecoration(labelText: 'Search Workout'),
                searchFieldPadding: const EdgeInsets.all(20),
                listViewPadding: const EdgeInsets.all(20),
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
}
