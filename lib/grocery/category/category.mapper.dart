// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'category.dart';

class CategoryMapper extends ClassMapperBase<Category> {
  CategoryMapper._();

  static CategoryMapper? _instance;
  static CategoryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryMapper._());
      CategoryWithStoreListStatusMapper.ensureInitialized();
      CategoryDetailMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Category';

  static String _$id(Category v) => v.id;
  static const Field<Category, String> _f$id = Field('id', _$id);
  static String _$name(Category v) => v.name;
  static const Field<Category, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Category> fields = const {#id: _f$id, #name: _f$name};

  static Category _instantiate(DecodingData data) {
    return Category(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Category fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Category>(map);
  }

  static Category fromJson(String json) {
    return ensureInitialized().decodeJson<Category>(json);
  }
}

mixin CategoryMappable {
  String toJson() {
    return CategoryMapper.ensureInitialized().encodeJson<Category>(
      this as Category,
    );
  }

  Map<String, dynamic> toMap() {
    return CategoryMapper.ensureInitialized().encodeMap<Category>(
      this as Category,
    );
  }

  CategoryCopyWith<Category, Category, Category> get copyWith =>
      _CategoryCopyWithImpl<Category, Category>(
        this as Category,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CategoryMapper.ensureInitialized().stringifyValue(this as Category);
  }

  @override
  bool operator ==(Object other) {
    return CategoryMapper.ensureInitialized().equalsValue(
      this as Category,
      other,
    );
  }

  @override
  int get hashCode {
    return CategoryMapper.ensureInitialized().hashValue(this as Category);
  }
}

extension CategoryValueCopy<$R, $Out> on ObjectCopyWith<$R, Category, $Out> {
  CategoryCopyWith<$R, Category, $Out> get $asCategory =>
      $base.as((v, t, t2) => _CategoryCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CategoryCopyWith<$R, $In extends Category, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name});
  CategoryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Category, $Out>
    implements CategoryCopyWith<$R, Category, $Out> {
  _CategoryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Category> $mapper =
      CategoryMapper.ensureInitialized();
  @override
  $R call({String? id, String? name}) => $apply(
    FieldCopyWithData({if (id != null) #id: id, if (name != null) #name: name}),
  );
  @override
  Category $make(CopyWithData data) => Category(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
  );

  @override
  CategoryCopyWith<$R2, Category, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CategoryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CategoryWithStoreListStatusMapper
    extends ClassMapperBase<CategoryWithStoreListStatus> {
  CategoryWithStoreListStatusMapper._();

  static CategoryWithStoreListStatusMapper? _instance;
  static CategoryWithStoreListStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = CategoryWithStoreListStatusMapper._(),
      );
      CategoryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CategoryWithStoreListStatus';

  static String _$id(CategoryWithStoreListStatus v) => v.id;
  static const Field<CategoryWithStoreListStatus, String> _f$id = Field(
    'id',
    _$id,
  );
  static String _$name(CategoryWithStoreListStatus v) => v.name;
  static const Field<CategoryWithStoreListStatus, String> _f$name = Field(
    'name',
    _$name,
  );
  static bool _$storeListStatus(CategoryWithStoreListStatus v) =>
      v.storeListStatus;
  static const Field<CategoryWithStoreListStatus, bool> _f$storeListStatus =
      Field('storeListStatus', _$storeListStatus);

  @override
  final MappableFields<CategoryWithStoreListStatus> fields = const {
    #id: _f$id,
    #name: _f$name,
    #storeListStatus: _f$storeListStatus,
  };

  static CategoryWithStoreListStatus _instantiate(DecodingData data) {
    return CategoryWithStoreListStatus(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      storeListStatus: data.dec(_f$storeListStatus),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CategoryWithStoreListStatus fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CategoryWithStoreListStatus>(map);
  }

  static CategoryWithStoreListStatus fromJson(String json) {
    return ensureInitialized().decodeJson<CategoryWithStoreListStatus>(json);
  }
}

mixin CategoryWithStoreListStatusMappable {
  String toJson() {
    return CategoryWithStoreListStatusMapper.ensureInitialized()
        .encodeJson<CategoryWithStoreListStatus>(
          this as CategoryWithStoreListStatus,
        );
  }

  Map<String, dynamic> toMap() {
    return CategoryWithStoreListStatusMapper.ensureInitialized()
        .encodeMap<CategoryWithStoreListStatus>(
          this as CategoryWithStoreListStatus,
        );
  }

  CategoryWithStoreListStatusCopyWith<
    CategoryWithStoreListStatus,
    CategoryWithStoreListStatus,
    CategoryWithStoreListStatus
  >
  get copyWith =>
      _CategoryWithStoreListStatusCopyWithImpl<
        CategoryWithStoreListStatus,
        CategoryWithStoreListStatus
      >(this as CategoryWithStoreListStatus, $identity, $identity);
  @override
  String toString() {
    return CategoryWithStoreListStatusMapper.ensureInitialized().stringifyValue(
      this as CategoryWithStoreListStatus,
    );
  }

  @override
  bool operator ==(Object other) {
    return CategoryWithStoreListStatusMapper.ensureInitialized().equalsValue(
      this as CategoryWithStoreListStatus,
      other,
    );
  }

  @override
  int get hashCode {
    return CategoryWithStoreListStatusMapper.ensureInitialized().hashValue(
      this as CategoryWithStoreListStatus,
    );
  }
}

extension CategoryWithStoreListStatusValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryWithStoreListStatus, $Out> {
  CategoryWithStoreListStatusCopyWith<$R, CategoryWithStoreListStatus, $Out>
  get $asCategoryWithStoreListStatus => $base.as(
    (v, t, t2) => _CategoryWithStoreListStatusCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CategoryWithStoreListStatusCopyWith<
  $R,
  $In extends CategoryWithStoreListStatus,
  $Out
>
    implements CategoryCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? name, bool? storeListStatus});
  CategoryWithStoreListStatusCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CategoryWithStoreListStatusCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryWithStoreListStatus, $Out>
    implements
        CategoryWithStoreListStatusCopyWith<
          $R,
          CategoryWithStoreListStatus,
          $Out
        > {
  _CategoryWithStoreListStatusCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<CategoryWithStoreListStatus> $mapper =
      CategoryWithStoreListStatusMapper.ensureInitialized();
  @override
  $R call({String? id, String? name, bool? storeListStatus}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (storeListStatus != null) #storeListStatus: storeListStatus,
    }),
  );
  @override
  CategoryWithStoreListStatus $make(CopyWithData data) =>
      CategoryWithStoreListStatus(
        id: data.get(#id, or: $value.id),
        name: data.get(#name, or: $value.name),
        storeListStatus: data.get(#storeListStatus, or: $value.storeListStatus),
      );

  @override
  CategoryWithStoreListStatusCopyWith<$R2, CategoryWithStoreListStatus, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CategoryWithStoreListStatusCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CategoryDetailMapper extends ClassMapperBase<CategoryDetail> {
  CategoryDetailMapper._();

  static CategoryDetailMapper? _instance;
  static CategoryDetailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryDetailMapper._());
      CategoryMapper.ensureInitialized();
      ItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CategoryDetail';

  static String _$id(CategoryDetail v) => v.id;
  static const Field<CategoryDetail, String> _f$id = Field('id', _$id);
  static String _$name(CategoryDetail v) => v.name;
  static const Field<CategoryDetail, String> _f$name = Field('name', _$name);
  static List<Item> _$items(CategoryDetail v) => v.items;
  static const Field<CategoryDetail, List<Item>> _f$items = Field(
    'items',
    _$items,
  );

  @override
  final MappableFields<CategoryDetail> fields = const {
    #id: _f$id,
    #name: _f$name,
    #items: _f$items,
  };

  static CategoryDetail _instantiate(DecodingData data) {
    return CategoryDetail(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      items: data.dec(_f$items),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CategoryDetail fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CategoryDetail>(map);
  }

  static CategoryDetail fromJson(String json) {
    return ensureInitialized().decodeJson<CategoryDetail>(json);
  }
}

mixin CategoryDetailMappable {
  String toJson() {
    return CategoryDetailMapper.ensureInitialized().encodeJson<CategoryDetail>(
      this as CategoryDetail,
    );
  }

  Map<String, dynamic> toMap() {
    return CategoryDetailMapper.ensureInitialized().encodeMap<CategoryDetail>(
      this as CategoryDetail,
    );
  }

  CategoryDetailCopyWith<CategoryDetail, CategoryDetail, CategoryDetail>
  get copyWith => _CategoryDetailCopyWithImpl<CategoryDetail, CategoryDetail>(
    this as CategoryDetail,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return CategoryDetailMapper.ensureInitialized().stringifyValue(
      this as CategoryDetail,
    );
  }

  @override
  bool operator ==(Object other) {
    return CategoryDetailMapper.ensureInitialized().equalsValue(
      this as CategoryDetail,
      other,
    );
  }

  @override
  int get hashCode {
    return CategoryDetailMapper.ensureInitialized().hashValue(
      this as CategoryDetail,
    );
  }
}

extension CategoryDetailValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryDetail, $Out> {
  CategoryDetailCopyWith<$R, CategoryDetail, $Out> get $asCategoryDetail =>
      $base.as((v, t, t2) => _CategoryDetailCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CategoryDetailCopyWith<$R, $In extends CategoryDetail, $Out>
    implements CategoryCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Item, ItemCopyWith<$R, Item, Item>> get items;
  @override
  $R call({String? id, String? name, List<Item>? items});
  CategoryDetailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CategoryDetailCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryDetail, $Out>
    implements CategoryDetailCopyWith<$R, CategoryDetail, $Out> {
  _CategoryDetailCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoryDetail> $mapper =
      CategoryDetailMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Item, ItemCopyWith<$R, Item, Item>> get items =>
      ListCopyWith(
        $value.items,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(items: v),
      );
  @override
  $R call({String? id, String? name, List<Item>? items}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (items != null) #items: items,
    }),
  );
  @override
  CategoryDetail $make(CopyWithData data) => CategoryDetail(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    items: data.get(#items, or: $value.items),
  );

  @override
  CategoryDetailCopyWith<$R2, CategoryDetail, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CategoryDetailCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

