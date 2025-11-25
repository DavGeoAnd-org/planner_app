import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/grocery/category/category.dart';
import 'package:planner_app/grocery/store/store.dart';
import 'package:planner_app/grocery/store/store_request.dart';
import 'package:planner_app/main.dart';

class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen({super.key, required this.store});
  final Store store;
  @override
  State<StatefulWidget> createState() {
    return _StoreDetailScreenState();
  }
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  late Future<List<Category>> listCategories;
  @override
  void initState() {
    super.initState();
    listCategories = storeList(widget.store.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(widget.store.name)),
      body: Center(
        child: FutureBuilder(
          future: listCategories,
          builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.hasData) {
              List<Category> categoryList = snapshot.data!;
              return Column(
                spacing: 20,
                children: [
                  AutoSizeText(widget.store.name, maxFontSize: 30, maxLines: 2),
                  Expanded(
                    child: ListView.builder(
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(categoryList[index].name),
                            onTap: () {},
                            trailing: IconButton(
                              onPressed: () async {
                                List<String> storesList =
                                    await removeCategoryFromLists(
                                      categoryList[index].name,
                                    );
                                final snackBar = SnackBar(
                                  content: Text(
                                    "Removed from: ${storesList.reduce((value, element) => "$value, $element")}",
                                  ),
                                );
                                scaffoldKey.currentState!.showSnackBar(
                                  snackBar,
                                );
                                setState(() {
                                  listCategories = storeList(widget.store.name);
                                });
                              },
                              icon: Icon(Icons.remove),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
