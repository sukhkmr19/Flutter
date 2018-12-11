import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myApp',
      theme: ThemeData(primarySwatch: Colors.red),
      home: SamplePage(),
    );
  }
}

class SamplePage extends StatefulWidget {
  SamplePage({Key key}) : super(key: key);

  _SampleAppState createState() => _SampleAppState();
}

class _SampleAppState extends State<SamplePage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      ),
    );
  }

  void loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    print(json.decode(response.body));
    setState(() {
      widgets = json.decode(response.body);
    });
  }

  Widget getRow(int position) {
    return ListTile(
        title: Text('${widgets[position]["title"]}'),
        // When a user taps on the ListTile, navigate to the DetailScreen.
        // Notice that we're not only creating a DetailScreen, we're
        // also passing the current todo through to it!
        onTap: () {
          Fluttertoast.showToast(
              msg: '${widgets[position]["title"]}',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.grey[600],
              textColor: Colors.white);
        });
  }
}
