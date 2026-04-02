import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/grocery/grocery_home_screen.dart';
import 'package:planner_app/health/health_home_screen.dart';
import 'package:planner_app/workout/workout_home_screen.dart';

import 'helper.dart';

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
      resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
      appBar: AppBar(
        title: AutoSizeText(
          'Planner',
          maxLines: ScaffoldDefault.textMaxLines(),
        ),
        // leading: BackButton(onPressed: () {}),
        actions: [],
      ),
      body: SafeArea(
        minimum: SafeAreaDefault.minimum(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: ColumnDefault.crossAxisAlignment(),
            spacing: ColumnDefault.spacing(),
            children: [
              ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState?.push(
                    MaterialPageRoute(builder: (_) => HealthHomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: ElevatedButtonDefault.minimumSize(),
                  backgroundColor: ElevatedButtonDefault.backgroundColor(),
                ),
                child: AutoSizeText(
                  'Health',
                  style: TextStyle(
                    fontSize: ElevatedButtonDefault.textFontSize(),
                    color: ElevatedButtonDefault.textColor(),
                  ),
                  maxLines: ElevatedButtonDefault.textMaxLines(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState?.push(
                    MaterialPageRoute(builder: (_) => GroceryHomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: ElevatedButtonDefault.minimumSize(),
                  backgroundColor: ElevatedButtonDefault.backgroundColor(),
                ),
                child: AutoSizeText(
                  'Grocery',
                  style: TextStyle(
                    fontSize: ElevatedButtonDefault.textFontSize(),
                    color: ElevatedButtonDefault.textColor(),
                  ),
                  maxLines: ElevatedButtonDefault.textMaxLines(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState?.push(
                    MaterialPageRoute(builder: (_) => WorkoutHomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: ElevatedButtonDefault.minimumSize(),
                  backgroundColor: ElevatedButtonDefault.backgroundColor(),
                ),
                child: AutoSizeText(
                  'Workout',
                  style: TextStyle(
                    fontSize: ElevatedButtonDefault.textFontSize(),
                    color: ElevatedButtonDefault.textColor(),
                  ),
                  maxLines: ElevatedButtonDefault.textMaxLines(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
