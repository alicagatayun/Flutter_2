import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SebzeMeyve {
  final bool isInSale;
  final bool organic;
  final bool dogal;

  final String fiyat;
  final String mensei;
  final String name;
  final String picture;
  final String stok;

  SebzeMeyve({
    this.isInSale,
    this.organic,
    this.dogal,
    this.fiyat,
    this.mensei,
    this.name,
    this.picture,
    this.stok,
  });
}

class SebzeMeyveDatabaseService {
  final CollectionReference meyveCollection =
      Firestore.instance.collection('sebze');
  //Collection reference
  final CollectionReference sebzeCollection =
      Firestore.instance.collection('sebzeler');

  List<SebzeMeyve> getAllSebze() {
    List<SebzeMeyve> _sebzeler = new List<SebzeMeyve>();
    sebzeCollection.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((DocumentSnapshot doc) {
        SebzeMeyve sebze = new SebzeMeyve(
            isInSale: doc.data['isInSale'],
            organic: doc.data['organik'],
            dogal: doc.data['dogal'],
            fiyat: doc.data['fiyat'],
            mensei: doc.data['mensei'],
            name: doc.data['name'],
            picture: doc.data['picture'],
            stok: doc.data['stok']);
        _sebzeler.add(sebze);
        print(doc.data);
      });
    });

    return _sebzeler;
  }
  /*List<SebzeMeyve> _getAllListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return SebzeMeyve(
              name: doc.data['name'] ?? '',
              isInSale: doc.data['isInSale'],
              organic: doc.data['organik'],
              dogal: doc.data['dogal'],
              fiyat: doc.data['fiyat'] ?? '',
              mensei: doc.data['mensei'] ?? '',
              picture: doc.data['picture'] ?? '',
              stok: doc.data['stok']) ??
          '';
    }).toList();
  }

  Stream<List<SebzeMeyve>> get sebze {
    return sebzeCollection.snapshots().map(_getAllListFromSnapShot);
  }*/
}
