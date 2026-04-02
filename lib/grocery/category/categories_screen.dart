import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/grocery/category/category.dart';
import 'package:planner_app/grocery/category/category_detail_screen.dart';
import 'package:planner_app/grocery/category/category_request.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../helper.dart';
import '../../main.dart';
import 'category_new_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CategoriesScreenState();
  }
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _searchableListKey = 1;
  int _listTileKey = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
      appBar: AppBar(
        title: AutoSizeText(
          'Categories',
          maxLines: ScaffoldDefault.textMaxLines(),
        ),
        // leading: BackButton(onPressed: () {}),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final bool? result = await navigatorKey.currentState?.push(
                MaterialPageRoute(builder: (_) => CategoryNewScreen()),
              );
              if (result != null && result) {
                setState(() {
                  _searchableListKey *= -1;
                });
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        minimum: SafeAreaDefault.minimum(),
        child: SearchableList<CategoryWithStoreListStatus>.async(
          key: ValueKey(_searchableListKey),
          asyncListCallback: () async =>
              await allCategoriesWithStoreListStatus(),
          asyncListFilter: (query, list) => list
              .where(
                (category) => category.name.toUpperCase().contains(query.toUpperCase()),
              )
              .toList(),
          itemBuilder: (category) => Card(
            child: ListTile(
              key: ValueKey(_listTileKey),
              title: AutoSizeText(
                category.name,
                maxLines: SearchableListDefault.textMaxLines(),
              ),
              onTap: () async {
                final bool? result = await navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (_) => CategoryDetailScreen(
                      category: RecordId.stringValueFromId(category.id),
                    ),
                  ),
                );
                if (result != null && result) {
                  setState(() {
                    _searchableListKey *= -1;
                  });
                }
              },
              trailing: category.storeListStatus
                  ? IconButton(
                      onPressed: () async {
                        List<String> storesList =
                            await removeCategoryFromStoreLists(
                              RecordId.stringValueFromId(category.id),
                            );
                        category.storeListStatus = false;
                        final snackBar = SnackBar(
                          content: Text(
                            "Removed from: ${storesList.reduce((value, element) => "$value, $element")}",
                          ),
                        );
                        scaffoldKey.currentState!.showSnackBar(snackBar);
                        setState(() {
                          _listTileKey *= -1;
                        });
                      },
                      icon: Icon(Icons.remove),
                    )
                  : IconButton(
                      onPressed: () async {
                        List<String> storesList = await addCategoryToStoreLists(
                          RecordId.stringValueFromId(category.id),
                        );
                        category.storeListStatus = true;
                        final snackBar = SnackBar(
                          content: Text(
                            "Added to: ${storesList.reduce((value, element) => "$value, $element")}",
                          ),
                        );
                        scaffoldKey.currentState!.showSnackBar(snackBar);
                        setState(() {
                          _listTileKey *= -1;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
            ),
          ),
          loadingWidget: const Center(child: CircularProgressIndicator()),
          errorWidget: const Center(child: Icon(Icons.error)),
          inputDecoration: InputDecoration(labelText: 'Search Category'),
          listViewPadding: SearchableListDefault.listViewPadding(),
        ),
      ),
    );
  }
}
