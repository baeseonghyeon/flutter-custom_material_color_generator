import 'package:flutter/material.dart';
import 'package:flutter_custom_color_palette/components/color_palette_item.dart';

List<int> colorPaletteLightness = [
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

class ColorPalette extends StatefulWidget {
  final Color customColor;

  ColorPalette({
    Key key,
    this.customColor,
  }) : super(key: key);
  @override
  _ColorPaletteState createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: colorPaletteLightness.length,
      itemBuilder: ((context, index) => ColorPaletteItem(
            colorPaletteLightnessValue: index,
            customColor: widget.customColor,
          )),
    );
  }
}
