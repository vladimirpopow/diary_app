import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diary_app/provider/provider.dart';

class EmotionCard extends StatefulWidget {
  const EmotionCard({super.key});

  @override
  _EmotionTagsState createState() => _EmotionTagsState();
}

class _EmotionTagsState extends State<EmotionCard> {
  final List<String> emotions = [
    "Возбуждение", "Восторг", "Игривость", "Наслаждение",
    "Очарование", "Осознанность", "Смелость",
    "Удовольствие", "Чувственность", "Энергичность",
    "Экстравагантность"
  ];

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: emotions.map((emotion) {
        bool isSelected = appState.selectedTags.isNotEmpty &&
            appState.selectedTags.first == emotion;

        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                appState.setSelectedTags([]);
              } else {
                appState.setSelectedTags([emotion]);
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.orange : Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              emotion,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

