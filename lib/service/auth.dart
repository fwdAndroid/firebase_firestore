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

  //SignOut
  Future signOut() async {
    try {
      return await firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  //Register With Email And Password
  Future registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      print(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  //SignIn With Email and Password
  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      print(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }
}
