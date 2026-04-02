import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:planner_app/grocery/category/category_request.dart';
import 'package:planner_app/grocery/store/store_request.dart';

import '../../helper.dart';
import '../../main.dart';
import '../category/category.dart';
import '../store/store.dart';
import 'item.dart';
import 'item_request.dart';

class ItemNewScreen extends StatefulWidget {
  const ItemNewScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ItemNewScreenState();
  }
}

class _ItemNewScreenState extends State<ItemNewScreen> {
  bool _isLoading = true;
  late List<Category> _categories;
  late List<Store> _stores;
  final List<StoreLocationInput> _storeLocationInputs = [];
  final TextEditingController _nameController = TextEditingController();
  final MultiSelectController<Category> _categoryController =
      MultiSelectController();

  @override
  void initState() {
    super.initState();
    allCategories()
        .then((value) {
          _categories = value;
        })
        .whenComplete(() {
          allStores()
              .then((value) {
                _stores = value;
                addStoreLocationInput();
              })
              .whenComplete(() {
                setState(() {
                  _isLoading = false;
                });
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
        appBar: AppBar(
          title: AutoSizeText('', maxLines: ScaffoldDefault.textMaxLines()),
          leading: BackButton(
            onPressed: () {
              navigatorKey.currentState?.pop(false);
            },
          ),
          actions: [],
        ),
        body: SafeArea(
          minimum: SafeAreaDefault.minimum(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: ColumnDefault.crossAxisAlignment(),
              spacing: ColumnDefault.spacing(),
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                  controller: _nameController,
                ),
                MultiDropdown<Category>(
                  items: _categories
                      .map(
                        (data) => DropdownItem(
                          label: data.name,
                          value: data,
                        ),
                      )
                      .toList(),
                  singleSelect: true,
                  searchEnabled: true,
                  controller: _categoryController,
                  fieldDecoration: FieldDecoration(labelText: 'Category'),
                ),
                for (var i = 0; i < _storeLocationInputs.length; i++)
                  Column(
                    crossAxisAlignment: ColumnDefault.crossAxisAlignment(),
                    spacing: 5,
                    children: [
                      _storeLocationInputs[i],
                      FloatingActionButton.extended(
                        onPressed: () async {
                          setState(() {
                            _storeLocationInputs.removeAt(i);
                          });
                        },
                        icon: Icon(Icons.remove),
                        label: Text('Remove Location'),
                      ),
                    ],
                  ),
                FloatingActionButton.extended(
                  onPressed: () async {
                    setState(() {
                      addStoreLocationInput();
                    });
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add Location'),
                ),
                Row(
                  children: [
                    Expanded(
                      child: FloatingActionButton.extended(
                        onPressed: () async {
                          await addItemDetail(
                            _nameController.text,
                            _categoryController.selectedItems.first.value,
                            _storeLocationInputs,
                          );
                          navigatorKey.currentState?.pop(true);
                        },
                        icon: Icon(Icons.add),
                        label: Text('Add'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  void addStoreLocationInput() {
    _storeLocationInputs.add(StoreLocationInput(stores: _stores));
  }
}
