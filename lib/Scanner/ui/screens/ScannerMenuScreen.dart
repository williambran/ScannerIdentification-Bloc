import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:segurity_anam_app/widgets/ButtonCustom.dart';
import 'package:segurity_anam_app/widgets/GradientScreen.dart';

import '../../../interface/dismitPatther.dart';
import '../../bloc/BlocScanner.dart';
import 'ScannerScreen.dart';

class ScannerMenuScreen extends StatefulWidget {


  DissmitPather? pather ;

  ScannerMenuScreen({Key? key, this.pather});


  @override
   createState() => _ScannerMenuScreen();

}


class _ScannerMenuScreen extends State<ScannerMenuScreen>{
  var scanner = false ;
  BlocScanner? blocScanner;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    blocScanner = BlocProvider.of(context);
    //Validar si vamos ala pantalla de escaneo o a la del menu
    return handlerScanner();



  }

  Widget handlerScanner(){
    return StreamBuilder(
      stream: blocScanner?.status,
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(scanner){
          return ScannerScreen() ;
        }else {
          return menuScanner();
        }
      } ,
    );
  }

  Widget menuScanner(){
    return Scaffold(
      body: Stack(
        children: [
          GradientScreen(height: 270.0,withRectangles: true),
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
                    child: Lottie.asset('assets/animations/scanner_credential.json')
                ),
                ButtonCustom(imagePath: 'assets/icon/icon_next.png', title: "       Empezar" ,onPressed: (){
                  print("Comenzar a escanear");
                  widget.pather?.dissmit();
                  setState(() {
                    scanner = true;
                  });
                  blocScanner?.buscarCredential();
                  /*  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ScannerScreen()

               ));*/
                })
              ],

            ),
          )
        ],
      ),

    );
  }

}