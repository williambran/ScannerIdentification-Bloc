import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:segurity_anam_app/Scanner/bloc/BlocScanner.dart';
import 'package:segurity_anam_app/widgets/ButtonCustom.dart';

import '../../../interface/dismitPatther.dart';



class ScannerScreen extends StatefulWidget{

  DissmitPather? dismit;

  ScannerScreen({Key? key, this.dismit});

  @override
  createState()  => _ScannerScreen();
}



class _ScannerScreen extends State<ScannerScreen> {
  BlocScanner? scannerBloc;
  String _data = "";

  @override
  Widget build(BuildContext context) {
    scannerBloc = BlocProvider.of<BlocScanner>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0,left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45,
                  child: IconButton(
                      padding:EdgeInsets.only(top: 25.0,left: 20.0,right: 10.0) ,
                      color: Colors.white,
                      icon: Icon(Icons.keyboard_arrow_left,size: 30.0,),
                      onPressed: (){
                        widget.dismit?.dissmit();
                      }
                  ),
                ),
              ),
              Flexible(
                  child:Container(
                    padding: EdgeInsets.only(top: 55.0,left: 20.0,right: 10.0),
                    child: const Text("Menu",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      ),
                    ),
                  )
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 250.0),
            alignment: Alignment.center,
            child: ButtonCustom(
              title: "Escanear",
              imagePath: 'assets/icon/icon_next.png',
              onPressed: (){
               // _scan();
                scannerBloc!.searchId();
              },
            ),
          )
        ],
      )
    );
  }

  
  _scan() async {
     await FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.BARCODE).then((value) {
         scannerBloc!.searchId();
         setState((){
           _data = value;
           print("El codigo de barras es :$_data");
         });
     }
     );
  }
}