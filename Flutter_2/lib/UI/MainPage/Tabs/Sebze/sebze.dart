import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dikmen/Models/sebzemeyve.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final CollectionReference sebzeCollection =
    Firestore.instance.collection('sebzeler');

class RightBody extends StatefulWidget {
  /*
  List<SebzeMeyve> sebzeler;
  RightBody(this.sebzeler);
  */
  // final ScrollController controller;
  //RightBody({@required this.controller});
  @override
  _RightBodyState createState() => _RightBodyState();
}

class _RightBodyState extends State<RightBody>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    getAllSebze();
    super.initState();
  }

  List<SebzeMeyve> sebzeler;

  getAllSebze() async {
    sebzeler = new List<SebzeMeyve>();
    await sebzeCollection.getDocuments().then((QuerySnapshot snapshot) {
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
        sebzeler.add(sebze);
        print(doc.data['name']);
      });
    });
  }

  List<Widget> _setBuildCards() {
    print('anan');
    List _listings = new List<Widget>();
    for (int i = 0; i < sebzeler.length; i++) {
      _listings.add(_buildCard(
          'T-shirt',
          sebzeler[i].name.toUpperCase(),
          '\₺' + sebzeler[i].fiyat,
          sebzeler[i].picture,
          false,
          false,
          context));
    }
    return _listings;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15.0),
          width: MediaQuery.of(context).size.width - 30,
          height: MediaQuery.of(context).size.height - 50,
          child: GridView.count(
            crossAxisCount: 3,
            
            children:_setBuildCards(),
          ),
        ));
  }

  Widget _buildCard(String category, String name, String price, String imgPath,
      bool added, bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: Card(
          elevation: 7,
          child: Container(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Hero(
                  tag: imgPath,
                  child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      imgPath,
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
            Text(price,
                style: TextStyle(
                    color: Color(0xFFCC8053),
                    fontFamily: 'Varela',
                    fontSize: 14.0)),
            Text(name,
                style: TextStyle(
                    color: Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 14.0)),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Divider(
                height: 2,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              if (!added) ...[
                Icon(Icons.shopping_basket,
                    color: Color(0xFFD17E50), size: 12.0),
                Text('Sepetime Ekle',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        color: Color(0xFFD17E50),
                        fontSize: 12.0))
              ],
              if (added) ...[
                Icon(Icons.remove_circle_outline,
                    color: Color(0xFFD17E50), size: 20.0),
                Text('3',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        color: Color(0xFFD17E50),
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0)),
                Icon(Icons.add_circle_outline,
                    color: Color(0xFFD17E50), size: 20.0),
              ]
            ])
          ]))),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
