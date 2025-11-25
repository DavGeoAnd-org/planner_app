import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/grocery/category/categories_screen.dart';
import 'package:planner_app/grocery/item/items_screen.dart';
import 'package:planner_app/grocery/store/stores_screen.dart';
import 'package:planner_app/main.dart';

class GroceryHomeScreen extends StatelessWidget {
  const GroceryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Grocery")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => ItemsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(100),
                backgroundColor: Colors.blueGrey[200],
              ),
              child: AutoSizeText(
                'Items',
                style: TextStyle(fontSize: 50, color: Colors.black),
                maxLines: 1,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => CategoriesScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(100),
                backgroundColor: Colors.blueGrey[200],
              ),
              child: AutoSizeText(
                'Categories',
                style: TextStyle(fontSize: 50, color: Colors.black),
                maxLines: 1,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => StoresScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(100),
                backgroundColor: Colors.blueGrey[200],
              ),
              child: AutoSizeText(
                'Stores',
                style: TextStyle(fontSize: 50, color: Colors.black),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
