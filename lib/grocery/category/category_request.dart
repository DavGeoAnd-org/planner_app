import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:planner_app/grocery/category/category.dart';

Future<List<Category>> getCategories() async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/categories",
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

Future<String> addCategory(String text) async {
  Category category = Category(name: text);

  final response = await http
      .post(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/categories",
        ),
        body: category.toJson(),
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
    throw Exception('Failed to add category');
  }
}

Future<List<String>> addCategoryToLists(String category) async {
  final response = await http
      .post(
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

  if (response.statusCode == 201) {
    return (json.decode(response.body) as List)
        .map((data) => data.toString())
        .toList();
  } else {
    throw Exception('Failed to add category to store lists');
  }
}
