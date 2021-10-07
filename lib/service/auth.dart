//Authentication Function
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasse_firestore/modals/usermodals.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Create user Object by using UserModal on Firebase User
  UserModal? _userFromFirebaseUser(User? user) {
    return user != null ? UserModal(uid: user.uid) : null;
  }

  //Auth Changes using Stream
  //Stream is used to show the continous flow of data
  Stream<UserModal?> get user {
    return firebaseAuth.authStateChanges().map(_userFromFirebaseUser);
    //  .map((User? user) => _userFromFirebaseUser(user));
  }

  //SignIn Anomosuly
  Future signInAno() async {
    try {
      UserCredential credentialAuth = await firebaseAuth.signInAnonymously();
      User? user = credentialAuth.user;
      print(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }
}
