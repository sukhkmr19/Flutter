import 'package:flutter/material.dart';
import 'package:imageloading/navigation/firstScreen.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: AppMain(),
  ));
}

class AppMain extends StatefulWidget {
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<AppMain> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new FirstScreen(),
      title: new Text(
        'Welcome In SplashScreen',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: new Image.network(
          'https://flutter.io/images/catalog-widget-placeholder.png?raw=true'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: Colors.red,
    );
  }
}
