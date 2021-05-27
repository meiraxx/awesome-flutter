import 'package:brew_crew/screens/authenticate/auth_mail_password.dart';
import 'package:brew_crew/screens/authenticate/reg_mail_password.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn?AuthMailPassword(toggleView: toggleView):RegMailPassword(toggleView: toggleView);
  }
}
