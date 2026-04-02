import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/health/weight/weightRecord_request.dart';
import 'package:planner_app/health/weight/weight_record.dart';

import '../../helper.dart';
import '../../main.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WeightScreenState();
  }
}

class _WeightScreenState extends State<WeightScreen> {
  bool isLoading = true;
  late List<WeightRecord> _weightRecords;
  int dayRange = 14;

  @override
  void initState() {
    super.initState();
    weightRecordsByDayRange(dayRange)
        .then((value) {
          _weightRecords = value;
        })
        .whenComplete(() {
          setState(() {
            isLoading = false;
          });
        });
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.blueAccent,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return SideTitleWidget(
      meta: meta,
      child: Text('${value.toInt()}', style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: getTitles,
      ),
    ),
    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
  );

  FlBorderData get borderData => FlBorderData(show: false);

  LinearGradient get _barsGradient => LinearGradient(
    colors: [Colors.blueAccent, Colors.cyan],

    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  List<BarChartGroupData> barGroups() {
    Map<int, List<double>> tempMap = <int, List<double>>{};
    for (var weightRecord in _weightRecords) {
      int day = DateTime.fromMillisecondsSinceEpoch(
        RecordId.intValueFromId(weightRecord.id!),
        isUtc: true,
      ).toLocal().day;
      tempMap.update(
        day,
        (value) => value..add(weightRecord.weight),
        ifAbsent: () => [weightRecord.weight],
      );
    }
    final resultMap = tempMap.map(
      (key, value) =>
          MapEntry(key, value.reduce((a, b) => a + b) / value.length),
    );
    return resultMap.entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: entry.value,
            gradient: _barsGradient,
            label: BarChartRodLabel(
              text: entry.value.toInt().toString(),
              style: TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Weight Records"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              TextEditingController weightController = TextEditingController();
              bool result = await showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter weight',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => navigatorKey.currentState?.pop(false),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        addWeightRecord(weightController.text).then(
                          (result) => navigatorKey.currentState?.pop(true),
                        );
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
              );
              if (result) {
                weightRecordsByDayRange(dayRange)
                    .then((value) {
                      _weightRecords = value;
                    })
                    .whenComplete(() {
                      setState(() {});
                    });
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: BarChart(
          duration: Duration(milliseconds: 100),
          curve: Curves.easeOutQuad,
          BarChartData(
            titlesData: titlesData,
            borderData: borderData,
            barGroups: barGroups(),
            gridData: const FlGridData(show: false),
            alignment: BarChartAlignment.spaceAround,
            maxY: 300,
          ),
        ),
      ),
    );
  }
}
