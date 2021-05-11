import 'dart:io';

import 'package:dikmen/data/data.dart';
import 'package:dikmen/UI/FirstPage/first_main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.black : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return SliderTile(
                imagePath: slides[index].getImageAssetPath(),
                title: slides[index].getTitle(),
                desc: slides[index].getDesc());
          }),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              color: Colors.blueAccent,
              height: Platform.isIOS ? 70 : 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(slides.length - 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    child: Text(
                      "ATLA",
                      style: TextStyle(color: Colors.white, fontSize: 15.9),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(currentIndex + 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    child: Text(
                      "ILERLE",
                      style: TextStyle(color: Colors.white, fontSize: 15.9),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: Platform.isIOS ? 70 : 60,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainPage()));
                      //Navigator.of(context).pop();
                    },
                    child: Text(
                      "BAŞLAMAYA HAZIRSIN",
                      style: TextStyle(color: Colors.white, fontSize: 15.9),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class SliderTile extends StatelessWidget {
  String imagePath, title, desc;
  SliderTile({this.imagePath, this.title, this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(
            height: 20.0,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(desc,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16))
        ],
      ),
    );
  }
}
