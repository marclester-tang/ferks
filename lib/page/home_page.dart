import 'package:flutter/material.dart';
import 'package:ferks/provider/theme_provider.dart';
import 'package:ferks/model/ferks_theme.dart';
import 'package:ferks/widget/tab/home_tab.dart';
import 'package:ferks/widget/tab/discover_tab.dart';
import 'package:ferks/widget/tab/account_tab.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class _HomePageState extends State<HomePage> {
  final _scaffoldState = GlobalKey<ScaffoldState>();

  PageController controller = PageController();

  Widget getBody(current) {
    switch (current) {
      case 0:
        {
          return HomeTab();
        }
      case 1:
        {
          return DiscoverTab();
        }
      case 2:
        {
          return AccountTab();
        }
      default:
        {
          return Center(child: Text('Page not found.'));
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    FerksTheme theme = ThemeProvider.of(context).currentTheme;
    return Scaffold(
        key: _scaffoldState,
        body: PageView.builder(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, position) {
            return getBody(position);
          },
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(
                iconData: IconData(0xe92b, fontFamily: 'Icomoon'),
                title: "Marketplace"),
            TabData(
                iconData: IconData(0xe90f, fontFamily: 'Icomoon'),
                title: "Discover"),
            TabData(
                iconData: IconData(0xe908, fontFamily: 'Icomoon'), title: "You")
          ],
          onTabChangedListener: (position) {
            controller.jumpToPage(position);
          },
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

class HomePage extends StatefulWidget {
  static final String routeName = '/';

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
