//Authentication Function
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //SignIn Anomosuly
  Future signInAno() async {
    try {
      UserCredential credentialAuth = await firebaseAuth.signInAnonymously();
      User? user = credentialAuth.user;
      return user;
    } catch (e) {
      print(e.toString());
    }
  }
}
