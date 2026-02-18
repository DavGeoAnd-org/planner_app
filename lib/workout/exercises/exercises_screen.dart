import 'package:flutter/material.dart';
import 'package:planner_app/workout/exercises/exercise.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../main.dart';
import 'exercise_detail_screen.dart';
import 'exercise_new_screen.dart';
import 'exercise_request.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExercisesScreenState();
  }
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  Future<List<Exercise>> exercises = allExercises();

  void update() async {
    setState(() {
      exercises = allExercises();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Exercises"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final bool? result = await navigatorKey.currentState?.push(
                MaterialPageRoute(builder: (_) => ExerciseNewScreen()),
              );
              if (result != null && result) {
                update();
              }
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: exercises,
        builder:
            (BuildContext context, AsyncSnapshot<List<Exercise>> snapshot) {
              if (snapshot.hasData) {
                List<Exercise> exerciseList = snapshot.data!;
                return SafeArea(
                  child: SearchableList<Exercise>(
                    key: ValueKey(exerciseList.length),
                    initialList: exerciseList,
                    itemBuilder: (exercise) => Card(
                      child: ListTile(
                        title: Text(exercise.name),
                        onTap: () {
                          navigatorKey.currentState?.push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  ExerciseDetailScreen(exercise: exercise),
                            ),
                          );
                        },
                      ),
                    ),
                    filter: (query) => exerciseList
                        .where(
                          (exercise) => exercise.name.toLowerCase().contains(
                            query.toLowerCase(),
                          ),
                        )
                        .toList(),
                    inputDecoration: InputDecoration(
                      labelText: 'Search Exercise',
                    ),
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
