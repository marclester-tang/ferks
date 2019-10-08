import 'package:flutter/material.dart';

class _LoginSignupState extends State<LoginSignup> {
  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      body: SingleChildScrollView(
          child: Stack(children: <Widget>[
        TabBar(
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ])),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class LoginSignup extends StatefulWidget {
  static final String routeName = '/loginsignup';

  LoginSignup({Key key}) : super(key: key);

  @override
  _LoginSignupState createState() => _LoginSignupState();
}
