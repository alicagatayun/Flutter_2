import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math' as math;

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Row(
          children: [
            LeftWidget(),
            Expanded(
              child: RightWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class LeftWidget extends StatefulWidget {
  @override
  _LeftWidgetState createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<LeftWidget> with TickerProviderStateMixin {
  List<String> _list = ["Anasayfa", "Kampanyalar", "Hesabım", "Ödeme"];

  List<GlobalKey> _keys = [GlobalKey(), GlobalKey(), GlobalKey(), GlobalKey()];

  int checkIndex = 0;

  Offset checkedPositionOffset = Offset(0, 0);
  Offset lastCheckOffset = Offset(0, 0);

  Offset animationOffset = Offset(0, 0);
  Animation _animation;
  AnimationController _animationController;
  @override
  void initState() {
    checkIndex = _list.length - 1;
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.endOfFrame.then((value) {
      calculateCheckOffset();
      addAnimation();
    });
  }

  void addAnimation() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this)
          ..addListener(() {
            setState(() {
              animationOffset =
                  Offset(checkedPositionOffset.dx, _animation.value);
            });
          });
    _animation = Tween(begin: lastCheckOffset.dy, end: checkedPositionOffset.dy)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutBack));
    _animationController.forward();
  }

  void calculateCheckOffset() {
    lastCheckOffset = checkedPositionOffset;

    RenderBox renderbox = _keys[checkIndex].currentContext.findRenderObject();
    Offset widgetOffset = renderbox.localToGlobal(Offset(0, 0));
    Size widgetSize = renderbox.size;

    checkedPositionOffset = Offset(widgetOffset.dx + widgetSize.width,
        widgetOffset.dy + widgetSize.height);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xffED305A),
            ),
            child: Column(
              children: _buildList(),
            ),
          ),
          Positioned(
            top: animationOffset.dy,
            left: animationOffset.dx,
            child: CustomPaint(
              painter: CheckPointPainter(Offset(10, 0)),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> _widget_list = [];

    _widget_list.add(GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(
          top: 30,
        ),
        child: Icon(
          Icons.more_horiz,
          color: Colors.white,
          size: 30,
        ),
      ),
      onTap: () {
        //print(_list[checkIndex]);
      },
    ));
    _widget_list.add(Padding(
      padding: EdgeInsets.only(
        top: 30,
      ),
      child: Icon(
        Icons.search,
        color: Colors.white,
        size: 30,
      ),
    ));
    for (int i = 0; i < _list.length; i++) {
      _widget_list.add(Expanded(
        child: GestureDetector(
            onTap: () {
              indexChecked(i);
            },
            child: VerticalText(
                _list[i],
                _keys[i],
                (checkIndex == i &&
                    (_animationController != null &&
                        _animationController.isCompleted)))),
      ));
    }

    _widget_list.add(Padding(
      padding: EdgeInsets.only(
        bottom: 30,
        top: 30,
      ),
      child: Icon(
        Icons.map,
        color: Colors.white,
        size: 30,
      ),
    ));

    return _widget_list;
  }

  void indexChecked(int i) {
    if (checkIndex == i) return;
    //Test();
    setState(() {
      //index = checkIndex;
      checkIndex = i;

      calculateCheckOffset();
      addAnimation();
      // Test(i);
    });
  }
}

class CheckPointPainter extends CustomPainter {
  double pointRaidus = 5;
  double radius = 30;

  Offset offset;
  CheckPointPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()..style = PaintingStyle.fill;
    double startAngle = -math.pi / 2;
    double sweepAngle = math.pi;

    paint.color = Color(0xfff42b51);

    canvas.drawArc(
        Rect.fromCircle(center: Offset(offset.dx, offset.dy), radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint);
    paint.color = Color(0xffED305A);
    canvas.drawCircle(
        Offset(offset.dx - pointRaidus / 2, offset.dy - pointRaidus / 2),
        pointRaidus,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class VerticalText extends StatelessWidget {
  String name;
  bool checked;
  GlobalKey globalKey;
  VerticalText(this.name, this.globalKey, this.checked);
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      key: globalKey,
      quarterTurns: 3,
      child: Text(
        name,
        style: TextStyle(
            color: checked ? Color(0xff98162d) : Colors.white, fontSize: 16),
      ),
    );
  }
}

class RightWidget extends StatefulWidget {
  @override
  _RightWidgetState createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 20),
            child: Text(
              "Ürünlerimiz",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: SizedBox(
              height: 30,
              child: TabBar(
                indicator: BoxDecoration(
                  color: Color(0x55B71C1C),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
                isScrollable: true,
                unselectedLabelColor: Colors.black,
                labelColor: Color(0xffED305A),
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                    text: "Sebze",
                  ),
                  Tab(text: "Meyve"),
                  Tab(text: "Yeşillik"),
                  Tab(text: "Hazır Yemek"),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                RightBody(),
                RightBody_1(),
                RightBody(),
                RightBody(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RightBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "Dikmen Pazarı",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 2),
                            color: Color(0X33757575))
                      ]),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 2),
                            color: Color(0X33757575))
                      ]),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "En çok tercih edilenler",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 2),
                            color: Color(0X33757575))
                      ]),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 2),
                            color: Color(0X33757575))
                      ]),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 100),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(
                  right: 20,
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    color: Color(0xffED305A),
                    borderRadius: BorderRadius.circular(
                      30,
                    )),
                child: Text(
                  "Hepsini göster",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RightBody_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "Dikmen Pazarı",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 2),
                            color: Color(0X33757575))
                      ]),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 2),
                            color: Color(0X33757575))
                      ]),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 100),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(
                  right: 20,
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    color: Color(0xffED305A),
                    borderRadius: BorderRadius.circular(
                      30,
                    )),
                child: Text(
                  "Hepsini göster",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
