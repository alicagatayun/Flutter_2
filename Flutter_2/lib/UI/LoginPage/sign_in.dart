import 'package:dikmen/BackEnd/auth.dart';
import 'package:dikmen/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _rePasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _rePasswordFocusNode.dispose();
    super.dispose();
  }

  List<Color> colors = [Color(0xFF90CAF9), Color(0xFF1565C0)];
  int _index = 0;

  bool loading = false;
  //TextField state
  bool isEmailError = false;
  bool isRePassError = false;
  bool isPassError = false;

  String email = '';
  String password = '';
  String rePassword = '';
  String error = '';

  FocusNode _emailFocusNode;
  FocusNode _passwordFocusNode;
  FocusNode _registerEmailFocusNode;
  FocusNode _registerPasswordFocusNode;

  FocusNode _rePasswordFocusNode;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blue[100],
            body: SafeArea(
              top: false,
              bottom: false,
              left: false,
              right: false,
              child: Container(
                key: _formKey,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: colors,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/logo_test.png',
                          width: 220,
                        ),
                        tabs(context),
                        AnimatedCrossFade(
                          duration: Duration(milliseconds: 150),
                          firstChild: login(context),
                          secondChild: signUp(context),
                          crossFadeState: _index == 0
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                        )
                        // _index == 0 ? login(context) : signUp(context)
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  Widget login(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
      child: Column(
        children: [
          Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 15, right: 15, bottom: 20),
                    child: Column(children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        focusNode: _emailFocusNode,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          labelText: "e-Mail adresinizi yazınız.",
                          labelStyle: TextStyle(
                              color:
                                  isEmailError ? Colors.red : Colors.black87),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                        ),
                      ),
                      Divider(color: Colors.grey, height: 8),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        obscureText: true,
                        focusNode: _passwordFocusNode,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          labelText: "Şifrenizi yazınız.",
                          labelStyle: TextStyle(
                              color: isPassError ? Colors.red : Colors.black87),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                        ),
                      ),
                      Divider(color: Colors.transparent, height: 20),
                    ]),
                  ),
                ),
                Positioned(
                  top: 140,
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          email.isEmpty
                              ? isEmailError = true
                              : isEmailError = false;
                          password.isEmpty
                              ? isPassError = true
                              : isPassError = false;
                        });
                        /*if (_formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });*/
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);

                        if (result == null) {
                          setState(() {
                            //TODO hata mesajı ver yanlışsa
                            loading = false;
                            print('object');
                          });
                        }

                        if (email.isEmpty) {
                          _emailFocusNode.requestFocus();
                        } else if (password.isEmpty) {
                          _passwordFocusNode.requestFocus();
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 100,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: colors),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Center(
                            child: Text(
                              "GİRİŞ YAP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
          Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: GestureDetector(
              child: Center(
                child: Text(
                  "Şifremi Unuttum",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 1,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "veya",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 40,
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget signUp(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
      child: Column(
        children: [
          Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 15, right: 15, bottom: 20),
                    child: Column(children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        focusNode: _registerEmailFocusNode,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          labelText: "e-Mail adresinizi yazınız.",
                          labelStyle: TextStyle(
                              color:
                                  isEmailError ? Colors.red : Colors.black87),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                        ),
                      ),
                      Divider(color: Colors.grey, height: 8),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        focusNode: _registerPasswordFocusNode,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          labelText: "Şifrenizi yazınız.",
                          labelStyle: TextStyle(
                              color: isPassError ? Colors.red : Colors.black87),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                        ),
                      ),
                      Divider(color: Colors.grey, height: 8),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            rePassword = value;
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          labelText: "Şifrenizi tekrar yazınız.",
                          labelStyle: TextStyle(
                              color:
                                  isRePassError ? Colors.red : Colors.black87),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                        ),
                      ),
                      Divider(color: Colors.transparent, height: 20),
                    ]),
                  ),
                ),
                Positioned(
                  top: 220,
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          email.isEmpty
                              ? isEmailError = true
                              : isEmailError = false;
                          password.isEmpty
                              ? isPassError = true
                              : isPassError = false;
                          rePassword.isEmpty
                              ? isRePassError = true
                              : isRePassError = false;
                        });
                        if (password != rePassword) {
                          print('contradiction with the passwords');
                        } else {
                          try {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                //TODO hata mesajı ver yanlışsa
                                loading = false;
                                print('object');
                              });
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                        /*if (_formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });*/

                        if (email.isEmpty) {
                          _emailFocusNode.requestFocus();
                        } else if (password.isEmpty) {
                          _passwordFocusNode.requestFocus();
                        } else if (rePassword.isEmpty) {
                          _rePasswordFocusNode.requestFocus();
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 100,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: colors),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Center(
                            child: Text(
                              "ÜYE OL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            /*child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 1,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "veya",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 40,
                  height: 1,
                  color: Colors.white,
                ),
              ],
            ),*/
          ),
          /* Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset('assets/intro.png'),
                    ),
                  ),
                  onTap: () {},
                ),
                Container(
                  width: 55,
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset('assets/intro.png'),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          )*/
        ],
      ),
    );
  }

  Widget tabs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 15.0, right: 15),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.12),
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                child: Container(
                    decoration: BoxDecoration(
                        color: _index == 0 ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Giriş Yap",
                            style: TextStyle(
                                color:
                                    _index == 0 ? Colors.black : Colors.white,
                                fontSize: 18,
                                fontWeight: _index == 0
                                    ? FontWeight.bold
                                    : FontWeight.normal)),
                      ),
                    )),
                onTap: () {
                  setState(() {
                    _index = 0;
                  });
                },
              )),
              Expanded(
                  child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: _index == 1 ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Yeni Üye",
                      style: TextStyle(
                          color: _index == 1 ? Colors.black : Colors.white,
                          fontSize: 18,
                          fontWeight: _index == 1
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                  )),
                ),
                onTap: () {
                  setState(() {
                    _index = 1;
                  });
                },
              ))
            ],
          )),
    );
  }
}
