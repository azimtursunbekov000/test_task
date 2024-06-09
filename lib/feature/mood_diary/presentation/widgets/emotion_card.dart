import 'package:flutter/material.dart';
import 'package:test_task/feature/mood_diary/presentation/widgets/emotion_bar.dart';
import 'package:test_task/internal/theme/text_theme.dart';
import 'package:test_task/internal/theme/theme_helper.dart';

class EmotionCard extends StatefulWidget {
  final List<EmotionBarModel> emotionBarModels;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  const EmotionCard({
    super.key,
    required this.emotionBarModels,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  State<EmotionCard> createState() => _EmotionCardState();
}

class _EmotionCardState extends State<EmotionCard> {
  @override
  Widget build(BuildContext context) {
    bool onSelected = widget.index == widget.selectedIndex;
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.index);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(76),
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.all(6),
            alignment: Alignment.center,
            height: 118,
            width: 83,
            decoration: BoxDecoration(
              color: ThemeHelper.white,
              borderRadius: BorderRadius.circular(76),
              border: onSelected
                  ? Border.all(
                      color:  ThemeHelper.orange,
                      width: 2,
                    )
                  : null,
              boxShadow: onSelected
                  ? null
                  : [
                      BoxShadow(
                        color: const Color(0xffb6a1c0).withOpacity(0.11),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(2, 4),
                      ),
                    ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  widget.emotionBarModels[widget.index].image,
                  fit: BoxFit.cover,
                  height: 50,
                  width: 53,
                ),
                Text(
                  widget.emotionBarModels[widget.index].title,
                  style: TextHelper.nunitoS11w400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
