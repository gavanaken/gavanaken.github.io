import 'package:flutter/material.dart';
import 'colors.dart';
import 'screen_helpers.dart';

class FloatingContainer extends StatelessWidget {
  final double edgeMargin;
  final Widget? child;

  const FloatingContainer({
    super.key,
    this.edgeMargin = 0.05,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (getScreenWidth(context) > 500)
          ? EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width *
                  edgeMargin *
                  getScreenScale(context))
          : const EdgeInsets.symmetric(),
      decoration: BoxDecoration(
        color: BackgroundColors.white, // The background color of the container
        boxShadow: [
          BoxShadow(
            color: BackgroundColors.grey
                .withOpacity(0.8), // Shadow color with some transparency
            spreadRadius: 10, // Spread radius
            blurRadius: 7, // Blur radius
            //offset: const Offset(-2, 0), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
