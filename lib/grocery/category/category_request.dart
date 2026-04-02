import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:planner_app/grocery/category/category.dart';

Future<List<Category>> allCategories() async {
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
        .map((data) => CategoryMapper.fromMap(data))
        .toList();
    return categoryList;
  } else {
    throw Exception('Failed to load Category list');
  }
}

Future<String> addCategory(String name) async {
  Category category = Category(id: '', name: name);

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

Future<Category> category(String id) async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/categories/$id",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    return CategoryMapper.fromJson(response.body);
  } else {
    throw Exception('Failed to load Category');
  }
}

Future<String> removeCategory(String id) async {
  final response = await http.delete(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/categories/$id",
    ),
  );

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to remove Category');
  }
}

Future<List<String>> addCategoryToStoreLists(String category) async {
  final response = await http
      .post(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/categories/$category/storeList",
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

Future<List<CategoryWithStoreListStatus>>
allCategoriesWithStoreListStatus() async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/categories?status=true",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    List<CategoryWithStoreListStatus> categoryList =
        (json.decode(response.body) as List)
            .map((data) => CategoryWithStoreListStatusMapper.fromMap(data))
            .toList();
    return categoryList;
  } else {
    throw Exception('Failed to load CategoryWithStoreListStatus list');
  }
}

Future<List<String>> removeCategoryFromStoreLists(String category) async {
  final response = await http
      .delete(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/categories/$category/storeList",
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
    throw Exception('Failed to remove category from store lists');
  }
}

Future<CategoryDetail> categoryDetail(String id) async {
  final response = await http
      .get(
        Uri.parse(
          "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/categories/$id?detail=true",
        ),
      )
      .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const HttpException("Service Not Running");
        },
      );

  if (response.statusCode == 200) {
    return CategoryDetailMapper.fromJson(response.body);
  } else {
    throw Exception('Failed to load CategoryDetail');
  }
}
