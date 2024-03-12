import 'package:flutter/material.dart';

class TechTileContent extends StatelessWidget {
  const TechTileContent({super.key});

  @override
  build(BuildContext context) {
    return Column(
      children: [
        Row(),
        Text("This is tech!"),
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
      case "TECH":
        return TechTileContent();
      default:
        return Container();
    }
  }
}
