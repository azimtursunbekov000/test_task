import 'package:flutter/material.dart';
import 'package:test_task/feature/mood_diary/presentation/widgets/emotion_card.dart';

class EmotionBarModel {
  final String title;
  final String image;

  EmotionBarModel({
    required this.title,
    required this.image,
  });
}

List<EmotionBarModel> emotionBarModels = [
  EmotionBarModel(title: 'Радость', image: 'assets/images/emotions/joy.png'),
  EmotionBarModel(title: 'Страх', image: 'assets/images/emotions/fear.png'),
  EmotionBarModel(title: 'Бешенство', image: 'assets/images/emotions/rabies.png'),
  EmotionBarModel(title: 'Грусть', image: 'assets/images/emotions/sadness.png'),
  EmotionBarModel(title: 'Радость', image: 'assets/images/emotions/joy.png'),
  EmotionBarModel(title: 'Радость', image: 'assets/images/emotions/joy.png'),
  EmotionBarModel(title: 'Радость', image: 'assets/images/emotions/joy.png'),
];

class EmotionBar extends StatefulWidget {
  final List<EmotionBarModel> emotionBarModels;
  final Function(int) onTap;
  final Function(bool) onSelected;

  const EmotionBar({
    super.key,
    required this.emotionBarModels,
    required this.onTap,
    required this.onSelected,
  });

  @override
  State<EmotionBar> createState() => _EmotionBarState();
}

class _EmotionBarState extends State<EmotionBar> {
  int selectedEmotionIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.emotionBarModels.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            selectedEmotionIndex = index;
            widget.onTap(index);
            widget.onSelected(true);
          });
        },
        child: EmotionCard(
          emotionBarModels: widget.emotionBarModels,
          index: index,
          selectedIndex: selectedEmotionIndex,
          onTap: (index) {
            widget.onTap(index);
            widget.onSelected(true);
            setState(() {
              selectedEmotionIndex = index;
            });
          },
        ),
      ),
    );
  }
}
