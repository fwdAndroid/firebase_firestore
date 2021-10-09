import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatelessWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<QuerySnapshot>(context);
    // ignore: avoid_print
    for (var doc in brews.docs) {
      print(doc.data());
    }
    return Container();
  }
}
