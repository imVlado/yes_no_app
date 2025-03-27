import 'package:flutter/material.dart';

const Color _customColor =  Colors.pink;

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.yellow,
];


class AppTheme {

  final int selectedColor;
  
  AppTheme({this.selectedColor = 0}): assert(selectedColor >= 0 && selectedColor < _colorThemes.length);
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      

    );
  }


}