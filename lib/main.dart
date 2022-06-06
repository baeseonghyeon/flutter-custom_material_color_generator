import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_custom_color_palette/colors.dart';
import 'package:flutter_custom_color_palette/components/color_palette.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Color Palette'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool lightTheme = true;
  Color currentColor = Colors.indigo;

  void changeColor(Color color) => setState(() => currentColor = color);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: lightTheme ? ThemeData.light() : ThemeData.dark(),
      child: DefaultTabController(
        length: CustomColorTypes.values.length + 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  text: "Picker",
                ),
                for (var colorType in CustomColorTypes.values)
                  Tab(
                    text: "${colorType.name}",
                  ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              PickerView(),
              for (CustomColorTypes colorType in CustomColorTypes.values)
                ColorTypeView(colorType),
            ],
          ),
        ),
      ),
    );
  }

  Widget PickerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ColorPaletteList(currentColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: currentColor,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        titlePadding: const EdgeInsets.all(0.0),
                        contentPadding: const EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        content: SingleChildScrollView(
                          child: SlidePicker(
                            pickerColor: currentColor,
                            onColorChanged: changeColor,
                            enableAlpha: false,
                            displayThumbColor: true,
                            showIndicator: true,
                            indicatorBorderRadius: const BorderRadius.vertical(
                              top: const Radius.circular(25.0),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'Tap to change color',
                  style: TextStyle(
                    color: useWhiteForeground(currentColor)
                        ? const Color(0xffffffff)
                        : const Color(0xff000000),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget ColorTypeView(CustomColorTypes colorType) {
    return Column(
      children: [
        ColorPaletteList(
          setColor(
            colorType,
            lightTheme ? Brightness.light : Brightness.dark,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: setColor(
                    colorType,
                    lightTheme ? Brightness.light : Brightness.dark,
                  ),
                ),
                onPressed: () => setState(
                  () => lightTheme = !lightTheme,
                ),
                child: Text(
                  lightTheme ? 'Dark' : 'Light',
                  style: TextStyle(
                    color: useWhiteForeground(currentColor)
                        ? const Color(0xffffffff)
                        : const Color(0xff000000),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget ColorPaletteList(Color color) {
    return Flexible(
      fit: FlexFit.loose,
      child: ColorPalette(customColor: color),
    );
  }
}
