import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



// ignore: must_be_immutable
class ButtonCustom extends StatelessWidget{

  VoidCallback onPressed;
  String? title;
  String? imagePath;
  //ImageData? image;

  ButtonCustom({
    this.title,
    required this.onPressed,
    this.imagePath
  }) ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 45.0,
        width: 240.0,
        margin: const EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(243, 244, 186, 100),
              Color.fromARGB(222, 207, 150, 34)
            ],begin: FractionalOffset(0.2,0.0),
            end: FractionalOffset(1.0,0.6),
            stops: [0.0,0.6],
            tileMode: TileMode.clamp
          )
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0),
          child: Center(

            child: Row(
              children: [
                Image.asset(imagePath!,width: 30.0,height: 30.0,alignment: Alignment.center),
                Text(
                    title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "Lato"
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}