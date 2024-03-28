import 'package:flutter/material.dart';
import 'package:site/screen_helpers.dart';
import 'colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;

  const SectionTitle({
    Key? key,
    required this.title,
    this.color = TextColors.darkgrey,
    this.fontSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(title,
          style: getScaledTextStyle(
              context, Theme.of(context).textTheme.displayMedium)),
    );
  }
}
