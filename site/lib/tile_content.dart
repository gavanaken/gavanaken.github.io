import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:site/develop_content.dart';
import 'package:site/section_title.dart';

import 'screen_helpers.dart';

import 'icon_tile.dart';

class BizTileContent extends StatelessWidget {
  const BizTileContent({super.key});

  @override
  build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(children: [
              Padding(
                padding: EdgeInsets.all(12.0 * getScreenScale(context)),
                child: SvgPicture.asset(
                  "assets/business-icon.svg",
                  height: 80 * getScreenScale(context),
                  width: 80 * getScreenScale(context),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(12.0 * getScreenScale(context)),
                  child: RichText(
                    text: TextSpan(
                      style: getScaledTextStyle(
                          context, Theme.of(context).textTheme.bodySmall),
                      children: [
                        const TextSpan(
                          text: "Coming soon...",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ],
        )
      ],
    );
  }
}

class TechTileContent extends StatelessWidget {
  const TechTileContent({super.key});

  @override
  build(BuildContext context) {
    int yrsExperience = DateTime.now().year - 2019 - 1;
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0 * getScreenScale(context)),
                  child: SvgPicture.asset(
                    "assets/tech-icon.svg",
                    height: 80 * getScreenScale(context),
                    width: 80 * getScreenScale(context),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(12.0 * getScreenScale(context)),
                    child: RichText(
                      text: TextSpan(
                        style: getScaledTextStyle(
                            context, Theme.of(context).textTheme.bodySmall),
                        children: [
                          const TextSpan(
                            text: "I've worked as a ",
                          ),
                          const TextSpan(
                              text: "full-stack ",
                              style: TextStyle(fontStyle: FontStyle.italic)),
                          const TextSpan(
                            text: "software developer in the ",
                          ),
                          const TextSpan(
                            text: "medical device & biotech ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                "space for $yrsExperience+ years. Here's a bit of what I've worked with:",
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SectionTitle(title: "DEVELOP"),
            const DevelopContent(),
            Divider(
              indent: 36 * getScreenScale(context),
              endIndent: 36 * getScreenScale(context),
            ),
          ],
        )
      ],
    );
  }
}

class ScienceTileContent extends StatelessWidget {
  const ScienceTileContent({super.key});

  @override
  build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(children: [
              Padding(
                padding: EdgeInsets.all(12.0 * getScreenScale(context)),
                child: SvgPicture.asset(
                  "assets/science-icon.svg",
                  height: 80 * getScreenScale(context),
                  width: 80 * getScreenScale(context),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(12.0 * getScreenScale(context)),
                  child: RichText(
                    text: TextSpan(
                      style: getScaledTextStyle(
                          context, Theme.of(context).textTheme.bodySmall),
                      children: [
                        const TextSpan(
                          text: "Coming soon...",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ],
        )
      ],
    );
  }
}

class LifeTileContent extends StatelessWidget {
  const LifeTileContent({super.key});

  @override
  build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(children: [
              Padding(
                padding: EdgeInsets.all(12.0 * getScreenScale(context)),
                child: SvgPicture.asset(
                  "assets/life-icon.svg",
                  height: 80 * getScreenScale(context),
                  width: 80 * getScreenScale(context),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(12.0 * getScreenScale(context)),
                  child: RichText(
                    text: TextSpan(
                      style: getScaledTextStyle(
                          context, Theme.of(context).textTheme.bodySmall),
                      children: [
                        const TextSpan(
                          text: "Coming soon...",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ],
        )
      ],
    );
  }
}

class SelectedTileContent extends StatelessWidget {
  final String? selectedTile;
  const SelectedTileContent({super.key, required this.selectedTile});

  @override
  build(BuildContext context) {
    switch (selectedTile) {
      case "BUSINESS":
        return BizTileContent();
      case "TECH":
        return TechTileContent();
      case "SCIENCE":
        return ScienceTileContent();
      case "LIFE":
        return LifeTileContent();
      default:
        return Container();
    }
  }
}
