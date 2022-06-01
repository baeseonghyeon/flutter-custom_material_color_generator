import 'dart:convert';

import 'package:flutter/material.dart';

enum ColorName { Primary, Secondary, yello }

enum UiMode { Day, Night }

class AllColor {
  // String colorSchema = "{}"

  static const Map<ColorName, Map<UiMode, Color>> allColors = {
    ColorName.Primary: {
      UiMode.Day: Color(0xFFDCCBFF),
      UiMode.Night: Color(0xFFDCCBFF),
    },
    ColorName.Secondary: {
      UiMode.Day: Color(0xFFDCCBFF),
      UiMode.Night: Color(0xFFDCCBFF),
    }
  };

  static const primary = {
    UiMode.Day: Color(0xFFF1F0FF),
    UiMode.Night: Color(0xFF34DC8E),
  };
  // static String publicPrimary = jsonEncode(primary);
}
