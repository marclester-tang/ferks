import 'package:flutter/material.dart';
import 'package:ferks/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends StatefulWidget {
  final Widget child;

  AuthProvider({@required this.child});

  static AuthProviderState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_AuthProvider)
            as _AuthProvider)
        .data;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AuthProviderState();
  }
}

class AuthProviderState extends State<AuthProvider> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _AuthProvider(data: this, child: widget.child);
  }

  bool isAuthenticated() => user != null ? true : false;

  Future<User> login(String username, String password) async {

  }

  Future<User> signup(User user) async {
    final FirebaseUser user = await _auth.createUserWithEmailAndPassword(
      email: 'an email',
      password: 'a password',
    );
    return User();
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

class _AuthProvider extends InheritedWidget {
  final AuthProviderState data;
  final Widget child;

  _AuthProvider({Key key, this.data, this.child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_AuthProvider oldWidget) => true;
}
