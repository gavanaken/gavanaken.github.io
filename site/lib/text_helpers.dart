import 'package:flutter/material.dart';

TextStyle? getScaledTextStyle(BuildContext context, TextStyle? textStyle) {
  final screenWidth = MediaQuery.of(context).size.width;

  // Define your scaling logic based on the screen width
  double adjustedFontSize =
      textStyle?.fontSize ?? 14.0; // Default font size if not specified
  if (screenWidth <= 480) {
    adjustedFontSize *= 0.6;
  } else if (screenWidth <= 600) {
    adjustedFontSize *= 0.7;
  }

  // Return a new TextStyle with the adjusted font size
  return textStyle?.copyWith(fontSize: adjustedFontSize);
}
