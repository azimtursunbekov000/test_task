import 'package:flutter/material.dart';
import 'package:test_task/feature/main/presentation/widget/tab_bar_row_content.dart';
import 'package:test_task/feature/mood_diary/presentation/screens/mood_diyary_screen.dart';
import 'package:test_task/internal/commons/common_tab_bar_widget.dart';
import 'package:test_task/internal/theme/text_theme.dart';
import 'package:test_task/internal/theme/theme_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const TabBarRowContent(
        iconURL: 'assets/images/diary.png',
        title: 'Дневник настроения',
      ),
      const TabBarRowContent(
        iconURL: 'assets/images/statistics.png',
        title: 'Статистика',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '1 января 09:00',
          style: TextHelper.nunitoS18w700,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.calendar_month,
              color: ThemeHelper.grey2,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              CommonTabBar(
                tabController: _tabController,
                tabs: tabs,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: const [
                    MoodDiaryScreen(),
                    Text('data'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
