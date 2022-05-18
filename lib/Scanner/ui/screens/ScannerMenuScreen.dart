import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:segurity_anam_app/widgets/ButtonCustom.dart';
import 'package:segurity_anam_app/widgets/GradientScreen.dart';



class ScannerScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Stack(
     children: [
       GradientScreen(height: 270.0),
       Container(
         padding: EdgeInsets.only(top: 100.0),
         alignment: Alignment.topCenter,
         child: Column(
           children:  [
             const Text("Escanner",
               style: TextStyle(
                 fontSize: 40.0,
                 fontWeight: FontWeight.bold,
                 color: Colors.white
               ),
             ),
             Center(
                 child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_NzxWL9.json')
             ),
             ButtonCustom(imagePath: 'assets/icon/icon_next.png', title: "       Empezar" ,onPressed: (){
               print("Comenzar a escanear");

             })
           ],

         ),
       )
     ],
   );
  }

}