import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:planner_app/grocery/category/category.dart';
import 'package:planner_app/grocery/item/item.dart';
import 'package:planner_app/grocery/item/items_screen.dart';
import 'package:planner_app/grocery/store/store.dart';

Future<List<Item>> getItems() async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/items",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    List<Item> itemList = (json.decode(response.body) as List)
        .map((data) => Item.fromMap(data))
        .toList();
    return itemList;
  } else {
    throw Exception('Failed to load Item list');
  }
}

Future<String> addItem(
  String text,
  DropdownItem<String> selectedCategory,
  List<StoreTextField> storeLocationFields,
) async {
  Item item = Item(name: text);
  Category category = Category(name: selectedCategory.value);
  List<StoreWithLocation> stores = storeLocationFields
      .map(
        (storeLocationField) => StoreWithLocation(
          store: Store(name: storeLocationField.store),
          location: storeLocationField.controller.text,
        ),
      )
      .toList();

  final itemCreateResponse = await http
      .post(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/items",
        ),
        body: ItemFullDetail(
          item: item,
          category: category,
          stores: stores,
        ).toJson(),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (itemCreateResponse.statusCode == 201) {
    return (jsonDecode(itemCreateResponse.body)
        as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to add item.');
  }
}
