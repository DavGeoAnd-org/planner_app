import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import '../exercises/exercise.dart';

part 'workout.mapper.dart';

@MappableClass()
class Workout with WorkoutMappable {
  String? id;
  String name, when;

  Workout({this.id, required this.name, required this.when});
}

@MappableClass()
class WorkoutDetail extends Workout with WorkoutDetailMappable {
  List<Step> steps;

  WorkoutDetail({
    super.id,
    required super.name,
    required super.when,
    required this.steps,
  });
}

@MappableClass()
class Step with StepMappable {
  Exercise exercise;
  String note;
  int order;

  Step({required this.exercise, required this.note, required this.order});
}

class StepInput extends StatelessWidget {
  final List<Exercise> exercises;
  late final TextEditingController noteController;
  late final MultiSelectController<Exercise> selectController;
  late final String initialStep;

  StepInput({super.key, required this.exercises}) {
    noteController = TextEditingController();
    selectController = MultiSelectController();
    initialStep = '';
  }

  StepInput.fromStep({super.key, required this.exercises, required Step step}) {
    noteController = TextEditingController(text: step.note);
    selectController = MultiSelectController();
    initialStep = step.exercise.name;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Expanded(
          child: MultiDropdown<Exercise>(
            items: exercises
                .map(
                  (e) => e.name == initialStep
                      ? DropdownItem(label: e.name, value: e, selected: true)
                      : DropdownItem(label: e.name, value: e),
                )
                .toList(),
            singleSelect: true,
            searchEnabled: true,
            controller: selectController,
          ),
        ),
        Expanded(
          child: TextField(
            controller: noteController,
            maxLines: 3,
            minLines: 2,
            decoration: InputDecoration(labelText: 'Notes'),
          ),
        ),
      ],
    );
  }
}
