import 'package:dikmen/BackEnd/auth.dart';
import 'package:dikmen/models/user.dart';
import 'package:dikmen/UI/AccountPage/useraddresses.dart';
import 'package:dikmen/UI/AccountPage/userpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  User loginUser;
  UserPage(this.loginUser);
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool toggleValue = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.shop),
                    Text('   Siparişlerim'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: Colors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                print('hello');
                              },
                              child: Text(
                                'Tümünü Gör',
                                style: TextStyle(color: Colors.green[700]),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Container(
              color: Colors.red,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    margin: EdgeInsets.only(right: 20),
                    height: 105,
                    decoration: BoxDecoration(color: Colors.orange.shade200),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sipariş Tarihi'),
                          Text('Teslim Edildi'),
                          Text('fiyat')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    margin: EdgeInsets.only(right: 20),
                    height: 105,
                    decoration: BoxDecoration(color: Colors.orange.shade200),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sipariş Tarihi'),
                          Text('Teslim Edildi'),
                          Text('fiyat')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    margin: EdgeInsets.only(right: 20),
                    height: 105,
                    decoration: BoxDecoration(color: Colors.orange.shade200),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sipariş Tarihi'),
                          Text('Teslim Edildi'),
                          Text('fiyat')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    margin: EdgeInsets.only(right: 20),
                    height: 105,
                    decoration: BoxDecoration(color: Colors.orange.shade200),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sipariş Tarihi'),
                          Text('Teslim Edildi'),
                          Text('fiyat')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    margin: EdgeInsets.only(right: 20),
                    height: 105,
                    decoration: BoxDecoration(color: Colors.orange.shade200),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sipariş Tarihi'),
                          Text('Teslim Edildi'),
                          Text('fiyat')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    margin: EdgeInsets.only(right: 20),
                    height: 105,
                    decoration: BoxDecoration(color: Colors.orange.shade200),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sipariş Tarihi'),
                          Text('Teslim Edildi'),
                          Text('fiyat')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Divider(
              thickness: 1.2,
              height: 2,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              borderSide: BorderSide(width: 1, color: Colors.green),
              child: Text(
                'Kullanıcı Bilgilerim',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserInfoPage(widget.loginUser)));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              borderSide: BorderSide(width: 1, color: Colors.green),
              child: Text('Kayıtlı Adreslerim'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserAddresses(widget.loginUser)));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              borderSide: BorderSide(width: 1, color: Colors.green),
              child: Text('Ödeme Yöntemlerim'),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    height: 40.0,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: toggleValue
                          ? Colors.greenAccent[100]
                          : Colors.redAccent.withOpacity(0.5),
                    ),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeIn,
                          top: 3.0,
                          left: toggleValue ? 60.0 : 0.0,
                          right: toggleValue ? 0.0 : 60.0,
                          child: InkWell(
                            onTap: toggleButton,
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 1000),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return RotationTransition(
                                  child: child,
                                  turns: animation,
                                );
                              },
                              child: toggleValue
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green,
                                      size: 35.0,
                                      key: UniqueKey())
                                  : Icon(Icons.remove_circle_outline,
                                      color: Colors.red,
                                      size: 35.0,
                                      key: UniqueKey()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Oturumu Kapatmak için tıkla',
                    //kapatırsa butonlar disable olsun ve oturumumu açmak için tıkla yazsın

                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo_test.png',
                    height: 80,
                  ),
                  Text('v.1.0'),
                ],
              )),
        ],
      ),
    );
  }

  toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
      AuthService userLogOut = new AuthService();
      userLogOut.signOut();
      //oturumu kapatmak istediğniize emin misiniz hocam sorulabilir
      // print(toggleValue);
    });
  }
}
