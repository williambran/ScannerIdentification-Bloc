



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWithoutCallback extends StatelessWidget {


  String? title;

  ButtonWithoutCallback({
    this.title,
  }) ;

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 45.0,
      width: 240.0,
      margin: const EdgeInsets.only(
          top: 0.0,
          left: 20.0,
          right: 20.0
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: const LinearGradient(
              colors: [
                Color.fromARGB(243, 144, 186, 100),
                Color.fromARGB(222, 107, 150, 4)
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
    );

  }

}