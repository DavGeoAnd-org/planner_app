import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/grocery/store/store.dart';
import 'package:planner_app/grocery/store/store_detail_screen.dart';
import 'package:planner_app/grocery/store/store_new_screen.dart';
import 'package:planner_app/grocery/store/store_request.dart';
import 'package:planner_app/helper.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../main.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StoresScreenState();
  }
}

class _StoresScreenState extends State<StoresScreen> {
  int _searchableListKey = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
      appBar: AppBar(
        title: AutoSizeText('Stores', maxLines: ScaffoldDefault.textMaxLines()),
        // leading: BackButton(onPressed: () {}),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final bool? result = await navigatorKey.currentState?.push(
                MaterialPageRoute(builder: (_) => StoreNewScreen()),
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
        child: SearchableList<Store>.async(
          key: ValueKey(_searchableListKey),
          asyncListCallback: () async => await allStores(),
          asyncListFilter: (query, list) => list
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
                    builder: (_) => StoreDetailScreen(
                      store: RecordId.stringValueFromId(data.id),
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
