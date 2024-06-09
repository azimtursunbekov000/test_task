import 'package:flutter/material.dart';
import 'package:test_task/internal/theme/text_theme.dart';
import 'package:test_task/internal/theme/theme_helper.dart';

class ReactionCard extends StatefulWidget {
  final Function(bool) onSelected;

  const ReactionCard({super.key, required this.onSelected});

  @override
  State<ReactionCard> createState() => _ReactionCardState();
}

class _ReactionCardState extends State<ReactionCard> {
  int? selectedReactionIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.start,
          runSpacing: 10,
          spacing: 5,
          children: List.generate(reactionWords.length, (index) {
            final reactionWord = reactionWords[index];
            final isSelected = selectedReactionIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedReactionIndex = index;
                  widget.onSelected(true);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? ThemeHelper.orange :ThemeHelper.white,
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffb6a1c0),
                      spreadRadius: 0.1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    reactionWord,
                    style: isSelected
                        ? TextHelper.nunitoS11w400.copyWith(color: Colors.white)
                        : TextHelper.nunitoS11w400,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}



List reactionWords = [
  'Возбуждение',
  'Восторг',
  'Игривость',
  'Наслаждение',
  'Очарование',
  'Осознанность'
];
