import 'package:flutter/material.dart';
import 'package:imageloading/custombutton/custom_button.dart';

class Dashbaord extends StatefulWidget {
  var custom_title;

  Dashbaord({Key key, this.custom_title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MakeItRainState(custome_title: custom_title);
  }
}

class MakeItRainState extends State<Dashbaord> {
  var custome_title;

  MakeItRainState({Key key, this.custome_title});

  int _moneyCounter = 0;
  var _color = Colors.green;

  void _rainMoney() {
    setState(() {
      _moneyCounter = _moneyCounter + 50;
      if (_moneyCounter == 500) {
        _color = Colors.red;
      } else if (_moneyCounter > 1000) {
        _color = Colors.amber;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(custome_title),
        backgroundColor: Colors.lightGreen[300],
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text(
                'Get Rich!',
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24.0,
                    color: Colors.grey[400]),
              ),
            ),
            new Expanded(
                child: new Center(
              child: new Text(
                '\$$_moneyCounter',
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 40.0, color: _color),
              ),
            )),
            new Expanded(
              child: new Center(
                child: new CustomButton(
                  taps: _rainMoney,
                  title: 'Let it Rain!',
                  padding: 10.0,
                  radius: 2.5,
                  message: 'Raining...',
                  color: Colors.lightGreen,
                  textColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
