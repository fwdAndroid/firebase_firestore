import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasse_firestore/service/auth.dart';
import 'package:firebasse_firestore/service/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final String id;
  Home({required this.id});
  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return StreamProvider<QuerySnapshot?>.value(
      initialData: null,
      value: DatabaseService(uid: id).bews,
      child: Scaffold(
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
      ),
    );
  }
}
