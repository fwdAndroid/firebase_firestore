import 'package:firebasse_firestore/loading/loadingspiner.dart';
import 'package:firebasse_firestore/screens/authentication/register.dart';
import 'package:firebasse_firestore/service/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  // final Function toggleView;
  // SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService authService = AuthService();
  final formKey = GlobalKey<FormState>();
  //TextField States To Listen the changes
  String email = "";
  String password = "";
  String error = "";
  //Spinkit
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown,
            appBar: AppBar(
              actions: [
                TextButton.icon(
                    onPressed: () {
                      // ignore: non_constant_identifier_names
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterForm()),
                      );
                    },
                    icon: Icon(Icons.app_registration),
                    label:
                        Text('Register', style: TextStyle(color: Colors.white)))
              ],
              backgroundColor: Colors.brown[400],
              elevation: 0,
              title: const Text("SignIn to Brew Crew"),
            ),
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) => val!.isEmpty ? "Enter An Email" : null,
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
                    validator: (val) => val!.length < 5
                        ? "Password length must be greater than 5 characters"
                        : null,
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
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result =
                            await authService.signInWithEmailAndPassword(
                                email: email, password: password);
                        if (result == null) {
                          setState(() {
                            error = "Invalid Credentials";
                            loading = false;
                          });
                        }
                      }
                    },
                    child: Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  )
                ],
              ),
            ),
          );
  }
}
