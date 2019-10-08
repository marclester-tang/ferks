import 'package:flutter/material.dart';
import 'package:ferks/provider/theme_provider.dart';
import 'package:ferks/model/ferks_theme.dart';
import 'package:ferks/provider/auth_provider.dart';

class _AccountTabState extends State<AccountTab> {
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
            "Account".toUpperCase(),
            style: TextStyle(color: theme.primaryColor),
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            AuthProvider.of(context).isAuthenticated()
                ? Center(child: MaterialButton(),)
                : Center(child: Text('Logged in'))
          ],
        ),
      ),
    );
  }
}

class AccountTab extends StatefulWidget {
  AccountTab({Key key}) : super(key: key);

  @override
  _AccountTabState createState() => _AccountTabState();
}
