import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:site/clickable_tile.dart';
import 'package:site/floating_container.dart';
import 'package:site/tile_content.dart';

import 'screen_helpers.dart';

import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greg Van Aken',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        useMaterial3: true,
        // colorScheme: ColorScheme.fromSeed(
        //     seedColor: BackgroundColors.blue, brightness: Brightness.light),
        scaffoldBackgroundColor: BackgroundColors.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 48,
              color: TextColors.darkgrey,
              fontWeight: FontWeight.bold),
          titleMedium: TextStyle(
              fontSize: 36,
              color: TextColors.darkgrey,
              fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 24, color: TextColors.darkgrey),
          displaySmall: TextStyle(fontSize: 20, color: TextColors.darkgrey),
          bodySmall: TextStyle(fontSize: 18, color: TextColors.darkgrey),
          labelMedium: TextStyle(
              fontSize: 24,
              color: TextColors.darkgrey,
              fontWeight: FontWeight.bold),
        ),
      ),
      home: const MyHomePage(title: 'Greg Van Aken'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedTile;

  void selectTile(String tileName) {
    if (selectedTile == tileName) {
      // If the same tile is tapped again, collapse the detail view.
      setState(() {
        selectedTile = null;
      });
    } else {
      setState(() {
        selectedTile = tileName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FloatingContainer(
              edgeMargin: getScreenScale(context) * 0.1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Row(), // Temporary, just allows the column to stretch.
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Software Engineer, Scientist, & Entrepreneur",
                          style: getScaledTextStyle(
                              context, Theme.of(context).textTheme.titleLarge),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: getScreenScale(context) * 24,
                        ),
                        Text(
                          "I'm building innovative solutions to the world's hardest problems.",
                          style: getScaledTextStyle(context,
                              Theme.of(context).textTheme.displayMedium),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getScreenScale(context) * 48,
                    ),
                    SvgPicture.asset(
                      "assets/about-me-avatar.svg",
                      height: 250 * getScreenScale(context),
                      width: 250 * getScreenScale(context),
                    ),
                    SizedBox(
                      height: getScreenScale(context) * 48,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: getScaledTextStyle(
                            context, Theme.of(context).textTheme.displaySmall),
                        children: const [
                          TextSpan(
                            text:
                                "Natural leader and passionate problem solver. ",
                          ),
                          TextSpan(
                              text: "Coffee Chat ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: "enthusiast.",
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: getScaledTextStyle(
                            context, Theme.of(context).textTheme.displaySmall),
                        children: const [
                          TextSpan(
                            text: "Currently hanging out in  ",
                          ),
                          TextSpan(
                              text: "Boston, MA ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: "while I pursue my MBA.",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getScreenScale(context) * 48,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: BackgroundColors.blue,
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          getScreenScale(context) * 64,
                          getScreenScale(context) * 24,
                          getScreenScale(context) * 64,
                          getScreenScale(context) * 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Row(), // TODO: remove this hack, this just fills the container
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "The TL;DR",
                                style: getScaledTextStyle(
                                  context,
                                  Theme.of(context).textTheme.titleMedium,
                                )?.copyWith(
                                  color: TextColors.white,
                                ),
                              ),
                            ),
                            Flex(
                                mainAxisAlignment: MainAxisAlignment.center,
                                direction: getScreenWidth(context) > 600
                                    ? Axis.horizontal
                                    : Axis.vertical,
                                children: [
                                  ClickableTile(
                                    svgPath: "assets/tech-icon.svg",
                                    name: "TECH",
                                    onTapCb: selectTile,
                                  )
                                ]),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 300),
                              firstChild: Container(),
                              secondChild: selectedTile != null
                                  ? Container(
                                      margin: EdgeInsets.only(
                                          right: getScreenScale(context) * 100,
                                          left: getScreenScale(context) * 100),
                                      child: Card(
                                          color: BackgroundColors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                6.0), // Adjust radius size here to make it smaller or larger
                                          ),
                                          child: SelectedTileContent(
                                            selectedTile: selectedTile,
                                          )),
                                    )
                                  : Container(),
                              crossFadeState: selectedTile != null
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
