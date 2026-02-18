// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'workout.dart';

class WorkoutMapper extends ClassMapperBase<Workout> {
  WorkoutMapper._();

  static WorkoutMapper? _instance;
  static WorkoutMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WorkoutMapper._());
      WorkoutDetailMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Workout';

  static String? _$id(Workout v) => v.id;
  static const Field<Workout, String> _f$id = Field('id', _$id, opt: true);
  static String _$name(Workout v) => v.name;
  static const Field<Workout, String> _f$name = Field('name', _$name);
  static String _$when(Workout v) => v.when;
  static const Field<Workout, String> _f$when = Field('when', _$when);

  @override
  final MappableFields<Workout> fields = const {
    #id: _f$id,
    #name: _f$name,
    #when: _f$when,
  };

  static Workout _instantiate(DecodingData data) {
    return Workout(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      when: data.dec(_f$when),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Workout fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Workout>(map);
  }

  static Workout fromJson(String json) {
    return ensureInitialized().decodeJson<Workout>(json);
  }
}

mixin WorkoutMappable {
  String toJson() {
    return WorkoutMapper.ensureInitialized().encodeJson<Workout>(
      this as Workout,
    );
  }

  Map<String, dynamic> toMap() {
    return WorkoutMapper.ensureInitialized().encodeMap<Workout>(
      this as Workout,
    );
  }

  WorkoutCopyWith<Workout, Workout, Workout> get copyWith =>
      _WorkoutCopyWithImpl<Workout, Workout>(
        this as Workout,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WorkoutMapper.ensureInitialized().stringifyValue(this as Workout);
  }

  @override
  bool operator ==(Object other) {
    return WorkoutMapper.ensureInitialized().equalsValue(
      this as Workout,
      other,
    );
  }

  @override
  int get hashCode {
    return WorkoutMapper.ensureInitialized().hashValue(this as Workout);
  }
}

