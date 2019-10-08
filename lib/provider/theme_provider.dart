import 'package:flutter/material.dart';
import 'package:ferks/model/ferks_theme.dart';

class ThemeProvider extends StatefulWidget {
  final Widget child;

  ThemeProvider({@required this.child});

  static ThemeProviderState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_ThemeProvider)
            as _ThemeProvider)
        .data;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ThemeProviderState();
  }
}

class ThemeProviderState extends State<ThemeProvider> {
  FerksTheme currentTheme;
  FerksTheme previousTheme;

  ThemeProviderState() {
    currentTheme = FerksTheme(
      brightness: Brightness.light,
      //hex color primary = #0277bd
      primaryColor: Color.fromRGBO(2, 119, 189, 1),
      //hex color secondary = #004c8c
      secondaryColor: Color.fromRGBO(73, 181, 221, 1),
      //hex color secondary = #263238
      accentColor: Color.fromRGBO(38, 50, 56, 1),
      fontFamily: 'Lato',
      primaryTextTheme: Typography().white,
      accentTextTheme: Typography().white,
      appBarSecondary: Colors.grey[200]
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _ThemeProvider(data: this, child: widget.child);
  }

  void changeTheme(FerksTheme newTheme) async {
    setState(() {
      previousTheme = currentTheme;
      currentTheme = newTheme;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class _ThemeProvider extends InheritedWidget {
  final ThemeProviderState data;
  final Widget child;

  _ThemeProvider({Key key, this.data, this.child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_ThemeProvider oldWidget) => true;
}
