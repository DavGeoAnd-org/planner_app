import 'package:flutter/material.dart';
import 'package:planner_app/grocery/store/store_request.dart';

import '../../helper.dart';
import '../../main.dart';

class StoreNewScreen extends StatelessWidget {
  StoreNewScreen({super.key});

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Store'),
        leading: BackButton(
          onPressed: () {
            navigatorKey.currentState?.pop(false);
          },
        ),
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
              Row(
                children: [
                  Expanded(
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        await addStore(_nameController.text);
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
