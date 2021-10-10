// ignore_for_file: prefer_const_constructors

import 'package:firebasse_firestore/modals/brewmodel.dart';
import 'package:firebasse_firestore/service/auth.dart';
import 'package:firebasse_firestore/service/database.dart';
import 'package:firebasse_firestore/setting/setting_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final String id;
  Home({required this.id});
  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    void showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (x) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: SettingForm(),
            );
          });
    }

    return StreamProvider<List<BrewModel>?>.value(
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
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                showSettingPanel();
              },
              icon: Icon(Icons.settings),
              label: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: Container(
          color: Colors.pink,
        ),
      ),
    );
  }
}
