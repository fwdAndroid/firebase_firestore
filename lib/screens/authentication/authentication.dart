import 'package:firebasse_firestore/screens/authentication/register.dart';
import 'package:firebasse_firestore/screens/authentication/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    bool isSignIn = true;
    toggleView() {
      setState(() {
        isSignIn = !isSignIn;
      });
    }

    if (isSignIn) {
      return SignIn(
          // toggleView: toggleView,
          );
      // ignore: dead_code
    } else {
      return RegisterForm();
    }
  }
}
