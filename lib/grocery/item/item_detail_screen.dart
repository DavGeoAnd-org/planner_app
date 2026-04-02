import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:planner_app/grocery/category/category_request.dart';
import 'package:planner_app/main.dart';

import '../../helper.dart';
import '../category/category.dart';
import '../store/store.dart';
import '../store/store_request.dart';
import 'item.dart';
import 'item_request.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key, required this.item});

  final String item;

  @override
  State<StatefulWidget> createState() {
    return _ItemDetailScreenState();
  }
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  bool _editMode = false;
  late ItemDetail _itemDetail;
  late List<Category> _categories;
  late List<Store> _stores;
  final List<StoreLocationInput> _storeLocationInputs = [];
  final MultiSelectController<Category> _categoryController =
      MultiSelectController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
      appBar: AppBar(
        title: AutoSizeText(
          widget.item,
          maxLines: ScaffoldDefault.textMaxLines(),
        ),
        leading: BackButton(
          onPressed: () {
            navigatorKey.currentState?.pop(false);
          },
        ),
        actions: [],
      ),
      body: _editMode ? editScreen() : detailScreen(),
    );
  }

  Widget detailScreen() {
    return FutureBuilder(
      future: itemDetail(widget.item),
      builder: (BuildContext context, AsyncSnapshot<ItemDetail> snapshot) {
        if (snapshot.hasData) {
          _itemDetail = snapshot.data!;
          return SafeArea(
            minimum: SafeAreaDefault.minimum(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: ColumnDefault.crossAxisAlignment(),
                spacing: ColumnDefault.spacing(),
                children: [
                  AutoSizeText('Category: ${_itemDetail.category.name}'),
                  Column(
                    crossAxisAlignment: ColumnDefault.crossAxisAlignment(),
                    spacing: 10,
                    children: [
                      AutoSizeText('Stores:'),
                      for (StoreWithLocation storeWithLocation
                          in _itemDetail.stores)
                        AutoSizeText(
                          '${storeWithLocation.name}: ${storeWithLocation.location}',
                        ),
                    ],
                  ),
                  Row(
                    spacing: RowDefault.spacing(),
                    children: [
                      Expanded(
                        child: FloatingActionButton.extended(
                          onPressed: () async {
                            allCategories()
                                .then((value) {
                                  _categories = value;
                                })
                                .whenComplete(() {
                                  allStores()
                                      .then((value) {
                                        _stores = value;
                                        for (StoreWithLocation storeWithLocation
                                            in _itemDetail.stores) {
                                          _storeLocationInputs.add(
                                            StoreLocationInput.fromStoreWithLocation(
                                              stores: value,
                                              storeWithLocation:
                                                  storeWithLocation,
                                            ),
                                          );
                                        }
                                      })
                                      .whenComplete(() {
                                        setState(() {
                                          _editMode = true;
                                        });
                                      });
                                });
                          },
                          icon: Icon(Icons.edit),
                          label: Text('Edit'),
                        ),
                      ),
                      Expanded(
                        child: FloatingActionButton.extended(
                          onPressed: () async {
                            await removeItem(
                              RecordId.stringValueFromId(_itemDetail.id),
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
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget editScreen() {
    return SafeArea(
      minimum: SafeAreaDefault.minimum(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: ColumnDefault.crossAxisAlignment(),
          spacing: ColumnDefault.spacing(),
          children: [
            MultiDropdown<Category>(
              items: _categories
                  .map(
                    (data) => data.id == _itemDetail.category.id
                        ? DropdownItem(
                            label: data.name,
                            value: data,
                            selected: true,
                          )
                        : DropdownItem(label: data.name, value: data),
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
              spacing: RowDefault.spacing(),
              children: [
                Expanded(
                  child: FloatingActionButton.extended(
                    onPressed: () async {
                      await updateItem(
                        _itemDetail,
                        _categoryController.selectedItems.first.value,
                        _storeLocationInputs,
                      );
                      navigatorKey.currentState?.pop(true);
                    },
                    icon: Icon(Icons.check_box),
                    label: Text('Update'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addStoreLocationInput() {
    _storeLocationInputs.add(StoreLocationInput(stores: _stores));
  }
}
