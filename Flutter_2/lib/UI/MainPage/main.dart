import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dikmen/Models/sebzemeyve.dart';
import 'package:dikmen/UI/AccountPage/UIUserPage.dart';
import 'package:dikmen/UI/BasketPage/basket.dart';
import 'package:dikmen/UI/MainPage/Tabs/DogalUrunler/dogalurunler.dart';
import 'package:dikmen/UI/MainPage/Tabs/HazirYemek/haziryemek.dart';
import 'package:dikmen/UI/MainPage/Tabs/Meyve/meyve.dart';
import 'package:dikmen/UI/MainPage/Tabs/Sebze/sebze.dart';
import 'package:dikmen/UI/MainPage/Tabs/Yesillik/yesillik.dart';
import 'package:dikmen/UI/PromotionsPage/promotions.dart';
import 'package:dikmen/UI/SearchPage/search.dart';
import 'package:dikmen/models/user.dart';
import 'package:dikmen/screens/bottom_navy_bar.dart';

import 'package:dikmen/shared/slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  User loginUser;
  HomeScreen({this.loginUser});

  //AuthService _authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    //print(loginUser.uid);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter demo', loginUser: loginUser),
    );
  }
}

class MyHomePage extends StatefulWidget {
  User loginUser;
  MyHomePage({Key key, this.title, this.loginUser}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 20,
        title: Center(
          child: Image.asset(
            'assets/logo_test.png',
            height: 99,
            width: 100,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            RightWidget(),
            UserPage(widget.loginUser),
            Campaigns(),
            Search(),
            Basket()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text(
                'Anasayfa',
                style: TextStyle(color: Colors.red),
              ),
              icon: Icon(
                Icons.home,
                color: Colors.red,
              )),
          BottomNavyBarItem(
              title: Text(
                'Hesabım',
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(
                Icons.account_circle,
                color: Colors.tealAccent,
              )),
          BottomNavyBarItem(
              title: Text(
                'Kampanyalarımız',
                style: TextStyle(color: Colors.blue),
              ),
              icon: Icon(
                Icons.accessible,
                color: Colors.blue,
              )),
          BottomNavyBarItem(
              title: Text(
                'Ürün ara',
                style: TextStyle(color: Colors.green),
              ),
              icon: Icon(
                Icons.search,
                color: Colors.green,
              )),
          BottomNavyBarItem(
              title: Text(
                'Ödeme',
                style: TextStyle(color: Colors.deepPurpleAccent),
              ),
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.deepPurpleAccent,
              )),
        ],
      ),
    );
  }
}

class RightWidget extends StatefulWidget {
  @override
  _RightWidgetState createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  // final ScrollController scrollcontroller = new ScrollController();
  // bool scroll_visibility = true;
  List<SebzeMeyve> test;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Dashboard_v2(),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: SizedBox(
                height: 30,
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                  isScrollable: true,
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.white,
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(text: "Sebze"),
                    Tab(text: "Meyve"),
                    Tab(text: "Yeşillik"),
                    Tab(text: "Hazır Yemek"),
                    Tab(text: "Doğadan"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  RightBody(),
                  Meyve(),
                  Yesillik(),
                  HazirYemek(),
                  DogalUrunler()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
