import 'package:flutter/material.dart';

class FerksTheme {
  Brightness brightness;
  Color primaryColor;
  Color secondaryColor;
  Color accentColor;
  TextTheme primaryTextTheme;
  TextTheme secondaryTextTheme;
  TextTheme accentTextTheme;
  String fontFamily;
  Color appBarSecondary;

  FerksTheme(
      {this.brightness,
      this.primaryColor,
      this.secondaryColor,
      this.accentColor,
      this.fontFamily,
      this.primaryTextTheme,
      this.accentTextTheme,
      this.appBarSecondary});
}
