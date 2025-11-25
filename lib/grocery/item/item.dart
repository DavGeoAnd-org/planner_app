import 'dart:convert';

import 'package:flutter/foundation.dart' hide Category;
import 'package:planner_app/grocery/category/category.dart';
import 'package:planner_app/grocery/store/store.dart';

class Item {
  String? id;
  String name;
  Item({this.id, required this.name});

  Item copyWith({String? id, String? name}) {
    return Item(id: id ?? this.id, name: name ?? this.name);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'name': name});

    return result;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(id: map['id'], name: map['name'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() => 'Item(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class ItemFullDetail {
  Item item;
  Category category;
  List<StoreWithLocation> stores;
  ItemFullDetail({
    required this.item,
    required this.category,
    required this.stores,
  });

  ItemFullDetail copyWith({
    Item? item,
    Category? category,
    List<StoreWithLocation>? stores,
  }) {
    return ItemFullDetail(
      item: item ?? this.item,
      category: category ?? this.category,
      stores: stores ?? this.stores,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'item': item.toMap()});
    result.addAll({'category': category.toMap()});
    result.addAll({'stores': stores.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ItemFullDetail.fromMap(Map<String, dynamic> map) {
    return ItemFullDetail(
      item: Item.fromMap(map['item']),
      category: Category.fromMap(map['category']),
      stores: List<StoreWithLocation>.from(
        map['stores']?.map((x) => StoreWithLocation.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemFullDetail.fromJson(String source) =>
      ItemFullDetail.fromMap(json.decode(source));

  @override
  String toString() =>
      'ItemFullDetail(item: $item, category: $category, stores: $stores)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemFullDetail &&
        other.item == item &&
        other.category == category &&
        listEquals(other.stores, stores);
  }

  @override
  int get hashCode => item.hashCode ^ category.hashCode ^ stores.hashCode;
}
