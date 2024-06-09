import 'package:flutter/material.dart';

class TabBarRowContent extends StatelessWidget {
  final String iconURL;
  final String title;

  const TabBarRowContent({
    super.key,
    required this.iconURL,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          iconURL,
          width: 12,
          height: 12,
        ),
        const SizedBox(width: 8),
        Text(title),
      ],
    );
  }
}
