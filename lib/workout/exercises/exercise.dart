import 'package:dart_mappable/dart_mappable.dart';

part 'exercise.mapper.dart';

@MappableClass()
class Exercise with ExerciseMappable {
  String? id;
  String name,
      primaryMuscle,
      secondaryMuscles,
      equipment,
      difficulty,
      exerciseType,
      instructions;

  Exercise({
    this.id,
    required this.name,
    required this.primaryMuscle,
    required this.secondaryMuscles,
    required this.equipment,
    required this.difficulty,
    required this.exerciseType,
    required this.instructions,
  });
}
