import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/grocery/store/store.dart';
import 'package:planner_app/grocery/store/store_request.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../helper.dart';
import '../../main.dart';
import '../category/category.dart';
import '../category/category_request.dart';
import '../item/item_detail_screen.dart';

class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen({super.key, required this.store});

  final String store;

  @override
  State<StatefulWidget> createState() {
    return _StoreDetailScreenState();
  }
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
      appBar: AppBar(
        title: AutoSizeText(
          widget.store,
          maxLines: ScaffoldDefault.textMaxLines(),
        ),
        leading: BackButton(
          onPressed: () {
            navigatorKey.currentState?.pop(false);
          },
        ),
        actions: [],
      ),
      body: FutureBuilder(
        future: storeDetail(widget.store),
        builder: (BuildContext context, AsyncSnapshot<StoreDetail> snapshot) {
          if (snapshot.hasData) {
            StoreDetail storeDetail = snapshot.data!;
            List<Category> categories = storeDetail.categories;
            return SafeArea(
              minimum: SafeAreaDefault.minimum(),
              child: Column(
                crossAxisAlignment: ColumnDefault.crossAxisAlignment(),
                spacing: ColumnDefault.spacing(),
                children: [
                  Expanded(
                    child: SearchableList<Category>(
                      key: ValueKey(categories.length),
                      initialList: categories,
                      filter: (query) => categories
                          .where(
                            (category) => category.name.toUpperCase().contains(
                              query.toUpperCase(),
                            ),
                          )
                          .toList(),
                      itemBuilder: (category) => Card(
                        child: ListTile(
                          title: AutoSizeText(
                            category.name,
                            maxLines: SearchableListDefault.textMaxLines(),
                          ),
                          onTap: () async {
                            _showDialog(
                              RecordId.stringValueFromId(storeDetail.id),
                              RecordId.stringValueFromId(category.id),
                            );
                          },
                          trailing: IconButton(
                            onPressed: () async {
                              List<String> storesList =
                                  await removeCategoryFromStoreLists(
                                    RecordId.stringValueFromId(category.id),
                                  );
                              categories.remove(category);
                              final snackBar = SnackBar(
                                content: Text(
                                  "Removed from: ${storesList.reduce((value, element) => "$value, $element")}",
                                ),
                              );
                              scaffoldKey.currentState!.showSnackBar(snackBar);
                              setState(() {});
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ),
                      ),
                      inputDecoration: InputDecoration(
                        labelText: 'Search Item in Store List',
                      ),
                      listViewPadding: SearchableListDefault.listViewPadding(),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FloatingActionButton.extended(
                          onPressed: () async {
                            await removeStore(
                              RecordId.stringValueFromId(storeDetail.id),
                            );
                            navigatorKey.currentState?.pop(true);
                          },
                          icon: Icon(Icons.remove),
                          label: Text('Remove'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _showDialog(String storeId, String categoryId) {
    getItemsForCategoryAtStore(storeId, categoryId).then((value) {
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Items"),
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: AutoSizeText(
                              '${value[index].name}: ${value[index].location}',
                              maxLines: 3,
                            ),
                            onTap: () async {
                              final bool? result = await navigatorKey
                                  .currentState
                                  ?.push(
                                    MaterialPageRoute(
                                      builder: (_) => ItemDetailScreen(
                                        item: RecordId.stringValueFromId(
                                          value[index].id,
                                        ),
                                      ),
                                    ),
                                  );
                              if (result != null && result) {
                                setState(() {});
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  navigatorKey.currentState?.pop(false);
                },
                child: Text("Close"),
              ),
            ],
          );
        },
      );
    });
  }
}
