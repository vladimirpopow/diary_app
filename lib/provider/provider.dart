import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  double _selfSliderValue = 0.0;
  double _stressSliderValue = 0.0;
  String? _selectedEmotion;
  List<String> _selectedTags = [];
  String _notesText = '';

  
  double get selfSliderValue => _selfSliderValue;
  double get stressSliderValue => _stressSliderValue;
  String? get selectedEmotion => _selectedEmotion;
  List<String> get selectedTags => _selectedTags;
  String get notesText => _notesText;

  
  void setSelfSliderValue(double value) {
    _selfSliderValue = value;
    notifyListeners();
    print(value);
  }

  void setStressSliderValue(double value) {
    _stressSliderValue = value;
    notifyListeners();
    print(value);
  }

  void setSelectedEmotion(String emotion) {
    _selectedEmotion = emotion;
    notifyListeners();
    print(emotion);
  }

  void setSelectedTags(List<String> tags) {
    _selectedTags = tags;
    notifyListeners();
    print(tags);
  }

  void setNotesText(String text) {
    _notesText = text;
    notifyListeners();
    print(text);
  }

}
