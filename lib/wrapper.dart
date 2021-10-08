import 'package:firebasse_firestore/modals/usermodals.dart';
import 'package:firebasse_firestore/screens/authentication/authentication.dart';
import 'package:firebasse_firestore/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrrapper extends StatelessWidget {
  const Wrrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModal? user = Provider.of<UserModal?>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
