import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multi_dropdown/multi_dropdown.dart';

import 'package:planner_app/grocery/item/item.dart';
import 'package:planner_app/grocery/item/item_detail_screen.dart';
import 'package:planner_app/grocery/item/item_request.dart';
import 'package:planner_app/main.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ItemsScreenState();
  }
}

class _ItemsScreenState extends State<ItemsScreen> {
  late Future<List<Item>> items;
  @override
  void initState() {
    super.initState();
    items = getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Items")),
      body: FutureBuilder(
        future: items,
        builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.hasData) {
            List<Item> itemList = snapshot.data!;
            return ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(itemList[index].name),
                    onTap: () {
                      navigatorKey.currentState?.push(
                        MaterialPageRoute(
                          builder: (_) =>
                              ItemDetailScreen(item: itemList[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool result = await showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController itemNameController =
                  TextEditingController();
              MultiSelectController<String> categorySelectController =
                  MultiSelectController();
              MultiSelectController<String> storeSelectController =
                  MultiSelectController();
              List<StoreTextField> storeTextFields = [];
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10,
                      children: [
                        TextField(
                          controller: itemNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter item name',
                          ),
                        ),
                        MultiDropdown<String>.future(
                          controller: categorySelectController,
                          searchEnabled: true,
                          singleSelect: true,
                          future: () async {
                            final response = await http.get(
                              Uri.parse(
                                "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/categories",
                              ),
                            );
                            final data = jsonDecode(response.body) as List;
                            return data
                                .map(
                                  (e) => DropdownItem(
                                    label: e['name'] as String,
                                    value: e['name'] as String,
                                  ),
                                )
                                .toList();
                          },
                        ),
                        MultiDropdown<String>.future(
                          controller: storeSelectController,
                          searchEnabled: true,
                          future: () async {
                            final response = await http.get(
                              Uri.parse(
                                "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/stores",
                              ),
                            );
                            final data = jsonDecode(response.body) as List;
                            return data
                                .map(
                                  (e) => DropdownItem(
                                    label: e['name'] as String,
                                    value: e['name'] as String,
                                  ),
                                )
                                .toList();
                          },
                          onSelectionChange: (selectedItems) {
                            storeTextFields.clear();
                            setState(() {
                              for (String selectedStore in selectedItems) {
                                StoreTextField storeTextField = StoreTextField(
                                  store: selectedStore,
                                );
                                storeTextFields.add(storeTextField);
                              }
                            });
                          },
                        ),
                        for (var i = 0; i < storeTextFields.length; i++)
                          Container(
                            margin: EdgeInsets.all(5),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Column(children: [storeTextFields[i]]),
                            ),
                          ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => navigatorKey.currentState?.pop(false),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          addItem(
                            itemNameController.text,
                            categorySelectController.selectedItems.single,
                            storeTextFields,
                          ).then(
                            (result) => navigatorKey.currentState?.pop(true),
                          );
                        },
                        child: Text('Add'),
                      ),
                    ],
                  );
                },
              );
            },
          );
          if (result) {
            setState(() {
              items = getItems();
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class StoreTextField extends StatelessWidget {
  final String store;
  final TextEditingController controller = TextEditingController();

  StoreTextField({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: store),
    );
  }
}
