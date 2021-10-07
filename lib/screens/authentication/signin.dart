import 'package:firebasse_firestore/service/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: const Text("SignIn to Brew Crew"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: const RoundedRectangleBorder(),
          ),
          onPressed: () async {
            dynamic result = await authService.signInAno();
            if (result != null) {
              print(authService.firebaseAuth.currentUser);
            } else {
              print('Error');
            }
          },
          child: Text(
            'SignIn Anos',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
