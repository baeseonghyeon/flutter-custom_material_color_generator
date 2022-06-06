import 'package:flutter/material.dart';

enum CustomColorTypes {
  Primary,
  Secondary,
  Success,
  Danger,
  Warning,
  Info,
  Light,
  Dark
}

class CustomColorScheme {
  static const Primary = {
    Brightness.light: Color(0xFF321FDB),
    Brightness.dark: Color(0xFFe55353),
  };

  static const Secondary = {
    Brightness.light: Color(0xFF9da5b1),
    Brightness.dark: Color(0xFF9da5b1),
  };

  static const Success = {
    Brightness.light: Color(0xFF2EB85C),
    Brightness.dark: Color(0xFF2EB85C),
  };

  static const Danger = {
    Brightness.light: Color(0xFFe55353),
    Brightness.dark: Color(0xFFe55353),
  };

  static const Warning = {
    Brightness.light: Color(0xFFf9b115),
    Brightness.dark: Color(0xFFf9b115),
  };

  static const Info = {
    Brightness.light: Color(0xFF3399ff),
    Brightness.dark: Color(0xFF3399ff),
  };

  static const Light = {
    Brightness.light: Color(0xFFebedef),
    Brightness.dark: Color(0xFFebedef),
  };

  static const Dark = {
    Brightness.light: Color(0xFF4f5d73),
    Brightness.dark: Color(0xFF4f5d73),
  };
}

class CustomColors {
  static Color primary(int value) {
    return getMaterialColor(
      CustomColorScheme.Primary[getPlatformBrightness()],
    )[value];
  }
}

MaterialColor getMaterialColor(Color color) {
  List strengths = <double>[0.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1, len = 9; i <= len; i++) {
    strengths.add(0.1 * i);
  }

  strengths.forEach(
    (strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
          r + ((ds < 0 ? r : (255 - r)) * ds).round(),
          g + ((ds < 0 ? g : (255 - g)) * ds).round(),
          b + ((ds < 0 ? b : (255 - b)) * ds).round(),
          1);
    },
  );

  return MaterialColor(color.value, swatch);
}

Brightness getPlatformBrightness() {
  var window = WidgetsBinding.instance.window;
  window.onPlatformBrightnessChanged = () {
    return window.platformBrightness;
  };

  return window.platformBrightness;
}

Color setColor(CustomColorTypes colorType, Brightness currentBrightness) {
  switch (colorType) {
    case CustomColorTypes.Secondary:
      return CustomColorScheme.Secondary[currentBrightness];
    case CustomColorTypes.Success:
      return CustomColorScheme.Success[currentBrightness];
    case CustomColorTypes.Danger:
      return CustomColorScheme.Danger[currentBrightness];
    case CustomColorTypes.Warning:
      return CustomColorScheme.Warning[currentBrightness];
    case CustomColorTypes.Info:
      return CustomColorScheme.Info[currentBrightness];
    case CustomColorTypes.Light:
      return CustomColorScheme.Light[currentBrightness];
    case CustomColorTypes.Dark:
      return CustomColorScheme.Dark[currentBrightness];
    default:
      return CustomColorScheme.Primary[currentBrightness];
  }
}
