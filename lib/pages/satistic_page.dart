import 'package:flutter/material.dart';

class StatisticsTab extends StatefulWidget {
  const StatisticsTab({super.key});

  @override
  State<StatisticsTab> createState() => _StatisticsTabState();
}

class _StatisticsTabState extends State<StatisticsTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Cтатистика',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      )),
    );
  }
}
