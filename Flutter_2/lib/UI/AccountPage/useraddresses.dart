import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dikmen/models/user.dart';
import 'package:dikmen/models/user_register.dart';
import 'package:dikmen/UI/AccountPage/useraddress_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAddresses extends StatefulWidget {
  User loginUser;
  UserAddresses(this.loginUser);
  @override
  _UserAddressesState createState() => _UserAddressesState();
}

class _UserAddressesState extends State<UserAddresses> {
  List<AdresDetail> registeredAddresses = new List<AdresDetail>();
  String name, surname, phoneNumber, gender;
  @override
  void initState() {
    // TODO: implement initState
    GetAddresses(widget.loginUser.uid);
    super.initState();
  }

  setWhichIsFavorite(int index) {
    for (int i = 0; i < registeredAddresses.length; i++) {
      if (i == index) {
        registeredAddresses[i].is_favorite = true;
      } else {
        registeredAddresses[i].is_favorite = false;
      }
    }
  }

  List<Widget> _getAddresses() {
    List _listings = new List<Widget>();
    for (int i = 0; i < registeredAddresses.length; i++) {
      _listings.add(
        new Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                setWhichIsFavorite(i);
                SaveUserInformation(widget.loginUser.uid);
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: registeredAddresses[i].is_favorite == true
                          ? true
                          : false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.deepOrange,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: registeredAddresses[i].is_favorite == false
                          ? true
                          : false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                    Text(registeredAddresses[i].mahalle),
                    SizedBox(
                      height: 20,
                    ),
                    Text(registeredAddresses[i].street),
                    Text(registeredAddresses[i].acik_adres),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    return _listings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Adres Bilgileriniz'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: _getAddresses(),
          ),
        ),
      ),
    );
  }

  GetAddresses(String uId) async {
    var aFromFs = await Firestore.instance
        .collection('users')
        .document(widget.loginUser.uid)
        .get();
    var a = Register.fromMap(aFromFs.data, widget.loginUser.uid);
    a.adresler.forEach((element) {
      AdresDetail yeni_kayit = new AdresDetail(element.acik_adres,
          element.is_favorite, element.mahalle, element.street);

      setState(() {
        name = a.name;
        surname = a.surname;
        phoneNumber = a.phoneNumber;
        gender = a.gender;
        registeredAddresses.add(yeni_kayit);
      });
    });
    return registeredAddresses;
  }

  SaveUserInformation(String uid) async {
    int flag = 0;
    /* DatabaseService _dbService = new DatabaseService(uid: uid);
    _dbService.updateUserData(name, surname, 'gender', phoneNumber, adresler);*/
    try {
      var a = Register(name, surname, gender, phoneNumber, registeredAddresses);

      await Firestore.instance
          .collection('users')
          .document(uid)
          .setData(a.toMap());

      print('returning from write!');
    } catch (e) {
      print('Error ${e.toString()}');
    }
  }
}
