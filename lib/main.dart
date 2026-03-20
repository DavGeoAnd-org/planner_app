import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/grocery/grocery_home_screen.dart';
import 'package:planner_app/health/health_home_screen.dart';
import 'package:planner_app/workout/workout_home_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(PlannerApp());
}

class PlannerApp extends StatelessWidget {
  const PlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planner App',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldKey,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.deepOrange[900]),
      ),
      debugShowCheckedModeBanner: false,
      home: PlannerHomeScreen(),
    );
  }
}

class PlannerHomeScreen extends StatelessWidget {
  const PlannerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Planner")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            spacing: 20,
            children: [
              ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState?.push(
                    MaterialPageRoute(builder: (_) => HealthHomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(100),
                  backgroundColor: Colors.blueGrey[200],
                ),
                child: AutoSizeText(
                  'Health',
                  style: TextStyle(fontSize: 50, color: Colors.black),
                  maxLines: 1,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState?.push(
                    MaterialPageRoute(builder: (_) => GroceryHomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(100),
                  backgroundColor: Colors.blueGrey[200],
                ),
                child: AutoSizeText(
                  'Grocery',
                  style: TextStyle(fontSize: 50, color: Colors.black),
                  maxLines: 1,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState?.push(
                    MaterialPageRoute(builder: (_) => WorkoutHomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(100),
                  backgroundColor: Colors.blueGrey[200],
                ),
                child: AutoSizeText(
                  'Workout',
                  style: TextStyle(fontSize: 50, color: Colors.black),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
