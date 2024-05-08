import 'package:flutter/material.dart';

double getScreenWidth(context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return screenWidth;
}

double getMarginAsScaledPercent(context, double maxSize, double percentMargin) {
  return getScreenWidth(context) >= maxSize
      ? getScreenWidth(context) * percentMargin
      : getScreenWidth(context) / maxSize * percentMargin;
}

double getScreenScale(BuildContext context) {
  final screenWidth = getScreenWidth(context);

  // Define your scaling logic based on the screen width
  if (screenWidth <= 600) {
    return 0.7;
  } else if (screenWidth <= 1000) {
    return 0.8;
  }

  return 1.0;
}

TextStyle getScaledTextStyle(BuildContext context, TextStyle? textStyle) {
  // Define your scaling logic based on the screen width
  double fontSize = textStyle!.fontSize ?? 14.0;
  double adjustedFontSize = fontSize * getScreenScale(context);

  // Return a new TextStyle with the adjusted font size
  return textStyle.copyWith(fontSize: adjustedFontSize);
}
