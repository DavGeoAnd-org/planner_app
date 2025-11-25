import 'package:flutter/material.dart';
import 'package:planner_app/grocery/category/category.dart';
import 'package:planner_app/grocery/category/category_detail_screen.dart';
import 'package:planner_app/grocery/category/category_request.dart';
import 'package:planner_app/main.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CategoriesScreenState();
  }
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List<Category>> categories;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Categories")),
      body: FutureBuilder(
        future: categories,
        builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.hasData) {
            List<Category> categoryList = snapshot.data!;
            return ListView.builder(
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(categoryList[index].name),
                    onTap: () {
                      navigatorKey.currentState?.push(
                        MaterialPageRoute(
                          builder: (_) => CategoryDetailScreen(
                            category: categoryList[index],
                          ),
                        ),
                      );
                    },
                    trailing: IconButton(
                      onPressed: () async {
                        List<String> storesList = await addCategoryToLists(
                          categoryList[index].name,
                        );
                        final snackBar = SnackBar(
                          content: Text(
                            "Added to: ${storesList.reduce((value, element) => "$value, $element")}",
                          ),
                        );
                        scaffoldKey.currentState!.showSnackBar(snackBar);
                      },
                      icon: Icon(Icons.add),
                    ),
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
          TextEditingController categoryController = TextEditingController();
          bool result = await showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: TextField(
                controller: categoryController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter category',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => navigatorKey.currentState?.pop(false),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    addCategory(
                      categoryController.text,
                    ).then((result) => navigatorKey.currentState?.pop(true));
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          );
          if (result) {
            setState(() {
              categories = getCategories();
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
