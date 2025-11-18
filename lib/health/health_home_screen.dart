import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/health/weight/weight_screen.dart';
import 'package:planner_app/main.dart';

class HealthHomeScreen extends StatelessWidget {
  const HealthHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Health")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => WeightScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(100),
                backgroundColor: Colors.blueGrey[200],
              ),
              child: AutoSizeText(
                'Weight',
                style: TextStyle(fontSize: 50, color: Colors.black),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
