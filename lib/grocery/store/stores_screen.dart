import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:planner_app/grocery/store/store.dart';
import 'package:planner_app/grocery/store/store_detail_screen.dart';
import 'package:planner_app/main.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StoresScreenState();
  }
}

class _StoresScreenState extends State<StoresScreen> {
  late Future<List<Store>> stores;
  @override
  void initState() {
    super.initState();
    stores = getStores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Stores")),
      body: FutureBuilder(
        future: stores,
        builder: (BuildContext context, AsyncSnapshot<List<Store>> snapshot) {
          if (snapshot.hasData) {
            List<Store> storeList = snapshot.data!;
            return ListView.builder(
              itemCount: storeList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(storeList[index].name),
                    onTap: () {
                      navigatorKey.currentState?.push(
                        MaterialPageRoute(
                          builder: (_) =>
                              StoreDetailScreen(store: storeList[index]),
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
          TextEditingController storeController = TextEditingController();
          bool result = await showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: TextField(
                controller: storeController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter store',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => navigatorKey.currentState?.pop(false),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    addStore(
                      storeController.text,
                    ).then((result) => navigatorKey.currentState?.pop(true));
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          );
          if (result) {
            setState(() {
              stores = getStores();
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  static Future<List<Store>> getStores() async {
    final response = await http
        .get(
          Uri.parse(
            "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/stores",
          ),
        )
        .timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw const HttpException("Service Not Running");
          },
        );

    if (response.statusCode == 200) {
      List<Store> storeList = (json.decode(response.body) as List)
          .map((data) => Store.fromMap(data))
          .toList();
      return storeList;
    } else {
      throw Exception('Failed to load Store list');
    }
  }

  Future<String> addStore(String text) async {
    Store store = Store(name: text);

    final response = await http.post(
      Uri.parse(
        "${const String.fromEnvironment('BASE_SERVICE_URL')}/grocery/stores",
      ),
      body: store.toJson(),
    );

    if (response.statusCode == 201) {
      return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
    } else {
      throw Exception('Failed to add category');
    }
  }
}
