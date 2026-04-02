import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:planner_app/grocery/category/category.dart';
import 'package:planner_app/grocery/item/item.dart';
import 'package:planner_app/grocery/store/store.dart';

Future<List<Store>> allStores() async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/stores",
        ),
      )
      .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    List<Store> storeList = (json.decode(response.body) as List)
        .map((data) => StoreMapper.fromMap(data))
        .toList();
    return storeList;
  } else {
    throw Exception('Failed to load Store list');
  }
}

Future<String> addStore(String name) async {
  Store store = Store(id: '', name: name);

  final response = await http.post(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/stores",
    ),
    body: store.toJson(),
  );

  if (response.statusCode == 201) {
    return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to add Store');
  }
}

Future<Store> store(String id) async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/stores/$id",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    return StoreMapper.fromJson(response.body);
  } else {
    throw Exception('Failed to load Store');
  }
}

Future<String> removeStore(String id) async {
  final response = await http.delete(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/stores/$id",
    ),
  );

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to remove Store');
  }
}

Future<StoreDetail> storeDetail(String id) async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/stores/$id?detail=true",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    return StoreDetailMapper.fromJson(response.body);
  } else {
    throw Exception('Failed to load StoreDetail');
  }
}

Future<List<Category>> storeList(String store) async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/stores/$store/list",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    List<Category> categoryList = (json.decode(response.body) as List)
        .map((data) => CategoryMapper.fromMap(data))
        .toList();
    return categoryList;
  } else {
    throw Exception('Failed to load Category list');
  }
}

Future<List<String>> removeCategoryFromLists(String category) async {
  final response = await http
      .delete(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/categories/$category/stores/list",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    return (json.decode(response.body) as List)
        .map((data) => data.toString())
        .toList();
  } else {
    throw Exception('Failed to remove category to store lists');
  }
}

Future<List<ItemWithLocation>> getItemsForCategoryAtStore(
  String store,
  String category,
) async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/stores/$store/list/$category",
        ),
      )
      .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    List<ItemWithLocation> itemWithLocationList =
        (json.decode(response.body) as List)
            .map((data) => ItemWithLocationMapper.fromMap(data))
            .toList();
    return itemWithLocationList;
  } else {
    throw Exception('Failed to load Items with Location');
  }
}
