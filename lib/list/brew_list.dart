import 'package:firebasse_firestore/modals/brewmodel.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  final BrewModel brewModel;
  BrewTile({required this.brewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 9),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[brewModel.strength],
          ),
          title: Text(brewModel.name),
          subtitle: Text('Takes ${brewModel.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
