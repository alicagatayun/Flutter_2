import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final ValueChanged<String> action; //callback value change
  final String tag; //tag of button
  final String imageData;
  final String buttonName;
  final bool active; // state of button
  CircleButton(
      {this.action, this.imageData, this.buttonName, this.active, this.tag});
  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  void handleTap() {
    setState(() {
      widget.action(widget.tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    double circleBoxSize = 50.0;
    return new Column(
      children: <Widget>[
        FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: handleTap,
          child: new Container(
            width: circleBoxSize,
            height: circleBoxSize,
            decoration: new BoxDecoration(
                gradient: widget.active
                    ? LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                            Color.fromRGBO(79, 172, 254, 1),
                            Color.fromRGBO(0, 242, 245, 1)
                          ])
                    : null,
                shape: BoxShape.circle,
                color: widget.active ? null : Color.fromRGBO(227, 230, 238, 1)),
            child: new Image.asset(
              this.widget.imageData,
              color: widget.active ? Color.fromRGBO(255, 255, 255, 1) : null,
              scale: 1.8,
            ),
          ),
        ),
        SizedBox(height: 14),
        new Text(
          this.widget.buttonName,
          style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 14,
              color: Color.fromRGBO(140, 151, 173, 1),
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
