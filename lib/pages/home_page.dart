import 'package:diary_app/pages/diary_page.dart';
import 'package:diary_app/pages/satistic_page.dart';
import 'package:diary_app/widgets/calendar.dart';
import 'package:diary_app/widgets/home_app_bar.dart';
import 'package:diary_app/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: HomeAppBar(
          selectedDate: _selectedDate,
          onCalendarTap: _openCalendar,
        ),
        body: Column(
          children: [
            Theme(
              data: ThemeData(
                tabBarTheme: const TabBarTheme(
                  dividerColor: Colors.transparent,
                ),
              ),
              child: const CustomTabBar(),
            ),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  DiaryTab(),
                  StatisticsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openCalendar() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Calendar(
        selectedDate: _selectedDate,
        onDateSelected: (newDate) {
          setState(() => _selectedDate = newDate);
        },
      ),
    );
  }
}
