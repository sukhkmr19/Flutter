import 'package:flutter/material.dart';

void main() => runApp(CustomButton('hey'));

class CustomButton extends StatelessWidget {
  final String lable;
  CustomButton(this.lable);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: CustomButton('Hello'),
    );
  }
}
