import 'package:flutter/material.dart';
import 'package:ferks/provider/theme_provider.dart';
import 'package:ferks/model/ferks_theme.dart';
import 'package:ferks/widget/home_carousel.dart';

class _HomeTabState extends State<HomeTab>
    with AutomaticKeepAliveClientMixin<HomeTab> {
  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    FerksTheme theme = ThemeProvider.of(context).currentTheme;
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        brightness: Brightness.dark,
        /*leading: IconButton(
          icon: Icon(
            IconData(0xe9fc, fontFamily: 'Icomoon'),
            color: Colors.white,
          ),
        ),*/
        title: Card(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Icon(
                  IconData(0xe90a, fontFamily: 'Icomoon'),
                  color: theme.primaryColor,
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Icon(
                  IconData(0xe900, fontFamily: 'Icomoon'),
                  color: theme.primaryColor,
                  size: 40.0,
                ))
          ],
        )),
        actions: <Widget>[
          /*IconButton(
            icon: Icon(
              IconData(0xe992, fontFamily: 'Icomoon'),
              color: Colors.white,
            ),
          ),*/
          IconButton(
            icon: Icon(
              IconData(0xe9ab, fontFamily: 'Icomoon'),
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            HomeCarousel(),
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}
