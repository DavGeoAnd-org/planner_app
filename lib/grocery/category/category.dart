import 'package:dart_mappable/dart_mappable.dart' hide ItemCopyWith;

import '../item/item.dart';

part 'category.mapper.dart';

@MappableClass()
class Category with CategoryMappable {
  String id;
  String name;

  Category({required this.id, required this.name});
}

@MappableClass()
class CategoryWithStoreListStatus extends Category
    with CategoryWithStoreListStatusMappable {
  bool storeListStatus;

  CategoryWithStoreListStatus({
    required super.id,
    required super.name,
    required this.storeListStatus,
  });
}

@MappableClass()
class CategoryDetail extends Category with CategoryDetailMappable {
  List<Item> items;

  CategoryDetail({required super.id, required super.name, required this.items});
}
