import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class GradientScreen extends StatelessWidget {

  String? title = "Algun titulo";
  double? height = 0.0;


  GradientScreen({this.title, this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;

    height ??= screenHeight;
    Color white = Color.fromARGB(243, 244, 186, 100);
    /*
    *       Color.fromARGB(204, 168, 244, 252),
            Color.fromARGB(232, 175, 162, 237)
    * */
    return Container(
      width: screenWidht,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(235, 97, 8, 83),
            Color.fromARGB(253, 19, 19, 56)
          ],
          begin: FractionalOffset(0.1, 0.0),
          end: FractionalOffset(1.0,0.6),
            stops: [0.0,0.7],
            tileMode: TileMode.clamp
        )
      ),
      child: Container(
        padding: EdgeInsets.only(right: 390.0,top: 100.0),
       // alignment: Alignment.topLeft,
        decoration: BoxDecoration(),

        child: Stack(
          children: [
            FittedBox(
              fit: BoxFit.none,
              alignment: Alignment(0.0, -0.5),
              child:
              Container(
                // color: Color.fromRGBO(245, 206, 67, 0.0),
                // alignment: Alignment.center,
                width: 200.0,
                height: 300.0,
                child: CustomPaint(

                  painter: RectanglePainter(),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.none,
              alignment: Alignment(-4.0, -3.7),
              child:
              Container(
                // color: Color.fromRGBO(245, 206, 67, 0.0),
                // alignment: Alignment.center,
                width: 200.0,
                height: 300.0,
                child: CustomPaint(

                  painter: RectanglePainterBlue(),
                ),
              ),
            ),
          ],
        )



      ),
    );
  }

}

class RectanglePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint= Paint()
    ..color = Color.fromARGB(253, 224, 191, 74)
    ..strokeWidth = 12
    ..style = PaintingStyle.stroke;


    final a = Offset(size.width *1/4, size.height * 1/4 );
    final b = Offset(size.width *3/4, size.height * 3/4 );


    final rect = Rect.fromPoints(a, b);
    final radius = Radius.circular(32);


    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
  
}

class RectanglePainterBlue extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint= Paint()
      ..color = Color.fromARGB(253, 34, 149, 226)
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke;


    final a = Offset(size.width *1/4, size.height * 1/4 );
    final b = Offset(size.width *3/4, size.height * 3/4 );


    final rect = Rect.fromPoints(a, b);
    final radius = Radius.circular(32);


    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}