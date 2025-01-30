import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diary_app/provider/provider.dart';
import 'package:diary_app/widgets/emotional_card.dart';
import 'package:diary_app/widgets/emotional_selector.dart';
import 'package:diary_app/widgets/notes.dart';
import 'package:diary_app/widgets/self_slider.dart';
import 'package:diary_app/widgets/stress_slider.dart';
import 'package:diary_app/widgets/botton.dart';

class DiaryTab extends StatelessWidget {
  const DiaryTab({super.key});

  void _validateAndSave(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);

    if (appState.selfSliderValue == 0.0 ||
        appState.stressSliderValue == 0.0 ||
        appState.selectedEmotion == null ||
        appState.selectedTags.isEmpty ||
        appState.notesText.isEmpty) {
      _showPopup(context, "Заполните все поля");
    } else {
      _showPopup(context, "Все хорошо");
    }
  }

  void _showPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message, textAlign: TextAlign.center),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              EmotionSelector(
                onEmotionSelected: appState.setSelectedEmotion,
              ),
              const SizedBox(height: 20),
              const EmotionCard(),
              const SizedBox(height: 20),
              const StressSlider(),
              const SizedBox(height: 20),
              const SelfSlider(),
              const SizedBox(height: 20),
              Notes(
                onTextChanged: appState.setNotesText,
              ),
              const SizedBox(height: 20),
              SaveButton(
                onPressed: () => _validateAndSave(context),
              ),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
