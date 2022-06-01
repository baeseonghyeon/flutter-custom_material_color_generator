import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_custom_color_palette/colors.dart';

List<int> colorPaletteIndices = [
  50,
  100,
  200,
  300,
  400,
  500,
  600,
  700,
  800,
  900
];

class PaletteListView extends StatefulWidget {
  final Color customColor;
  PaletteListView({Key key, this.customColor}) : super(key: key);
  @override
  _PaletteListViewState createState() => _PaletteListViewState();
}

class _PaletteListViewState extends State<PaletteListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: colorPaletteIndices.length,
      itemBuilder: ((context, index) => colorItem(index)),
    );
  }

  Container colorItem(int index) {
    MaterialColor matColors = getMaterialColor(widget.customColor);
    Color matColor = matColors[colorPaletteIndices[index]];
    Color onColor = useWhiteForeground(matColor)
        ? const Color(0xffffffff)
        : const Color(0xff000000);

    String hexColor = matColor
        .toString()
        .substring(10, matColor.toString().length - 1)
        .toUpperCase();

    AllColor.allColors[ColorName.Primary][UiMode.Day];
    // Colors.accent
    AllColor.primary[UiMode.Day];
    AllColor.primary[UiMode.Night];

    return Container(
      decoration: BoxDecoration(color: matColor),
      child: ListTile(
        leading: Text(
          '${colorPaletteIndices[index]}',
          style: TextStyle(
            color: onColor,
          ),
        ),
        title: Text(
          '#${hexColor}',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: onColor,
          ),
        ),
      ),
    );
  }
}

MaterialColor getMaterialColor(Color color) {
  List strengths = <double>[0.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1, len = 9; i <= len; i++) {
    strengths.add(0.1 * i);
  }

  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1);
  });

  return MaterialColor(color.value, swatch);
}
