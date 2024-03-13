import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';
import 'screen_helpers.dart';

class ClickableTile extends StatelessWidget {
  final String svgPath;
  final String name;
  final Function(String)? onTapCb;

  const ClickableTile(
      {super.key, required this.svgPath, required this.name, this.onTapCb});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapCb!(name),
      child: Card(
        color: BackgroundColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              8.0), // Adjust radius size here to make it smaller or larger
        ),
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SvgPicture.asset(
                  svgPath,
                  height: 150 * getScreenScale(context),
                  width: 150 * getScreenScale(context),
                ),
                Text(
                  name,
                  style: getScaledTextStyle(
                    context,
                    Theme.of(context).textTheme.labelMedium,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
