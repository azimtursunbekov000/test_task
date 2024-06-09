import 'package:flutter/material.dart';
import 'package:test_task/feature/mood_diary/presentation/widgets/emotion_bar.dart';
import 'package:test_task/feature/mood_diary/presentation/widgets/reaction_card.dart';
import 'package:test_task/feature/mood_diary/presentation/widgets/stress_level_slider.dart';
import 'package:test_task/internal/theme/text_theme.dart';
import 'package:test_task/internal/theme/theme_helper.dart';

class MoodDiaryScreen extends StatefulWidget {
  const MoodDiaryScreen({super.key});

  @override
  State<MoodDiaryScreen> createState() => _MoodDiaryScreenState();
}

class _MoodDiaryScreenState extends State<MoodDiaryScreen> {
  TextEditingController noteController = TextEditingController();
  bool emotionIsSelected = false;
  bool reactionIsSelected = false;
  bool stressLevelIsSelected = false;
  bool selfAssessmentIsSelected = false;
  bool noteIsEntered = false;

  @override
  Widget build(BuildContext context) {
    bool isDataComplete = emotionIsSelected &&
        reactionIsSelected &&
        stressLevelIsSelected &&
        selfAssessmentIsSelected &&
        noteIsEntered;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Что чувствуешь?',
            style: TextHelper.nunitoS16w800,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 130,
            child: EmotionBar(
              emotionBarModels: emotionBarModels,
              onTap: (index) {
                setState(() {
                  emotionIsSelected = true;
                });
              },
              onSelected: (selected) {
                setState(() {
                  emotionIsSelected = selected;
                });
              },
            ),
          ),
          emotionIsSelected
              ? ReactionCard(onSelected: (selected) {
                  setState(() {
                    reactionIsSelected = selected;
                  });
                })
              : const SizedBox(height: 36),
          Text(
            'Уровень стресса',
            style: TextHelper.nunitoS16w800,
          ),
          const SizedBox(height: 20),
          StressLevelSlider(
            text1: 'Низкий',
            text2: 'Высокий',
            onSelected: (selected) {
              setState(() {
                stressLevelIsSelected = selected;
              });
            },
          ),
          const SizedBox(height: 36),
          Text(
            'Самооценка',
            style: TextHelper.nunitoS16w800,
          ),
          const SizedBox(height: 20),
          StressLevelSlider(
            text1: 'Неуверенность',
            text2: 'Уверенность',
            onSelected: (selected) {
              setState(() {
                selfAssessmentIsSelected = selected;
              });
            },
          ),
          const SizedBox(height: 36),
          Text(
            'Заметки',
            style: TextHelper.nunitoS16w800,
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffb6a1c0).withOpacity(0.11),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: TextField(
              controller: noteController,
              keyboardType: TextInputType.name,
              cursorColor: ThemeHelper.black,
              maxLines: 4,
              onChanged: (value) {
                setState(() {
                  noteIsEntered = value.isNotEmpty;
                });
              },
              decoration: InputDecoration(
                fillColor: ThemeHelper.white,
                filled: true,
                hintText: 'Введите заметку',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ThemeHelper.grey2,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(13),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: isDataComplete ? () => _submitForm(context) : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeHelper.orange,
              minimumSize: const Size(
                double.infinity,
                44,
              ),
            ),
            child: const Text(
              'Сохранить',
              style: TextStyle(
                color:ThemeHelper.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

void _submitForm(BuildContext context) {
  _showSuccessDialog(context);
}

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Успешно'),
        content: const Text('Ваша данные успешно отправлены'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
