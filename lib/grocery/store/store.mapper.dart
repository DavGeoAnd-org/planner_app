// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'store.dart';

class StoreMapper extends ClassMapperBase<Store> {
  StoreMapper._();

  static StoreMapper? _instance;
  static StoreMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StoreMapper._());
      StoreDetailMapper.ensureInitialized();
      StoreWithLocationMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Store';

  static String _$id(Store v) => v.id;
  static const Field<Store, String> _f$id = Field('id', _$id);
  static String _$name(Store v) => v.name;
  static const Field<Store, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Store> fields = const {#id: _f$id, #name: _f$name};

  static Store _instantiate(DecodingData data) {
    return Store(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Store fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Store>(map);
  }

  static Store fromJson(String json) {
    return ensureInitialized().decodeJson<Store>(json);
  }
}

mixin StoreMappable {
  String toJson() {
    return StoreMapper.ensureInitialized().encodeJson<Store>(this as Store);
  }

  Map<String, dynamic> toMap() {
    return StoreMapper.ensureInitialized().encodeMap<Store>(this as Store);
  }

  StoreCopyWith<Store, Store, Store> get copyWith =>
      _StoreCopyWithImpl<Store, Store>(this as Store, $identity, $identity);
  @override
  String toString() {
    return StoreMapper.ensureInitialized().stringifyValue(this as Store);
  }

  @override
  bool operator ==(Object other) {
    return StoreMapper.ensureInitialized().equalsValue(this as Store, other);
  }

  @override
  int get hashCode {
    return StoreMapper.ensureInitialized().hashValue(this as Store);
  }
}

extension StoreValueCopy<$R, $Out> on ObjectCopyWith<$R, Store, $Out> {
  StoreCopyWith<$R, Store, $Out> get $asStore =>
      $base.as((v, t, t2) => _StoreCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StoreCopyWith<$R, $In extends Store, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name});
  StoreCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StoreCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Store, $Out>
    implements StoreCopyWith<$R, Store, $Out> {
  _StoreCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Store> $mapper = StoreMapper.ensureInitialized();
  @override
  $R call({String? id, String? name}) => $apply(
    FieldCopyWithData({if (id != null) #id: id, if (name != null) #name: name}),
  );
  @override
  Store $make(CopyWithData data) => Store(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
  );

  @override
  StoreCopyWith<$R2, Store, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _StoreCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StoreDetailMapper extends ClassMapperBase<StoreDetail> {
  StoreDetailMapper._();

  static StoreDetailMapper? _instance;
  static StoreDetailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StoreDetailMapper._());
      StoreMapper.ensureInitialized();
      CategoryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StoreDetail';

  static String _$id(StoreDetail v) => v.id;
  static const Field<StoreDetail, String> _f$id = Field('id', _$id);
  static String _$name(StoreDetail v) => v.name;
  static const Field<StoreDetail, String> _f$name = Field('name', _$name);
  static List<Category> _$categories(StoreDetail v) => v.categories;
  static const Field<StoreDetail, List<Category>> _f$categories = Field(
    'categories',
    _$categories,
  );

  @override
  final MappableFields<StoreDetail> fields = const {
    #id: _f$id,
    #name: _f$name,
    #categories: _f$categories,
  };

  static StoreDetail _instantiate(DecodingData data) {
    return StoreDetail(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      categories: data.dec(_f$categories),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static StoreDetail fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StoreDetail>(map);
  }

  static StoreDetail fromJson(String json) {
    return ensureInitialized().decodeJson<StoreDetail>(json);
  }
}

mixin StoreDetailMappable {
  String toJson() {
    return StoreDetailMapper.ensureInitialized().encodeJson<StoreDetail>(
      this as StoreDetail,
    );
  }

  Map<String, dynamic> toMap() {
    return StoreDetailMapper.ensureInitialized().encodeMap<StoreDetail>(
      this as StoreDetail,
    );
  }

  StoreDetailCopyWith<StoreDetail, StoreDetail, StoreDetail> get copyWith =>
      _StoreDetailCopyWithImpl<StoreDetail, StoreDetail>(
        this as StoreDetail,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return StoreDetailMapper.ensureInitialized().stringifyValue(
      this as StoreDetail,
    );
  }

  @override
  bool operator ==(Object other) {
    return StoreDetailMapper.ensureInitialized().equalsValue(
      this as StoreDetail,
      other,
    );
  }

  @override
  int get hashCode {
    return StoreDetailMapper.ensureInitialized().hashValue(this as StoreDetail);
  }
}

extension StoreDetailValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StoreDetail, $Out> {
  StoreDetailCopyWith<$R, StoreDetail, $Out> get $asStoreDetail =>
      $base.as((v, t, t2) => _StoreDetailCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StoreDetailCopyWith<$R, $In extends StoreDetail, $Out>
    implements StoreCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Category, CategoryCopyWith<$R, Category, Category>>
  get categories;
  @override
  $R call({String? id, String? name, List<Category>? categories});
  StoreDetailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StoreDetailCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StoreDetail, $Out>
    implements StoreDetailCopyWith<$R, StoreDetail, $Out> {
  _StoreDetailCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StoreDetail> $mapper =
      StoreDetailMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Category, CategoryCopyWith<$R, Category, Category>>
  get categories => ListCopyWith(
    $value.categories,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(categories: v),
  );
  @override
  $R call({String? id, String? name, List<Category>? categories}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (categories != null) #categories: categories,
    }),
  );
  @override
  StoreDetail $make(CopyWithData data) => StoreDetail(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    categories: data.get(#categories, or: $value.categories),
  );

  @override
  StoreDetailCopyWith<$R2, StoreDetail, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _StoreDetailCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StoreWithLocationMapper extends ClassMapperBase<StoreWithLocation> {
  StoreWithLocationMapper._();

  static StoreWithLocationMapper? _instance;
  static StoreWithLocationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StoreWithLocationMapper._());
      StoreMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StoreWithLocation';

  static String _$id(StoreWithLocation v) => v.id;
  static const Field<StoreWithLocation, String> _f$id = Field('id', _$id);
  static String _$name(StoreWithLocation v) => v.name;
  static const Field<StoreWithLocation, String> _f$name = Field('name', _$name);
  static String _$location(StoreWithLocation v) => v.location;
  static const Field<StoreWithLocation, String> _f$location = Field(
    'location',
    _$location,
  );

  @override
  final MappableFields<StoreWithLocation> fields = const {
    #id: _f$id,
    #name: _f$name,
    #location: _f$location,
  };

  static StoreWithLocation _instantiate(DecodingData data) {
    return StoreWithLocation(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      location: data.dec(_f$location),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static StoreWithLocation fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StoreWithLocation>(map);
  }

  static StoreWithLocation fromJson(String json) {
    return ensureInitialized().decodeJson<StoreWithLocation>(json);
  }
}

mixin StoreWithLocationMappable {
  String toJson() {
    return StoreWithLocationMapper.ensureInitialized()
        .encodeJson<StoreWithLocation>(this as StoreWithLocation);
  }

  Map<String, dynamic> toMap() {
    return StoreWithLocationMapper.ensureInitialized()
        .encodeMap<StoreWithLocation>(this as StoreWithLocation);
  }

  StoreWithLocationCopyWith<
    StoreWithLocation,
    StoreWithLocation,
    StoreWithLocation
  >
  get copyWith =>
      _StoreWithLocationCopyWithImpl<StoreWithLocation, StoreWithLocation>(
        this as StoreWithLocation,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return StoreWithLocationMapper.ensureInitialized().stringifyValue(
      this as StoreWithLocation,
    );
  }

  @override
  bool operator ==(Object other) {
    return StoreWithLocationMapper.ensureInitialized().equalsValue(
      this as StoreWithLocation,
      other,
    );
  }

  @override
  int get hashCode {
    return StoreWithLocationMapper.ensureInitialized().hashValue(
      this as StoreWithLocation,
    );
  }
}

extension StoreWithLocationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StoreWithLocation, $Out> {
  StoreWithLocationCopyWith<$R, StoreWithLocation, $Out>
  get $asStoreWithLocation => $base.as(
    (v, t, t2) => _StoreWithLocationCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class StoreWithLocationCopyWith<
  $R,
  $In extends StoreWithLocation,
  $Out
>
    implements StoreCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? name, String? location});
  StoreWithLocationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _StoreWithLocationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StoreWithLocation, $Out>
    implements StoreWithLocationCopyWith<$R, StoreWithLocation, $Out> {
  _StoreWithLocationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StoreWithLocation> $mapper =
      StoreWithLocationMapper.ensureInitialized();
  @override
  $R call({String? id, String? name, String? location}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (location != null) #location: location,
    }),
  );
  @override
  StoreWithLocation $make(CopyWithData data) => StoreWithLocation(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    location: data.get(#location, or: $value.location),
  );

  @override
  StoreWithLocationCopyWith<$R2, StoreWithLocation, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _StoreWithLocationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

