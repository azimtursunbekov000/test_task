import 'package:flutter/material.dart';
import 'package:test_task/internal/theme/text_theme.dart';
import 'package:test_task/internal/theme/theme_helper.dart';

class StressLevelSlider extends StatefulWidget {
  final String text1;
  final String text2;
  final Function(bool) onSelected;

  const StressLevelSlider({
    super.key,
    required this.text1,
    required this.text2,
    required this.onSelected,
  });

  @override
  _StressLevelSliderState createState() => _StressLevelSliderState();
}

class _StressLevelSliderState extends State<StressLevelSlider> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.93;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: containerWidth,
              height: 77,
              decoration: BoxDecoration(
                color: ThemeHelper.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  for (int i = 0; i < 6; i++)
                    Positioned(
                      left: (i * ((containerWidth - 20) / 5)) + 10,
                      top: 15,
                      child: Container(
                        width: 2,
                        height: 10,
                        color: const Color(0xffe1ddd8),
                      ),
                    ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 6,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
                      thumbColor: ThemeHelper.orange,
                      activeTrackColor: ThemeHelper.orange,
                      inactiveTrackColor: Colors.grey.shade300,
                      valueIndicatorColor:ThemeHelper.orange,
                    ),
                    child: Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 100,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                          widget.onSelected(true);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 12,
              left: 10,
              child: Text(
                widget.text1,
                style: TextHelper.nunitoS11w400,
              ),
            ),
            Positioned(
              bottom: 12,
              right: 10,
              child: Text(
                widget.text2,
                style: TextHelper.nunitoS11w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
