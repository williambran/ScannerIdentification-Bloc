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
    );
  }

}