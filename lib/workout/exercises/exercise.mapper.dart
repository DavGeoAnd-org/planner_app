// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'exercise.dart';

class ExerciseMapper extends ClassMapperBase<Exercise> {
  ExerciseMapper._();

  static ExerciseMapper? _instance;
  static ExerciseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExerciseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Exercise';

  static String? _$id(Exercise v) => v.id;
  static const Field<Exercise, String> _f$id = Field('id', _$id, opt: true);
  static String _$name(Exercise v) => v.name;
  static const Field<Exercise, String> _f$name = Field('name', _$name);
  static String _$primaryMuscle(Exercise v) => v.primaryMuscle;
  static const Field<Exercise, String> _f$primaryMuscle = Field(
    'primaryMuscle',
    _$primaryMuscle,
  );
  static String _$secondaryMuscles(Exercise v) => v.secondaryMuscles;
  static const Field<Exercise, String> _f$secondaryMuscles = Field(
    'secondaryMuscles',
    _$secondaryMuscles,
  );
  static String _$equipment(Exercise v) => v.equipment;
  static const Field<Exercise, String> _f$equipment = Field(
    'equipment',
    _$equipment,
  );
  static String _$difficulty(Exercise v) => v.difficulty;
  static const Field<Exercise, String> _f$difficulty = Field(
    'difficulty',
    _$difficulty,
  );
  static String _$exerciseType(Exercise v) => v.exerciseType;
  static const Field<Exercise, String> _f$exerciseType = Field(
    'exerciseType',
    _$exerciseType,
  );
  static String _$instructions(Exercise v) => v.instructions;
  static const Field<Exercise, String> _f$instructions = Field(
    'instructions',
    _$instructions,
  );

  @override
  final MappableFields<Exercise> fields = const {
    #id: _f$id,
    #name: _f$name,
    #primaryMuscle: _f$primaryMuscle,
    #secondaryMuscles: _f$secondaryMuscles,
    #equipment: _f$equipment,
    #difficulty: _f$difficulty,
    #exerciseType: _f$exerciseType,
    #instructions: _f$instructions,
  };

  static Exercise _instantiate(DecodingData data) {
    return Exercise(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      primaryMuscle: data.dec(_f$primaryMuscle),
      secondaryMuscles: data.dec(_f$secondaryMuscles),
      equipment: data.dec(_f$equipment),
      difficulty: data.dec(_f$difficulty),
      exerciseType: data.dec(_f$exerciseType),
      instructions: data.dec(_f$instructions),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Exercise fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Exercise>(map);
  }

  static Exercise fromJson(String json) {
    return ensureInitialized().decodeJson<Exercise>(json);
  }
}

mixin ExerciseMappable {
  String toJson() {
    return ExerciseMapper.ensureInitialized().encodeJson<Exercise>(
      this as Exercise,
    );
  }

  Map<String, dynamic> toMap() {
    return ExerciseMapper.ensureInitialized().encodeMap<Exercise>(
      this as Exercise,
    );
  }

  ExerciseCopyWith<Exercise, Exercise, Exercise> get copyWith =>
      _ExerciseCopyWithImpl<Exercise, Exercise>(
        this as Exercise,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ExerciseMapper.ensureInitialized().stringifyValue(this as Exercise);
  }

  @override
  bool operator ==(Object other) {
    return ExerciseMapper.ensureInitialized().equalsValue(
      this as Exercise,
      other,
    );
  }

  @override
  int get hashCode {
    return ExerciseMapper.ensureInitialized().hashValue(this as Exercise);
  }
}

extension ExerciseValueCopy<$R, $Out> on ObjectCopyWith<$R, Exercise, $Out> {
  ExerciseCopyWith<$R, Exercise, $Out> get $asExercise =>
      $base.as((v, t, t2) => _ExerciseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ExerciseCopyWith<$R, $In extends Exercise, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? name,
    String? primaryMuscle,
    String? secondaryMuscles,
    String? equipment,
    String? difficulty,
    String? exerciseType,
    String? instructions,
  });
  ExerciseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ExerciseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Exercise, $Out>
    implements ExerciseCopyWith<$R, Exercise, $Out> {
  _ExerciseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Exercise> $mapper =
      ExerciseMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    String? name,
    String? primaryMuscle,
    String? secondaryMuscles,
    String? equipment,
    String? difficulty,
    String? exerciseType,
    String? instructions,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != null) #name: name,
      if (primaryMuscle != null) #primaryMuscle: primaryMuscle,
      if (secondaryMuscles != null) #secondaryMuscles: secondaryMuscles,
      if (equipment != null) #equipment: equipment,
      if (difficulty != null) #difficulty: difficulty,
      if (exerciseType != null) #exerciseType: exerciseType,
      if (instructions != null) #instructions: instructions,
    }),
  );
  @override
  Exercise $make(CopyWithData data) => Exercise(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    primaryMuscle: data.get(#primaryMuscle, or: $value.primaryMuscle),
    secondaryMuscles: data.get(#secondaryMuscles, or: $value.secondaryMuscles),
    equipment: data.get(#equipment, or: $value.equipment),
    difficulty: data.get(#difficulty, or: $value.difficulty),
    exerciseType: data.get(#exerciseType, or: $value.exerciseType),
    instructions: data.get(#instructions, or: $value.instructions),
  );

  @override
  ExerciseCopyWith<$R2, Exercise, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ExerciseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

