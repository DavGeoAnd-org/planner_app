// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'weight_record.dart';

class WeightRecordMapper extends ClassMapperBase<WeightRecord> {
  WeightRecordMapper._();

  static WeightRecordMapper? _instance;
  static WeightRecordMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WeightRecordMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WeightRecord';

  static String? _$id(WeightRecord v) => v.id;
  static const Field<WeightRecord, String> _f$id = Field('id', _$id, opt: true);
  static double _$weight(WeightRecord v) => v.weight;
  static const Field<WeightRecord, double> _f$weight = Field(
    'weight',
    _$weight,
  );

  @override
  final MappableFields<WeightRecord> fields = const {
    #id: _f$id,
    #weight: _f$weight,
  };

  static WeightRecord _instantiate(DecodingData data) {
    return WeightRecord(id: data.dec(_f$id), weight: data.dec(_f$weight));
  }

  @override
  final Function instantiate = _instantiate;

  static WeightRecord fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WeightRecord>(map);
  }

  static WeightRecord fromJson(String json) {
    return ensureInitialized().decodeJson<WeightRecord>(json);
  }
}

mixin WeightRecordMappable {
  String toJson() {
    return WeightRecordMapper.ensureInitialized().encodeJson<WeightRecord>(
      this as WeightRecord,
    );
  }

  Map<String, dynamic> toMap() {
    return WeightRecordMapper.ensureInitialized().encodeMap<WeightRecord>(
      this as WeightRecord,
    );
  }

  WeightRecordCopyWith<WeightRecord, WeightRecord, WeightRecord> get copyWith =>
      _WeightRecordCopyWithImpl<WeightRecord, WeightRecord>(
        this as WeightRecord,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WeightRecordMapper.ensureInitialized().stringifyValue(
      this as WeightRecord,
    );
  }

  @override
  bool operator ==(Object other) {
    return WeightRecordMapper.ensureInitialized().equalsValue(
      this as WeightRecord,
      other,
    );
  }

  @override
  int get hashCode {
    return WeightRecordMapper.ensureInitialized().hashValue(
      this as WeightRecord,
    );
  }
}

extension WeightRecordValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WeightRecord, $Out> {
  WeightRecordCopyWith<$R, WeightRecord, $Out> get $asWeightRecord =>
      $base.as((v, t, t2) => _WeightRecordCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WeightRecordCopyWith<$R, $In extends WeightRecord, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, double? weight});
  WeightRecordCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WeightRecordCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WeightRecord, $Out>
    implements WeightRecordCopyWith<$R, WeightRecord, $Out> {
  _WeightRecordCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WeightRecord> $mapper =
      WeightRecordMapper.ensureInitialized();
  @override
  $R call({Object? id = $none, double? weight}) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (weight != null) #weight: weight,
    }),
  );
  @override
  WeightRecord $make(CopyWithData data) => WeightRecord(
    id: data.get(#id, or: $value.id),
    weight: data.get(#weight, or: $value.weight),
  );

  @override
  WeightRecordCopyWith<$R2, WeightRecord, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WeightRecordCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

