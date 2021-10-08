import 'package:firebasse_firestore/service/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text('BREW'),
        elevation: 0,
        actions: [
          TextButton.icon(
              onPressed: () async {
                await authService.signOut();
              },
              icon: Icon(Icons.logout),
              label: Text('Logout', style: TextStyle(color: Colors.white)))
        ],
      ),
      body: Container(
        color: Colors.pink,
      ),
    );
  }
}
