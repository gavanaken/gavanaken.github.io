import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:site/colors.dart';
import 'package:site/screen_helpers.dart';

class TextCard extends StatelessWidget {
  final String text;

  // Constructor
  TextCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: BackgroundColors.white,
      margin: EdgeInsets.fromLTRB(64.0, 8.0, 64.0, 4.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            4.0), // Adjust radius size here to make it smaller or larger
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.all(8.0),
        child: Text(
          text,
          style: getScaledTextStyle(
              context, Theme.of(context).textTheme.bodyMedium),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
