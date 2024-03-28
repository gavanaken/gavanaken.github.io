import 'package:flutter/material.dart';
import 'icon_tile.dart';

class DevelopContent extends StatelessWidget {
  const DevelopContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.center,
      children: [
        IconTile(
          iconPath: 'assets/Python.png',
          name: "Python",
        ),
        IconTile(
          iconPath: 'assets/Cplusplus.png',
          name: "C/C++",
        ),
        IconTile(
          iconPath: 'assets/Csharp.png',
          name: "C#/.NET",
        ),
        IconTile(
          iconPath: 'assets/JavaScript.png',
          name: "JS/HTML",
        ),
        IconTile(
          iconPath: 'assets/VSCode.png',
          name: "VS CODE",
        ),
        IconTile(
          iconPath: 'assets/Django.png',
          name: "DJANGO",
        ),
        IconTile(
          iconPath: 'assets/ST.png',
          name: "STMicro",
        ),
        IconTile(
          iconPath: 'assets/Git.png',
          name: "GIT",
        ),
        IconTile(
          iconPath: 'assets/Postgres.png',
          name: "SQL",
        ),
        IconTile(
          iconPath: 'assets/Flutter.png',
          name: "FLUTTER",
        ),
        IconTile(
          iconPath: 'assets/Qt.png',
          name: "QT",
        ),
        IconTile(
          iconPath: 'assets/Kafka.png',
          name: "KAFKA",
        ),
        IconTile(
          iconPath: 'assets/Kotlin.png',
          name: "KOTLIN",
        ),
        IconTile(
          iconPath: 'assets/NXP.png',
          name: "NXP",
        ),
        IconTile(
          iconPath: 'assets/Golang.png',
          name: "GOLANG",
        ),
        IconTile(
          iconPath: 'assets/Docker.png',
          name: "DOCKER",
        ),
      ],
    );
  }
}
