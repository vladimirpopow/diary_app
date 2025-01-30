import 'package:diary_app/provider/provider.dart';
import 'package:diary_app/widgets/tick_marks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StressSlider extends StatefulWidget {
  const StressSlider({super.key});

  @override
  _CustomSliderScreenState createState() => _CustomSliderScreenState();
}

class _CustomSliderScreenState extends State<StressSlider> {
  double stressLevel = 0.0;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Уровень стресса',
           style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          textDirection: TextDirection.ltr,
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: CustomPaint(
            painter: TickMarksPainter(),
            child: const SizedBox(width: double.infinity),
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 6,
            activeTrackColor: Colors.orange,
            inactiveTrackColor: const Color.fromARGB(73, 158, 158, 158),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 24),
            thumbColor: Colors.orange,
          ),
          child: Slider(
            value: appState.stressSliderValue,
            min: 0,
            max: 5,
            divisions: 5,
            onChanged: (value) {
              appState.setStressSliderValue(value);
            },
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Низкий', style: TextStyle(color: Colors.grey)),
            Text('Высокий', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
