import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:planner_app/grocery/category/category.dart';
import 'package:planner_app/grocery/item/item.dart';

import '../store/store.dart';

Future<List<Item>> allItems() async {
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
        .map((data) => ItemMapper.fromMap(data))
        .toList();
    return itemList;
  } else {
    throw Exception('Failed to load Item list');
  }
}

Future<String> addItem(String name) async {
  Item item = Item(id: '', name: name);

  final response = await http
      .post(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/items",
        ),
        body: item.toJson(),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 201) {
    return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to add item');
  }
}

Future<Item> item(String id) async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/items/$id",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    return ItemMapper.fromJson(response.body);
  } else {
    throw Exception('Failed to load Item');
  }
}

Future<String> removeItem(String id) async {
  final response = await http.delete(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/items/$id",
    ),
  );

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to remove Item');
  }
}

Future<ItemDetail> itemDetail(String id) async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/items/$id?detail=true",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    return ItemDetailMapper.fromJson(response.body);
  } else {
    throw Exception('Failed to load ItemDetail');
  }
}

Future<String> addItemDetail(
  String name,
  Category category,
  List<StoreLocationInput> storeLocationInputs,
) async {
  List<StoreWithLocation> stores = List.empty(growable: true);
  for (StoreLocationInput storeLocationInput in storeLocationInputs) {
    StoreWithLocation storeWithLocation = StoreWithLocation(
      id: storeLocationInput.storeController.selectedItems.first.value.id,
      name: storeLocationInput.storeController.selectedItems.first.value.name,
      location: storeLocationInput.locationController.text,
    );
    stores.add(storeWithLocation);
  }
  ItemDetail itemDetail = ItemDetail(
    id: '',
    name: name,
    category: category,
    stores: stores,
  );

  final response = await http
      .post(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/items?detail=true",
        ),
        body: itemDetail.toJson(),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 201) {
    return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to add ItemDetail');
  }
}

Future<String> updateItem(
  ItemDetail itemDetail,
  Category category,
  List<StoreLocationInput> storeLocationInputs,
) async {
  List<StoreWithLocation> stores = List.empty(growable: true);
  for (StoreLocationInput storeLocationInput in storeLocationInputs) {
    StoreWithLocation storeWithLocation = StoreWithLocation(
      id: storeLocationInput.storeController.selectedItems.first.value.id,
      name: storeLocationInput.storeController.selectedItems.first.value.name,
      location: storeLocationInput.locationController.text,
    );
    stores.add(storeWithLocation);
  }
  itemDetail.category = category;
  itemDetail.stores = stores;

  final response = await http
      .put(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/items",
        ),
        body: itemDetail.toJson(),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to update ItemDetail');
  }
}
