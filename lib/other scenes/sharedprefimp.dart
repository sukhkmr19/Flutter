import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: new Container(
          child: Stack(children: <Widget>[
            FractionalTranslation(
              translation: Offset(0.0, 0.5),
              child: new Container(
                alignment: new FractionalOffset(0.0, 0.0),
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.blue.withOpacity(0.5),
                    width:
                        50.0, // it's my slider variable, to change the size of the circle
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            FractionalTranslation(
              translation: Offset(0.5, 0.0),
              child: new Container(
                alignment: new FractionalOffset(0.0, 0.0),
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.blue.withOpacity(0.5),
                    width:
                        50.0, // it's my slider variable, to change the size of the circle
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            FractionalTranslation(
              translation: Offset(-0.5, 0.0),
              child: new Container(
                alignment: new FractionalOffset(0.0, 0.0),
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.blue.withOpacity(0.5),
                    width:
                        50.0, // it's my slider variable, to change the size of the circle
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            FractionalTranslation(
              translation: Offset(0.0, -0.5),
              child: new Container(
                alignment: new FractionalOffset(0.0, 0.0),
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.blue.withOpacity(0.5),
                    width:
                        50.0, // it's my slider variable, to change the size of the circle
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ]),
        ),
      ),
    ),
  );
}

_incrementCounter() async {
  prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  prefs.setInt('counter', counter);
}

void _widget() {
  Fluttertoast.showToast(
      msg: prefs.getInt('counter').toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.red[600],
      textColor: Colors.white);
}
