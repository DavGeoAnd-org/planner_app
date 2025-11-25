import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:planner_app/grocery/category/category.dart';

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
        .map((data) => Category.fromMap(data))
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
