import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const Calendar({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  _CalendarModalState createState() => _CalendarModalState();
}

class _CalendarModalState extends State<Calendar> {
  late DateTime tempSelectedDate;

  @override
  void initState() {
    super.initState();
    tempSelectedDate = widget.selectedDate;
  }

  void _selectDate(DateTime date) {
    setState(() => tempSelectedDate = date);
  }

  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year;

    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                onPressed: () => _selectDate(DateTime.now()),
                child:
                    const Text("Сегодня", style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "пт       вт        ср        чт       пт      сб      вс",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Text('$currentYear',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                )),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(12, (monthIndex) {
                  DateTime firstDay = DateTime(currentYear, monthIndex + 1, 1);
                  int daysInMonth =
                      DateTime(currentYear, monthIndex + 2, 0).day;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.MMMM('ru').format(firstDay),
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: List.generate(daysInMonth, (dayIndex) {
                            int day = dayIndex + 1;
                            bool isSelected = tempSelectedDate.day == day &&
                                tempSelectedDate.month == monthIndex + 1 &&
                                tempSelectedDate.year == currentYear;

                            return GestureDetector(
                              onTap: () => _selectDate(
                                  DateTime(currentYear, monthIndex + 1, day)),
                              child: Container(
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.orange.shade200
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  "$day",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
