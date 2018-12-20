import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      color: Colors.red,
      child: new Center(
        child: Text('hello theress!',
            textDirection: TextDirection.ltr,
            style: new TextStyle(
                color: Colors.blue,
                decorationStyle: TextDecorationStyle.dotted,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal)),
      ),
    );
  }
}
