// Flutter code sample for material.ListTile.4

// Here is an example of a custom list item that resembles a Youtube related
// video list item created with [Expanded] and [Container] widgets.
//
// ![Custom list item a](https://flutter.github.io/assets-for-api-docs/assets/widgets/custom_list_item_a.png)

import 'package:flutter/material.dart';
import 'package:ferks/provider/theme_provider.dart';
import 'package:ferks/model/ferks_theme.dart';
import 'package:ferks/widget/home_carousel.dart';
import 'package:ferks/page/home_page.dart';
import 'package:flutter/services.dart';
import 'package:ferks/provider/auth_provider.dart';

void main() => runApp(ThemeProvider(child: AuthProvider(child: MyApp())));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    FerksTheme theme = ThemeProvider.of(context).currentTheme;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      systemNavigationBarColor: Colors.white, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ));
    return MaterialApp(
      theme: ThemeData(
        // Define the default Brightness and Colors
        brightness: theme.brightness,
        primaryColor: theme.primaryColor,
        accentColor: theme.accentColor,

        // Define the default Font Family
        fontFamily: theme.fontFamily,

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),

        primaryTextTheme: theme.primaryTextTheme,
        accentTextTheme: theme.accentTextTheme,

        /*pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),*/
      ),
      initialRoute: HomePage.routeName,
      routes: <String, WidgetBuilder>{
        HomePage.routeName: (BuildContext context) => HomePage()
      },
    );
  }
}
