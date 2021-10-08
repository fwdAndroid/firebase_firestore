import 'package:firebasse_firestore/service/auth.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
        title: const Text("Register to Brew Crew"),
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
                'Register',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
