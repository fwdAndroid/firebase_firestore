import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasse_firestore/list/brew_list.dart';
import 'package:firebasse_firestore/modals/brewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatelessWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<BrewModel>>(context) ?? [];
    return ListView.builder(
      itemBuilder: (context, index) {
        return BrewTile(brewModel: brews[index]);
      },
      itemCount: brews.length,
    );
  }
}
