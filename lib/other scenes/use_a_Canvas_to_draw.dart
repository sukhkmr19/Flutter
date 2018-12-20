import 'package:flutter/material.dart';

List<Offset> _points = List<Offset>();
bool toggle = true;

void main() => runApp(MaterialApp(home: root()));

class root extends StatefulWidget {
  RootState createState() => RootState();
}

class RootState extends State<root> {
  void _togggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas"),
      ),
      body: Center(
        child: Signature(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togggle,
        tooltip: 'Update Text',
        child: Icon(Icons.radio),
      ),
    );
  }
}

CustomPaint _toggle() {
  if (toggle) {
    return CustomPaint(
      painter: SignaturePainter(_points),
      size: Size.infinite,
    );
  } else {
    return CustomPaint(
      painter: SignatureClearPainter(_points),
      size: Size.infinite,
    );
  }
}

class Signature extends StatefulWidget {
  Signature({Key key}) : super(key: key);

  SignatureState createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails update) {
        setState(() {
          RenderBox box = context.findRenderObject();
          Offset localPosition = box.globalToLocal(update.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails end) => _points.add(null),
      child: _toggle(),
    );
  }
}

class ClearFieldsSignature extends StatefulWidget {
  ClearFieldsSignature({Key key}) : super(key: key);

  ClearFieldsSignatureState createState() => ClearFieldsSignatureState();
}

class ClearFieldsSignatureState extends State<ClearFieldsSignature> {
  List<Offset> _points = List<Offset>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails update) {
        setState(() {
          RenderBox box = context.findRenderObject();
          Offset localPosition = box.globalToLocal(update.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails end) => _points.add(null),
      child: CustomPaint(
        painter: SignatureClearPainter(_points),
        size: Size.infinite,
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class SignatureClearPainter extends CustomPainter {
  SignatureClearPainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 10.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  bool shouldRepaint(SignatureClearPainter other) => other.points != points;
}
