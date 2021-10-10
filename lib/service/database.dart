import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasse_firestore/modals/brewmodel.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //Collection Reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  //Update USer Data
  Future updateData(String sugar, String name, int strength) async {
    return brewCollection
        .doc(uid)
        .set({'sugars': sugar, 'name': name, 'strength': strength});
  }

  QuerySnapshot? querySnapshot;
  //Get Data in Streams
  Stream<List<BrewModel>> get bews {
    return brewCollection
        .snapshots()
        .map(_brewListFromSnapshot(querySnapshot!));
  }

  //Brew List from Snapshot
  _brewListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map(
          (doc) => {
            BrewModel(
                name: doc.get('name') ?? '',
                strength: doc.get('strength') ?? 0,
                sugars: doc.get('sugars') ?? '0')
          },
        )
        .toList();
  }
}
