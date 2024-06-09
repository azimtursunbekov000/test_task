import 'package:flutter/material.dart';
import 'package:test_task/internal/theme/text_theme.dart';
import 'package:test_task/internal/theme/theme_helper.dart';

class CommonTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Widget> tabs;

  const CommonTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: ThemeHelper.grey4,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.orange,
        ),
        labelColor: ThemeHelper.white,
        labelStyle: TextHelper.nunitoS12w500,
        dividerHeight: 0,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: ThemeHelper.grey2,
        tabs: tabs,
      ),
    );
  }
}
