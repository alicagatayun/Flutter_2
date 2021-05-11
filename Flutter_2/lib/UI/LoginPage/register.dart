import 'package:dikmen/BackEnd/auth.dart';

import 'package:dikmen/shared/constants.dart';
import 'package:dikmen/shared/loading.dart';
import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  final Function toggleView;
  UserRegister({this.toggleView});
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            //resizeToAvoidBottomInset: true,
            backgroundColor: Colors.blue[100],
            appBar: AppBar(
              backgroundColor: Colors.blue[400],
              elevation: 0.0,
              centerTitle: true,
              title: Text('Dikmen Pazarcım Üyelik'),
            ),
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/logo_test.png",
                      height: 100.0,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'E- mail'),
                        validator: (val) => val.isEmpty
                            ? 'Lütfen bir mail adresi giriniz.'
                            : null,
                        onChanged: (value) {
                          setState(() => email = value);
                        }),
                    SizedBox(height: 10.0),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Şifre'),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Şifren 6 karakterden az olamaz.'
                            : null,
                        onChanged: (value) {
                          setState(() => password = value);
                        }),
                    SizedBox(height: 10.0),
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Ad & Soyad'),
                        validator: (val) => val.length < 3
                            ? 'Lütfen Adınızı doğru giriniz.'
                            : null,
                        onChanged: (value) {
                          setState(() => email = value);
                        }),
                    SizedBox(height: 10.0),
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Telefon Numarası'),
                        validator: (val) => val.isEmpty
                            ? 'Lütfen Telefon numaranızı giriniz.'
                            : null,
                        onChanged: (value) {
                          setState(() => email = value);
                        }),
                    SizedBox(height: 10.0),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.pink[400],
                        child: Text(
                          'GİRİŞ',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    'Bilgilerinde hata var, lütfen tekrar dener misin?';
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0)),
                    SizedBox(height: 25.0),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UserRegister()));
                          },
                          child: Text(
                            "Üye Ol",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Şifremi Unuttum",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ));
  }
}