extension WorkoutValueCopy<$R, $Out> on ObjectCopyWith<$R, Workout, $Out> {
  WorkoutCopyWith<$R, Workout, $Out> get $asWorkout =>
      $base.as((v, t, t2) => _WorkoutCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WorkoutCopyWith<$R, $In extends Workout, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name, String? when});
  WorkoutCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WorkoutCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Workout, $Out>
    implements WorkoutCopyWith<$R, Workout, $Out> {
  _WorkoutCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Workout> $mapper =
      WorkoutMapper.ensureInitialized();
  @override
  $R call({Object? id = $none, String? name, String? when}) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != null) #name: name,
      if (when != null) #when: when,
    }),
  );
  @override
  Workout $make(CopyWithData data) => Workout(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    when: data.get(#when, or: $value.when),
  );

  @override
  WorkoutCopyWith<$R2, Workout, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _WorkoutCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class WorkoutDetailMapper extends ClassMapperBase<WorkoutDetail> {
  WorkoutDetailMapper._();

  static WorkoutDetailMapper? _instance;
  static WorkoutDetailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WorkoutDetailMapper._());
      WorkoutMapper.ensureInitialized();
      StepMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WorkoutDetail';

  static String? _$id(WorkoutDetail v) => v.id;
  static const Field<WorkoutDetail, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String _$name(WorkoutDetail v) => v.name;
  static const Field<WorkoutDetail, String> _f$name = Field('name', _$name);
  static String _$when(WorkoutDetail v) => v.when;
  static const Field<WorkoutDetail, String> _f$when = Field('when', _$when);
  static List<Step> _$steps(WorkoutDetail v) => v.steps;
  static const Field<WorkoutDetail, List<Step>> _f$steps = Field(
    'steps',
    _$steps,
  );

  @override
  final MappableFields<WorkoutDetail> fields = const {
    #id: _f$id,
    #name: _f$name,
    #when: _f$when,
    #steps: _f$steps,
  };

  static WorkoutDetail _instantiate(DecodingData data) {
    return WorkoutDetail(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      when: data.dec(_f$when),
      steps: data.dec(_f$steps),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WorkoutDetail fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WorkoutDetail>(map);
  }

  static WorkoutDetail fromJson(String json) {
    return ensureInitialized().decodeJson<WorkoutDetail>(json);
  }
}

mixin WorkoutDetailMappable {
  String toJson() {
    return WorkoutDetailMapper.ensureInitialized().encodeJson<WorkoutDetail>(
      this as WorkoutDetail,
    );
  }

  Map<String, dynamic> toMap() {
    return WorkoutDetailMapper.ensureInitialized().encodeMap<WorkoutDetail>(
      this as WorkoutDetail,
    );
  }

  WorkoutDetailCopyWith<WorkoutDetail, WorkoutDetail, WorkoutDetail>
  get copyWith => _WorkoutDetailCopyWithImpl<WorkoutDetail, WorkoutDetail>(
    this as WorkoutDetail,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return WorkoutDetailMapper.ensureInitialized().stringifyValue(
      this as WorkoutDetail,
    );
  }

  @override
  bool operator ==(Object other) {
    return WorkoutDetailMapper.ensureInitialized().equalsValue(
      this as WorkoutDetail,
      other,
    );
  }

  @override
  int get hashCode {
    return WorkoutDetailMapper.ensureInitialized().hashValue(
      this as WorkoutDetail,
    );
  }
}

extension WorkoutDetailValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WorkoutDetail, $Out> {
  WorkoutDetailCopyWith<$R, WorkoutDetail, $Out> get $asWorkoutDetail =>
      $base.as((v, t, t2) => _WorkoutDetailCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WorkoutDetailCopyWith<$R, $In extends WorkoutDetail, $Out>
    implements WorkoutCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Step, StepCopyWith<$R, Step, Step>> get steps;
  @override
  $R call({String? id, String? name, String? when, List<Step>? steps});
  WorkoutDetailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WorkoutDetailCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WorkoutDetail, $Out>
    implements WorkoutDetailCopyWith<$R, WorkoutDetail, $Out> {
  _WorkoutDetailCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WorkoutDetail> $mapper =
      WorkoutDetailMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Step, StepCopyWith<$R, Step, Step>> get steps =>
      ListCopyWith(
        $value.steps,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(steps: v),
      );
  @override
  $R call({
    Object? id = $none,
    String? name,
    String? when,
    List<Step>? steps,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != null) #name: name,
      if (when != null) #when: when,
      if (steps != null) #steps: steps,
    }),
  );
  @override
  WorkoutDetail $make(CopyWithData data) => WorkoutDetail(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    when: data.get(#when, or: $value.when),
    steps: data.get(#steps, or: $value.steps),
  );

  @override
  WorkoutDetailCopyWith<$R2, WorkoutDetail, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WorkoutDetailCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StepMapper extends ClassMapperBase<Step> {
  StepMapper._();

  static StepMapper? _instance;
  static StepMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StepMapper._());
      ExerciseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Step';

  static Exercise _$exercise(Step v) => v.exercise;
  static const Field<Step, Exercise> _f$exercise = Field(
    'exercise',
    _$exercise,
  );
  static String _$note(Step v) => v.note;
  static const Field<Step, String> _f$note = Field('note', _$note);
  static int _$order(Step v) => v.order;
  static const Field<Step, int> _f$order = Field('order', _$order);

  @override
  final MappableFields<Step> fields = const {
    #exercise: _f$exercise,
    #note: _f$note,
    #order: _f$order,
  };

  static Step _instantiate(DecodingData data) {
    return Step(
      exercise: data.dec(_f$exercise),
      note: data.dec(_f$note),
      order: data.dec(_f$order),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Step fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Step>(map);
  }

  static Step fromJson(String json) {
    return ensureInitialized().decodeJson<Step>(json);
  }
}

mixin StepMappable {
  String toJson() {
    return StepMapper.ensureInitialized().encodeJson<Step>(this as Step);
  }

  Map<String, dynamic> toMap() {
    return StepMapper.ensureInitialized().encodeMap<Step>(this as Step);
  }

  StepCopyWith<Step, Step, Step> get copyWith =>
      _StepCopyWithImpl<Step, Step>(this as Step, $identity, $identity);
  @override
  String toString() {
    return StepMapper.ensureInitialized().stringifyValue(this as Step);
  }

  @override
  bool operator ==(Object other) {
    return StepMapper.ensureInitialized().equalsValue(this as Step, other);
  }

  @override
  int get hashCode {
    return StepMapper.ensureInitialized().hashValue(this as Step);
  }
}

extension StepValueCopy<$R, $Out> on ObjectCopyWith<$R, Step, $Out> {
  StepCopyWith<$R, Step, $Out> get $asStep =>
      $base.as((v, t, t2) => _StepCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StepCopyWith<$R, $In extends Step, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ExerciseCopyWith<$R, Exercise, Exercise> get exercise;
  $R call({Exercise? exercise, String? note, int? order});
  StepCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StepCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Step, $Out>
    implements StepCopyWith<$R, Step, $Out> {
  _StepCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Step> $mapper = StepMapper.ensureInitialized();
  @override
  ExerciseCopyWith<$R, Exercise, Exercise> get exercise =>
      $value.exercise.copyWith.$chain((v) => call(exercise: v));
  @override
  $R call({Exercise? exercise, String? note, int? order}) => $apply(
    FieldCopyWithData({
      if (exercise != null) #exercise: exercise,
      if (note != null) #note: note,
      if (order != null) #order: order,
    }),
  );
  @override
  Step $make(CopyWithData data) => Step(
    exercise: data.get(#exercise, or: $value.exercise),
    note: data.get(#note, or: $value.note),
    order: data.get(#order, or: $value.order),
  );

  @override
  StepCopyWith<$R2, Step, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _StepCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

