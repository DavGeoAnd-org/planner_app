import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/grocery/item/item_request.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../helper.dart';
import '../../main.dart';
import 'item.dart';
import 'item_detail_screen.dart';
import 'item_new_screen.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ItemsScreenState();
  }
}

class _ItemsScreenState extends State<ItemsScreen> {
  int _searchableListKey = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
      appBar: AppBar(
        title: AutoSizeText('Items', maxLines: ScaffoldDefault.textMaxLines()),
        // leading: BackButton(onPressed: () {}),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final bool? result = await navigatorKey.currentState?.push(
                MaterialPageRoute(builder: (_) => ItemNewScreen()),
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
        child: SearchableList<Item>.async(
          key: ValueKey(_searchableListKey),
          asyncListCallback: () async => await allItems(),
          asyncListFilter: (query, list) async => list
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
                final bool? result = await navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (_) => ItemDetailScreen(
                      item: RecordId.stringValueFromId(data.id),
                    ),
                  ),
                );
                if (result != null && result) {
                  setState(() {
                    _searchableListKey *= -1;
                  });
                }
              },
            ),
          ),
          loadingWidget: const Center(child: CircularProgressIndicator()),
          errorWidget: const Center(child: Icon(Icons.error)),
          inputDecoration: InputDecoration(labelText: ''),
          listViewPadding: SearchableListDefault.listViewPadding(),
        ),
      ),
    );
  }
}
