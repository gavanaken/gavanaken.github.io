// TODO: Add class for icon, text tiles to capture all of the things I do.

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';
import 'screen_helpers.dart';

class IconTile extends StatelessWidget {
  final String iconPath;
  final String name;

  const IconTile({super.key, required this.iconPath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: BackgroundColors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            4.0), // Adjust radius size here to make it smaller or larger
      ),
      child: Padding(
          padding: EdgeInsets.all(getScreenScale(context) * 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                iconPath,
                width: getScreenScale(context) * 30,
              ),
              SizedBox(
                width: getScreenScale(context) * 8.0,
              ),
              Text(
                name,
                style: getScaledTextStyle(
                  context,
                  Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          )),
    );
  }
}
