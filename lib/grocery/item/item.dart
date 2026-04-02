import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:planner_app/grocery/category/category.dart';
import 'package:planner_app/grocery/store/store.dart';

part 'item.mapper.dart';

@MappableClass()
class Item with ItemMappable {
  String id;
  String name;

  Item({required this.id, required this.name});
}

class StoreLocationInput extends StatelessWidget {
  final List<Store> stores;
  late final MultiSelectController<Store> storeController;
  late final String selectedStore;
  late final TextEditingController locationController;

  StoreLocationInput({super.key, required this.stores}) {
    storeController = MultiSelectController();
    selectedStore = '';
    locationController = TextEditingController();
  }

  StoreLocationInput.fromStoreWithLocation({
    super.key,
    required this.stores,
    required StoreWithLocation storeWithLocation,
  }) {
    storeController = MultiSelectController();
    selectedStore = storeWithLocation.id;
    locationController = TextEditingController(
      text: storeWithLocation.location,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Expanded(
          child: MultiDropdown<Store>(
            items: stores
                .map(
                  (store) => store.id == selectedStore
                      ? DropdownItem(
                          label: store.name,
                          value: store,
                          selected: true,
                        )
                      : DropdownItem(label: store.name, value: store),
                )
                .toList(),
            singleSelect: true,
            searchEnabled: true,
            controller: storeController,
            fieldDecoration: FieldDecoration(labelText: 'Store'),
          ),
        ),
        Expanded(
          child: TextField(
            controller: locationController,
            maxLines: 3,
            minLines: 2,
            decoration: InputDecoration(labelText: 'Location'),
          ),
        ),
      ],
    );
  }
}

@MappableClass()
class ItemDetail extends Item with ItemDetailMappable {
  Category category;
  List<StoreWithLocation> stores;

  ItemDetail({
    required super.id,
    required super.name,
    required this.category,
    required this.stores,
  });
}

@MappableClass()
class ItemWithLocation extends Item with ItemWithLocationMappable {
  String location;

  ItemWithLocation({
    required super.id,
    required super.name,
    required this.location,
  });
}
