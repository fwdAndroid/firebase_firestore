import 'package:cloud_firestore/cloud_firestore.dart';

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

  //Get Data in Streams
  Stream<QuerySnapshot> get bews {
    return brewCollection.snapshots();
  }
}
