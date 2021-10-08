import 'package:firebasse_firestore/service/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService authService = AuthService();
  //TextField States To Listen the changes
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: const Text("SignIn to Brew Crew"),
      ),
      body: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: () async {},
              child: Text(
                'Sign In',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
