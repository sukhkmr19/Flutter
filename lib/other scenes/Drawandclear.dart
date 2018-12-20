import 'package:flutter/material.dart';
import 'package:imageloading/other scenes/unicorn_button.dart';

void main() => runApp(MaterialApp(home: DemoApp()));
List<Offset> _points = <Offset>[];
bool toggle = false;
Color colors = Colors.red;

class DemoApp extends StatelessWidget {
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: false,
        labelText: '',
        currentButton: FloatingActionButton(
          heroTag: "remove",
          backgroundColor: Colors.blue,
          mini: true,
          child: Icon(Icons.clear),
          onPressed: () {
            _clearAll();
          },
        )));

    childButtons.add(UnicornButton(
        hasLabel: false,
        labelText: '',
        currentButton: FloatingActionButton(
            onPressed: () {
              _change();
            },
            heroTag: "undo",
            backgroundColor: Colors.blue,
            mini: true,
            child: Icon(Icons.undo))));

    childButtons.add(UnicornButton(
        hasLabel: false,
        labelText: '',
        currentButton: FloatingActionButton(
            onPressed: () {
              if (toggle) {
                toggle = false;
              } else {
                toggle = true;
              }
              _changeColor();
            },
            heroTag: "color",
            backgroundColor: Colors.blue,
            mini: true,
            child: Icon(Icons.change_history))));
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas"),
      ),
      body: Center(
        child: Signature(),
      ),
      floatingActionButton: UnicornDialer(
          backgroundColor: Colors.transparent,
          parentButtonBackground: Colors.redAccent,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.add),
          childButtons: childButtons),
    );
  }

  _change() {
    change();
  }

  _clearAll() {
    clearAll();
  }

  _changeColor() {
    changeColor();
  }
}

void clearAll() {
  print('clearAll');
  _points.clear();
  SignatureState();
}

void change() {
  print('remove');
  _points.removeLast();
  SignatureState();
}

void changeColor() {
  if (toggle) {
    colors = Colors.red;
  } else {
    colors = Colors.blue;
  }
}

class Signature extends StatefulWidget {
  SignatureState createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition =
              referenceBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child:
          CustomPaint(painter: SignaturePainter(_points), size: Size.infinite),
    );
  }
}

class SignaturePainters extends CustomPainter {
  SignaturePainters(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = colors
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}
