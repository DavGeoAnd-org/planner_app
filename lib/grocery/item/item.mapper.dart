// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'item.dart';

class ItemMapper extends ClassMapperBase<Item> {
  ItemMapper._();

  static ItemMapper? _instance;
  static ItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemMapper._());
      ItemDetailMapper.ensureInitialized();
      ItemWithLocationMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Item';

  static String _$id(Item v) => v.id;
  static const Field<Item, String> _f$id = Field('id', _$id);
  static String _$name(Item v) => v.name;
  static const Field<Item, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Item> fields = const {#id: _f$id, #name: _f$name};

  static Item _instantiate(DecodingData data) {
    return Item(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Item fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Item>(map);
  }

  static Item fromJson(String json) {
    return ensureInitialized().decodeJson<Item>(json);
  }
}

mixin ItemMappable {
  String toJson() {
    return ItemMapper.ensureInitialized().encodeJson<Item>(this as Item);
  }

  Map<String, dynamic> toMap() {
    return ItemMapper.ensureInitialized().encodeMap<Item>(this as Item);
  }

  ItemCopyWith<Item, Item, Item> get copyWith =>
      _ItemCopyWithImpl<Item, Item>(this as Item, $identity, $identity);
  @override
  String toString() {
    return ItemMapper.ensureInitialized().stringifyValue(this as Item);
  }

  @override
  bool operator ==(Object other) {
    return ItemMapper.ensureInitialized().equalsValue(this as Item, other);
  }

  @override
  int get hashCode {
    return ItemMapper.ensureInitialized().hashValue(this as Item);
  }
}

extension ItemValueCopy<$R, $Out> on ObjectCopyWith<$R, Item, $Out> {
  ItemCopyWith<$R, Item, $Out> get $asItem =>
      $base.as((v, t, t2) => _ItemCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ItemCopyWith<$R, $In extends Item, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name});
  ItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ItemCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Item, $Out>
    implements ItemCopyWith<$R, Item, $Out> {
  _ItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Item> $mapper = ItemMapper.ensureInitialized();
  @override
  $R call({String? id, String? name}) => $apply(
    FieldCopyWithData({if (id != null) #id: id, if (name != null) #name: name}),
  );
  @override
  Item $make(CopyWithData data) => Item(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
  );

  @override
  ItemCopyWith<$R2, Item, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ItemDetailMapper extends ClassMapperBase<ItemDetail> {
  ItemDetailMapper._();

  static ItemDetailMapper? _instance;
  static ItemDetailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemDetailMapper._());
      ItemMapper.ensureInitialized();
      CategoryMapper.ensureInitialized();
      StoreWithLocationMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ItemDetail';

  static String _$id(ItemDetail v) => v.id;
  static const Field<ItemDetail, String> _f$id = Field('id', _$id);
  static String _$name(ItemDetail v) => v.name;
  static const Field<ItemDetail, String> _f$name = Field('name', _$name);
  static Category _$category(ItemDetail v) => v.category;
  static const Field<ItemDetail, Category> _f$category = Field(
    'category',
    _$category,
  );
  static List<StoreWithLocation> _$stores(ItemDetail v) => v.stores;
  static const Field<ItemDetail, List<StoreWithLocation>> _f$stores = Field(
    'stores',
    _$stores,
  );

  @override
  final MappableFields<ItemDetail> fields = const {
    #id: _f$id,
    #name: _f$name,
    #category: _f$category,
    #stores: _f$stores,
  };

  static ItemDetail _instantiate(DecodingData data) {
    return ItemDetail(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      category: data.dec(_f$category),
      stores: data.dec(_f$stores),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ItemDetail fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ItemDetail>(map);
  }

  static ItemDetail fromJson(String json) {
    return ensureInitialized().decodeJson<ItemDetail>(json);
  }
}

mixin ItemDetailMappable {
  String toJson() {
    return ItemDetailMapper.ensureInitialized().encodeJson<ItemDetail>(
      this as ItemDetail,
    );
  }

  Map<String, dynamic> toMap() {
    return ItemDetailMapper.ensureInitialized().encodeMap<ItemDetail>(
      this as ItemDetail,
    );
  }

  ItemDetailCopyWith<ItemDetail, ItemDetail, ItemDetail> get copyWith =>
      _ItemDetailCopyWithImpl<ItemDetail, ItemDetail>(
        this as ItemDetail,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ItemDetailMapper.ensureInitialized().stringifyValue(
      this as ItemDetail,
    );
  }

  @override
  bool operator ==(Object other) {
    return ItemDetailMapper.ensureInitialized().equalsValue(
      this as ItemDetail,
      other,
    );
  }

  @override
  int get hashCode {
    return ItemDetailMapper.ensureInitialized().hashValue(this as ItemDetail);
  }
}

extension ItemDetailValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ItemDetail, $Out> {
  ItemDetailCopyWith<$R, ItemDetail, $Out> get $asItemDetail =>
      $base.as((v, t, t2) => _ItemDetailCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ItemDetailCopyWith<$R, $In extends ItemDetail, $Out>
    implements ItemCopyWith<$R, $In, $Out> {
  CategoryCopyWith<$R, Category, Category> get category;
  ListCopyWith<
    $R,
    StoreWithLocation,
    StoreWithLocationCopyWith<$R, StoreWithLocation, StoreWithLocation>
  >
  get stores;
  @override
  $R call({
    String? id,
    String? name,
    Category? category,
    List<StoreWithLocation>? stores,
  });
  ItemDetailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ItemDetailCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ItemDetail, $Out>
    implements ItemDetailCopyWith<$R, ItemDetail, $Out> {
  _ItemDetailCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ItemDetail> $mapper =
      ItemDetailMapper.ensureInitialized();
  @override
  CategoryCopyWith<$R, Category, Category> get category =>
      $value.category.copyWith.$chain((v) => call(category: v));
  @override
  ListCopyWith<
    $R,
    StoreWithLocation,
    StoreWithLocationCopyWith<$R, StoreWithLocation, StoreWithLocation>
  >
  get stores => ListCopyWith(
    $value.stores,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(stores: v),
  );
  @override
  $R call({
    String? id,
    String? name,
    Category? category,
    List<StoreWithLocation>? stores,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (category != null) #category: category,
      if (stores != null) #stores: stores,
    }),
  );
  @override
  ItemDetail $make(CopyWithData data) => ItemDetail(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    category: data.get(#category, or: $value.category),
    stores: data.get(#stores, or: $value.stores),
  );

  @override
  ItemDetailCopyWith<$R2, ItemDetail, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ItemDetailCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ItemWithLocationMapper extends ClassMapperBase<ItemWithLocation> {
  ItemWithLocationMapper._();

  static ItemWithLocationMapper? _instance;
  static ItemWithLocationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemWithLocationMapper._());
      ItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ItemWithLocation';

  static String _$id(ItemWithLocation v) => v.id;
  static const Field<ItemWithLocation, String> _f$id = Field('id', _$id);
  static String _$name(ItemWithLocation v) => v.name;
  static const Field<ItemWithLocation, String> _f$name = Field('name', _$name);
  static String _$location(ItemWithLocation v) => v.location;
  static const Field<ItemWithLocation, String> _f$location = Field(
    'location',
    _$location,
  );

  @override
  final MappableFields<ItemWithLocation> fields = const {
    #id: _f$id,
    #name: _f$name,
    #location: _f$location,
  };

  static ItemWithLocation _instantiate(DecodingData data) {
    return ItemWithLocation(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      location: data.dec(_f$location),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ItemWithLocation fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ItemWithLocation>(map);
  }

  static ItemWithLocation fromJson(String json) {
    return ensureInitialized().decodeJson<ItemWithLocation>(json);
  }
}

mixin ItemWithLocationMappable {
  String toJson() {
    return ItemWithLocationMapper.ensureInitialized()
        .encodeJson<ItemWithLocation>(this as ItemWithLocation);
  }

  Map<String, dynamic> toMap() {
    return ItemWithLocationMapper.ensureInitialized()
        .encodeMap<ItemWithLocation>(this as ItemWithLocation);
  }

  ItemWithLocationCopyWith<ItemWithLocation, ItemWithLocation, ItemWithLocation>
  get copyWith =>
      _ItemWithLocationCopyWithImpl<ItemWithLocation, ItemWithLocation>(
        this as ItemWithLocation,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ItemWithLocationMapper.ensureInitialized().stringifyValue(
      this as ItemWithLocation,
    );
  }

  @override
  bool operator ==(Object other) {
    return ItemWithLocationMapper.ensureInitialized().equalsValue(
      this as ItemWithLocation,
      other,
    );
  }

  @override
  int get hashCode {
    return ItemWithLocationMapper.ensureInitialized().hashValue(
      this as ItemWithLocation,
    );
  }
}

extension ItemWithLocationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ItemWithLocation, $Out> {
  ItemWithLocationCopyWith<$R, ItemWithLocation, $Out>
  get $asItemWithLocation =>
      $base.as((v, t, t2) => _ItemWithLocationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ItemWithLocationCopyWith<$R, $In extends ItemWithLocation, $Out>
    implements ItemCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? name, String? location});
  ItemWithLocationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ItemWithLocationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ItemWithLocation, $Out>
    implements ItemWithLocationCopyWith<$R, ItemWithLocation, $Out> {
  _ItemWithLocationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ItemWithLocation> $mapper =
      ItemWithLocationMapper.ensureInitialized();
  @override
  $R call({String? id, String? name, String? location}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (location != null) #location: location,
    }),
  );
  @override
  ItemWithLocation $make(CopyWithData data) => ItemWithLocation(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    location: data.get(#location, or: $value.location),
  );

  @override
  ItemWithLocationCopyWith<$R2, ItemWithLocation, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ItemWithLocationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

