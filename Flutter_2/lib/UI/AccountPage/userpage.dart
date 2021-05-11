import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dikmen/models/user.dart';
import 'package:dikmen/models/user_register.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class UserInfoPage extends StatefulWidget {
  User loginUser;
  UserInfoPage(this.loginUser);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  int index;
  bool yesOrNo = false;
  String name, surname, phoneNumber, gender, street, address, mahalle;
  int _indexOfAdresMap = 0;
  //List<Map> adresler = List<Map<String, String>>();

  List<AdresDetail> theList;

  TextEditingController _surname, _name, _adres;
  String _tempGender;

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'TR';
  PhoneNumber number;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    GetTextFieldContent(widget.loginUser.uid);
  }

  createAlertDialog(BuildContext context) {
    showDialog(
        context: (context),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
                title: Center(child: Text(' Cinsiyetiniz ?')),
                content: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.orange)),
                              color: _tempGender == 'Kadın'
                                  ? Colors.orange
                                  : Colors.white,
                              textColor: _tempGender == 'Kadın'
                                  ? Colors.white
                                  : Colors.blueAccent,
                              padding: EdgeInsets.all(8.0),
                              onPressed: () {
                                setState(() {
                                  _tempGender = 'Kadın';
                                });
                              },
                              child: Text(
                                " KADIN ".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.orange)),
                              color: _tempGender == 'Erkek'
                                  ? Colors.orange
                                  : Colors.white,
                              textColor: _tempGender == 'Erkek'
                                  ? Colors.white
                                  : Colors.blueAccent,
                              padding: EdgeInsets.all(8.0),
                              onPressed: () {
                                setState(() {
                                  _tempGender = 'Erkek';
                                });
                                print(_tempGender);
                              },
                              child: Text(
                                " ERKEK ".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.orange)),
                                color: _tempGender == 'Belirtmek İstemiyorum'
                                    ? Colors.orange
                                    : Colors.white,
                                textColor:
                                    _tempGender == 'Belirtmek İstemiyorum'
                                        ? Colors.white
                                        : Colors.blueAccent,
                                padding: EdgeInsets.all(8.0),
                                onPressed: () {
                                  setState(() {
                                    _tempGender = 'Belirtmek İstemiyorum';
                                  });
                                },
                                child: Text(
                                  " BELIRTMEK ISTEMIYORUM ".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ));
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Hesap Bilgileriniz'),
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 25.0, left: 8.0, right: 8.0),
                child: TextFormField(
                  enabled: yesOrNo ? true : false,
                  controller: _name,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      // hintText: 'İsminiz',
                      hintStyle: TextStyle(
                        fontSize: 15,
                      ),
                      labelText: 'Adınız',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
                child: TextFormField(
                  enabled: yesOrNo ? true : false,
                  controller: _surname,
                  onChanged: (value) {
                    setState(() {
                      surname = value;
                    });
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      //hintText: 'Soy İsminiz',
                      hintStyle: TextStyle(
                        fontSize: 15,
                      ),
                      labelText: 'Soyadınız',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 14.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        setState(() {
                          phoneNumber = number.toString();
                          //getPhoneNumber(number.toString());
                        });
                      },
                      ignoreBlank: false,
                      autoValidate: false,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      countries: ['TR'],
                      textFieldController: controller,
                      inputBorder: OutlineInputBorder(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cinsiyet '),
                    GestureDetector(
                      child: Icon(
                        Icons.edit,
                        size: 27,
                      ),
                      onTap: () {
                        createAlertDialog(context);
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
                child: Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    hint: Text(' Mahalleni Seç '),
                    dropdownColor: Colors.white,
                    // elevation: 5,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    value: mahalle,
                    disabledHint: Text(
                      mahalle == null ? ' ' : mahalle,
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextStyle(color: Colors.indigo, fontSize: 20),
                    items:
                        <String>['Mahalle 1', 'Mahalle 2'].map((String value) {
                      return new DropdownMenuItem(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: yesOrNo
                        ? (value) {
                            setState(() {
                              mahalle = value;
                              //  adresler[_indexOfAdresMap]['mahalle'] = value;
                            });
                          }
                        : null,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
                child: Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    hint: Text(' Sokak  '),
                    dropdownColor: Colors.white,
                    // elevation: 5,
                    icon: Icon(Icons.arrow_drop_down),
                    value: street,
                    iconSize: 36,
                    isExpanded: true,
                    disabledHint: Text(
                      street == null ? ' ' : street,
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextStyle(color: Colors.indigo, fontSize: 20),
                    items: <String>['Sokak 1', 'Sokak 2'].map((String value) {
                      return new DropdownMenuItem(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: yesOrNo
                        ? (value) {
                            setState(() {
                              street = value;
                            });
                          }
                        : null,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                  controller: _adres,
                  enabled: yesOrNo,
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: null,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Açık Adresiniz',
                      hintStyle: TextStyle(
                        fontSize: 15,
                      ),
                      labelText: 'Açık Adres',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      splashColor: Colors.lightBlue,
                      color: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'Bilgilerimi Düzenle',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      onPressed: () {
                        setState(() {
                          DisableButtons(true);
                        });
                      },
                    ),
                    RaisedButton(
                      color: Colors.orangeAccent,
                      splashColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'Bilgilerimi Kaydet',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      onPressed: () {
                        SaveUserInformation(widget.loginUser.uid);
                        DisableButtons(false);
                        //Navigator.of(context).push(MaterialPageRoute(
                        //builder: (context) => UserInfoPage()));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SaveUserInformation(String uid) async {
    int flag = 0;
    /* DatabaseService _dbService = new DatabaseService(uid: uid);
    _dbService.updateUserData(name, surname, 'gender', phoneNumber, adresler);*/
    try {
      var b = AdresDetail(address, true, mahalle, street);
      List<AdresDetail> test = new List<AdresDetail>();
      test.add(b);
      // theList = List<AdresDetail>();
      if (theList != null) {
        theList.forEach((element) {
          if (element.is_favorite == true) {}
          if (element.acik_adres == test[0].acik_adres) {
            if (element.mahalle == test[0].mahalle) {
              if (element.street == test[0].street) {
                print('flag =1');

                flag = 1;
              }
            }
          }
        });
        if (flag == 0) {
          int i = GetIndex();
          print(i);
          theList.removeAt(i);
          theList.add(b);
        }
      }
      theList = new List<AdresDetail>();
      theList.add(b);
      var a = Register(name, surname, _tempGender, phoneNumber, theList);

      await Firestore.instance
          .collection('users')
          .document(uid)
          .setData(a.toMap());

      print('returning from write!');
    } catch (e) {
      print('Error ${e.toString()}');
    }
  }

  ChangeColor(String _gender) {
    setState(() {
      _tempGender = _gender;
    });
  }

  GetIndex() {
    return index;
  }

  GetTextFieldContent(String uId) async {
    try {
      //List<AdresDetail> adresler = new List<AdresDetail>();

      var aFromFs =
          await Firestore.instance.collection('users').document(uId).get();
      if (aFromFs.data != null) {
        var a = Register.fromMap(aFromFs.data, uId);

        /*print(
          'the A from FireBase $a with name ${a.name} first item ${a.adresler.first.acik_adres}');
*/
        print('returning from read!');
        setState(() {
          theList = a.adresler;
          for (int i = 0; i < theList.length; i++) {
            if (theList[i].is_favorite == true) {
              mahalle = theList[i].mahalle;
              street = theList[i].street;
              address = theList[i].acik_adres;

              index = i;
            }
          }

          name = a.name;
          surname = a.surname;
          phoneNumber = a.phoneNumber;
          gender = a.gender;

          number = PhoneNumber(
              isoCode: 'TR', dialCode: '+90', phoneNumber: phoneNumber);
        });
      }

      _surname = new TextEditingController(text: surname);
      _name = new TextEditingController(text: name);
      //_phoneNumber = new TextEditingController(text: phoneNumber);
      _adres = new TextEditingController(
        text: address,
      );
      _tempGender = gender;

      // mahalle = a.adresler.first.mahalle;
    } catch (e) {
      print('Oh no Error! ${e.toString()}');
    }

    /*final usersRef = Firestore.instance.collection('users');
    await usersRef.document(uId).get().then((DocumentSnapshot doc) {
      
    });*/

    //final usersRef = Firestore.instance.collection('users');

    /*usersRef.getDocuments().then((QuerySnapshot snapShot) {
      snapShot.documents.forEach((DocumentSnapshot element) {
        element.data;
        
      });
    });*/
  }

  DisableButtons(bool _yesOrNo) {
    setState(() {
      yesOrNo = _yesOrNo;
    });
  }
}
