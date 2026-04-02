import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/grocery/category/categories_screen.dart';
import 'package:planner_app/grocery/item/items_screen.dart';
import 'package:planner_app/grocery/store/stores_screen.dart';
import 'package:planner_app/main.dart';

import '../helper.dart';

class GroceryHomeScreen extends StatelessWidget {
  const GroceryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
      appBar: AppBar(
        title: AutoSizeText(
          'Grocery',
          maxLines: ElevatedButtonDefault.textMaxLines(),
        ),
        // leading: BackButton(onPressed: () {}),
        actions: [],
      ),
      body: SafeArea(
        minimum: SafeAreaDefault.minimum(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: ColumnDefault.crossAxisAlignment(),
            spacing: ColumnDefault.spacing(),
            children: [
              ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState?.push(
                    MaterialPageRoute(builder: (_) => ItemsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: ElevatedButtonDefault.minimumSize(),
                  backgroundColor: ElevatedButtonDefault.backgroundColor(),
                ),
                child: AutoSizeText(
                  'Items',
                  style: TextStyle(
                    fontSize: ElevatedButtonDefault.textFontSize(),
                    color: ElevatedButtonDefault.textColor(),
                  ),
                  maxLines: ElevatedButtonDefault.textMaxLines(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState?.push(
                    MaterialPageRoute(builder: (_) => CategoriesScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: ElevatedButtonDefault.minimumSize(),
                  backgroundColor: ElevatedButtonDefault.backgroundColor(),
                ),
                child: AutoSizeText(
                  'Categories',
                  style: TextStyle(
                    fontSize: ElevatedButtonDefault.textFontSize(),
                    color: ElevatedButtonDefault.textColor(),
                  ),
                  maxLines: ElevatedButtonDefault.textMaxLines(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState?.push(
                    MaterialPageRoute(builder: (_) => StoresScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: ElevatedButtonDefault.minimumSize(),
                  backgroundColor: ElevatedButtonDefault.backgroundColor(),
                ),
                child: AutoSizeText(
                  'Stores',
                  style: TextStyle(
                    fontSize: ElevatedButtonDefault.textFontSize(),
                    color: ElevatedButtonDefault.textColor(),
                  ),
                  maxLines: ElevatedButtonDefault.textMaxLines(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
