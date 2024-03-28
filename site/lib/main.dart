import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:site/clickable_tile.dart';
import 'package:site/floating_container.dart';
import 'package:site/tile_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
          displayMedium: TextStyle(fontSize: 32, color: TextColors.darkgrey),
          displaySmall: TextStyle(fontSize: 24, color: TextColors.darkgrey),
          bodySmall: TextStyle(fontSize: 18, color: TextColors.darkgrey),
          bodyMedium: TextStyle(fontSize: 20, color: TextColors.darkgrey),
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

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _targetKey = GlobalKey();

// For managing interactions with tile content
  void _scrollToTarget() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_targetKey.currentContext != null) {
        final RenderBox renderBox =
            _targetKey.currentContext!.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);
        double offset = position.dy +
            (_scrollController.position.viewportDimension / 2) +
            (renderBox.size.height / 2);

        offset = offset.clamp(0, _scrollController.position.maxScrollExtent);

        if ((offset < _scrollController.position.extentAfter) ||
            (offset > _scrollController.position.extentBefore)) {
          // Widget is off the screen so go ahead and animate:
          _scrollController.animateTo(
            offset,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  void selectTile(String tileName) {
    if (selectedTile == tileName) {
      // If the same tile is tapped again, collapse the detail view.
      setState(() {
        selectedTile = null;
      });
    } else {
      setState(() {
        selectedTile = tileName;
        Future.delayed(const Duration(milliseconds: 300), () {
          _scrollToTarget();
        });
      });
    }
  }

  Future<void> _launchURL(String url) async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            FloatingContainer(
              edgeMargin: getScreenScale(context) * 0.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      getScreenScale(context) * 100.0,
                      getScreenScale(context) * 24.0,
                      getScreenScale(context) * 100.0,
                      getScreenScale(context) * 48.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          "assets/gva-logo.svg",
                          height: 80 * getScreenScale(context),
                          width: 80 * getScreenScale(context),
                        ),
                        const Spacer(),
                        IconButton(
                          iconSize: 36 * getScreenScale(context),
                          icon: const Icon(
                              FontAwesomeIcons.linkedin), // LinkedIn icon
                          hoverColor: AccentColors.peach,
                          onPressed: () => _launchURL(
                              'https://www.linkedin.com/in/greg-van-aken/'),
                          tooltip: 'https://www.linkedin.com/in/greg-van-aken/',
                        ),
                        IconButton(
                          iconSize: 36 * getScreenScale(context),
                          icon: const Icon(
                              FontAwesomeIcons.github), // GitHub icon
                          hoverColor: AccentColors.peach,
                          onPressed: () =>
                              _launchURL('https://github.com/gavanaken'),
                          tooltip: 'https://github.com/gavanaken',
                        ),
                        IconButton(
                          iconSize: 36 * getScreenScale(context),
                          icon: const Icon(Icons.email), // Email icon
                          hoverColor: AccentColors.peach,
                          onPressed: () =>
                              _launchURL('mailto:gvanaken1@babson.edu'),
                          tooltip: 'mailto:gvanaken1@babson.edu',
                        ),
                      ],
                    ),
                  ), // Temporary, just allows the column to stretch.
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
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
                          height: getScreenScale(context) * 12,
                        ),
                        Text(
                          "I'm building innovative solutions to the world's hardest problems.",
                          style: getScaledTextStyle(context,
                              Theme.of(context).textTheme.displayMedium),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getScreenScale(context) * 24,
                  ),
                  SvgPicture.asset(
                    "assets/about-me-avatar.svg",
                    height: 250 * getScreenScale(context),
                    width: 250 * getScreenScale(context),
                  ),
                  SizedBox(
                    height: getScreenScale(context) * 24,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: getScaledTextStyle(
                            context, Theme.of(context).textTheme.displaySmall),
                        children: const [
                          TextSpan(
                            text: "Currently hanging out in ",
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
                        getScreenScale(context) * 48,
                        getScreenScale(context) * 24,
                        getScreenScale(context) * 48,
                        getScreenScale(context) * 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(), // TODO: remove this hack, this just fills the container
                          Text(
                            "Hi, I'm Greg, thanks for stopping by!\n",
                            style: getScaledTextStyle(
                              context,
                              Theme.of(context).textTheme.displayMedium,
                            )?.copyWith(
                              color: TextColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right:
                                  getMarginAsScaledPercent(context, 1000, 0.1),
                              left:
                                  getMarginAsScaledPercent(context, 1000, 0.1),
                            ),
                            child: Text(
                              "I am a life-long learner and I have spent my personal and professional career exploring a wide range of disciplines. I really like building cool things that make a difference.\n\nThis website should give you an idea of my experience and the kinds of things I like working on. Enjoy!\n\n",
                              style: getScaledTextStyle(
                                context,
                                Theme.of(context).textTheme.displaySmall,
                              )?.copyWith(
                                color: TextColors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
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
                          Padding(
                            padding: EdgeInsets.only(
                                right: getScreenWidth(context) / 4,
                                bottom: getScreenScale(context) * 24),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical:
                                      10), // Optional: adds vertical spacing
                              height: getScreenScale(context) *
                                  8, // Thickness of the line
                              width: double
                                  .infinity, // Full width - adjust as needed
                              decoration: BoxDecoration(
                                color: AccentColors.peach, // Color of the line
                                borderRadius:
                                    BorderRadius.circular(10), // Rounded edges
                              ),
                            ),
                          ),
                          Text(
                            "I pride myself on my diverse skillset and interests.",
                            style: getScaledTextStyle(
                              context,
                              Theme.of(context).textTheme.bodySmall,
                            )?.copyWith(
                              color: TextColors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Click on a box below to learn more.",
                            style: getScaledTextStyle(
                              context,
                              Theme.of(context).textTheme.bodySmall,
                            )?.copyWith(
                              color: TextColors.white,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: getScreenScale(context) * 24,
                          ),
                          Flex(
                              direction: getScreenWidth(context) > 1000
                                  ? Axis.horizontal
                                  : Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClickableTile(
                                      svgPath: "assets/business-icon.svg",
                                      name: "BUSINESS",
                                      onTapCb: selectTile,
                                    ),
                                    ClickableTile(
                                      svgPath: "assets/tech-icon.svg",
                                      name: "TECH",
                                      onTapCb: selectTile,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClickableTile(
                                      svgPath: "assets/science-icon.svg",
                                      name: "SCIENCE",
                                      onTapCb: selectTile,
                                    ),
                                    ClickableTile(
                                      svgPath: "assets/life-icon.svg",
                                      name: "LIFE",
                                      onTapCb: selectTile,
                                    ),
                                  ],
                                )
                              ]),
                          AnimatedCrossFade(
                            duration: const Duration(milliseconds: 300),
                            firstChild: Container(),
                            secondChild: selectedTile != null
                                ? SizedBox(
                                    width: getScreenWidth(context) -
                                        2 *
                                            getMarginAsScaledPercent(
                                                context, 1000, 0.2),
                                    child: Card(
                                        key: _targetKey,
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
                  ),
                  Container(
                    margin: const EdgeInsets.all(24.0),
                    child: const Text(
                        "This site is still a work-in-progress... more to come soon!"),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(24.0),
              child: Text(
                "© ${DateTime.now().year} Greg Van Aken ",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
