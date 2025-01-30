import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final DateTime selectedDate;
  final VoidCallback onCalendarTap;

  const HomeAppBar({
    Key? key,
    required this.selectedDate,
    required this.onCalendarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        DateFormat('d MMMM HH:mm', 'ru').format(selectedDate),
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.w600, color: Colors.grey),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.calendar_month),
          onPressed: onCalendarTap,
          color: Colors.grey,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
