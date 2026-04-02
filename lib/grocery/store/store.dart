import 'package:dart_mappable/dart_mappable.dart';

import '../category/category.dart';

part 'store.mapper.dart';

@MappableClass()
class Store with StoreMappable {
  String id;
  String name;

  Store({required this.id, required this.name});
}

@MappableClass()
class StoreDetail extends Store with StoreDetailMappable {
  List<Category> categories;

  StoreDetail({
    required super.id,
    required super.name,
    required this.categories,
  });
}

@MappableClass()
class StoreWithLocation extends Store with StoreWithLocationMappable {
  String location;

  StoreWithLocation({
    required super.id,
    required super.name,
    required this.location,
  });
}
