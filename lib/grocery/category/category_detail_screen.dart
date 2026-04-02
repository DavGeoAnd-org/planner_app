import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/grocery/item/item.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../helper.dart';
import '../../main.dart';
import '../item/item_detail_screen.dart';
import 'category.dart';
import 'category_request.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key, required this.category});

  final String category;

  @override
  State<StatefulWidget> createState() {
    return _CategoryDetailScreenState();
  }
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  int _futureBuilderKey = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
      appBar: AppBar(
        title: AutoSizeText(
          widget.category,
          maxLines: ScaffoldDefault.textMaxLines(),
        ),
        // leading: BackButton(onPressed: () {}),
        actions: [],
      ),
      body: FutureBuilder(
        key: ValueKey(_futureBuilderKey),
        future: categoryDetail(widget.category),
        builder: (BuildContext context, AsyncSnapshot<CategoryDetail> snapshot) {
          if (snapshot.hasData) {
            CategoryDetail categoryDetail = snapshot.data!;
            List<Item> items = categoryDetail.items;
            return SafeArea(
              minimum: SafeAreaDefault.minimum(),
              child: Column(
                crossAxisAlignment: ColumnDefault.crossAxisAlignment(),
                spacing: ColumnDefault.spacing(),
                children: [
                  Expanded(
                    child: SearchableList<Item>(
                      initialList: items,
                      filter: (query) => items
                          .where(
                            (data) => data.name.toUpperCase().contains(query.toUpperCase()),
                          )
                          .toList(),
                      itemBuilder: (data) => Card(
                        child: ListTile(
                          title: AutoSizeText(
                            data.name,
                            maxLines: SearchableListDefault.textMaxLines(),
                          ),
                          onTap: () async {
                            final bool? result = await navigatorKey.currentState
                                ?.push(
                                  MaterialPageRoute(
                                    builder: (_) => ItemDetailScreen(
                                      item: RecordId.stringValueFromId(data.id),
                                    ),
                                  ),
                                );
                            if (result != null && result) {
                              setState(() {
                                _futureBuilderKey *= -1;
                              });
                            }
                          },
                        ),
                      ),
                      inputDecoration: InputDecoration(
                        labelText: 'Search Item',
                      ),
                      listViewPadding: SearchableListDefault.listViewPadding(),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FloatingActionButton.extended(
                          onPressed: () async {
                            // await removeCategory(
                            //   RecordId.stringValueFromId(categoryDetail.id),
                            // );
                            // navigatorKey.currentState?.pop(true);
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
}
