import 'package:flutter/material.dart';
import 'package:ferks/provider/theme_provider.dart';
import 'package:ferks/model/ferks_theme.dart';

class _DiscoverTabState extends State<DiscoverTab> {
  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    FerksTheme theme = ThemeProvider.of(context).currentTheme;
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
          brightness: Brightness.light,
          /*leading: IconButton(
          icon: Icon(
            IconData(0xe9fc, fontFamily: 'Icomoon'),
            color: Colors.white,
          ),
        ),*/
          backgroundColor: theme.appBarSecondary,
          title: Text(
            "Discover".toUpperCase(),
            style: TextStyle(color: theme.primaryColor),
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              // A fixed-height child.
              color: const Color(0xff808000), // Yellow
              height: 120.0,
            ),
            Container(
              // Another fixed-height child.
              color: const Color(0xff008000), // Green
              height: 120.0,
            ),
          ],
        ),
      ),
    );
  }
}

class DiscoverTab extends StatefulWidget {
  DiscoverTab({Key key}) : super(key: key);

  @override
  _DiscoverTabState createState() => _DiscoverTabState();
}
