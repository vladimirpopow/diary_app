import 'package:flutter/material.dart';

class EmotionSelector extends StatefulWidget {
  final Function(String) onEmotionSelected;

  const EmotionSelector({Key? key, required this.onEmotionSelected})
      : super(key: key);

  @override
  _EmotionSelectorState createState() => _EmotionSelectorState();
}

class _EmotionSelectorState extends State<EmotionSelector> {
  int selectedEmotion = -1;

  final List<Map<String, String>> emotions = [
    {'image': 'assets/happy.png', 'label': 'Радость'},
    {'image': 'assets/fear.png', 'label': 'Страх'},
    {'image': 'assets/angry.png', 'label': 'Бешенство'},
    {'image': 'assets/sad.png', 'label': 'Грусть'},
    {'image': 'assets/strongs.png', 'label': 'Сила'},
    {'image': 'assets/rest.png', 'label': 'Спокойствие'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Что чувствуешь?',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          textDirection: TextDirection.ltr,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: emotions.length,
            itemBuilder: (context, index) {
              bool isSelected = index == selectedEmotion;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedEmotion = index;
                  });

                  widget.onEmotionSelected(emotions[index]['label']!);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 100,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: isSelected
                          ? Colors.orange
                          : Colors.grey.withOpacity(0.2),
                      width: isSelected ? 3 : 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 90,
                        height: 70,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipOval(
                          child: Image.asset(
                            emotions[index]['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        emotions[index]['label']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
