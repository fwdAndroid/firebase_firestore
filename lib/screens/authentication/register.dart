import 'package:firebasse_firestore/loading/loadingspiner.dart';
import 'package:firebasse_firestore/screens/authentication/signin.dart';
import 'package:firebasse_firestore/service/auth.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  // final Function toggleView;
  // RegisterForm({required this.toggleView});
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
                      //N    widget.toggleView()
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                    icon: Icon(Icons.person),
                    label:
                        Text('SignIn', style: TextStyle(color: Colors.white)))
              ],
              backgroundColor: Colors.brown[400],
              elevation: 0,
              title: const Text("Register to Brew Crew"),
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
                            await authService.registerWithEmailAndPassword(
                                email: email, password: password);

                        if (result == null) {
                          setState(() {
                            error = "Please Write Valid Email";
                            loading = false;
                          });
                        }
                        // else {
                        //   Navigator.push(
                        //       context, MaterialPageRoute(builder: (ctx) => Home()));
                        // }
                      }
                    },
                    child: Text(
                      'Register',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
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
