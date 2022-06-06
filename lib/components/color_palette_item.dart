import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_custom_color_palette/colors.dart';
import 'package:flutter_custom_color_palette/components/color_palette.dart';

class ColorPaletteItem extends StatelessWidget {
  final int colorPaletteLightnessValue;
  final Color customColor;

  const ColorPaletteItem(
      {Key key, this.colorPaletteLightnessValue, this.customColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialColor materialColors = getMaterialColor(customColor);

    Color materialColor =
        materialColors[colorPaletteLightness[colorPaletteLightnessValue]];

    Color onColor = useWhiteForeground(materialColor)
        ? const Color(0xffffffff)
        : const Color(0xff000000);

    String hexString = materialColor
        .toString()
        .substring(10, materialColor.toString().length - 1)
        .toUpperCase();

    return Container(
      decoration: BoxDecoration(color: materialColor),
      child: ListTile(
        leading: Text(
          '${colorPaletteLightness[colorPaletteLightnessValue]}',
          style: TextStyle(
            color: onColor,
          ),
        ),
        title: Text(
          '#${hexString}',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: onColor,
          ),
        ),
      ),
    );
  }
}
