import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:segurity_anam_app/Credential/bloc/BlocCredential.dart';
import 'package:segurity_anam_app/widgets/ButtonCustom.dart';
import 'package:segurity_anam_app/widgets/GradientScreen.dart';



class CredentialScreenMenu extends StatefulWidget {

  @override
  createState() => _CredentialScreen();

}


class _CredentialScreen extends State<CredentialScreenMenu>{

  BlocCredential? blocCredential;

  @override
  Widget build(BuildContext context) {
    blocCredential = BlocProvider.of(context);
    return dowloadDocument();
  }




  Widget dowloadDocument (){
    return Scaffold(
      body: Stack(
        children: [
          GradientScreen(height: 270.0),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 100.0),
                child: const Text("Descargar archivos",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0
                    )
                ),
          ),
          Container(

            padding: EdgeInsets.only(top: 300.0),
            child: Column(
              children: [
                Center(
                  child: Image.asset('assets/icon/icon_download.png',width: 200.0,)
                ),
                ButtonCustom(
                    imagePath: 'assets/icon/icon_download.png' ,
                    title: "Descargar",
                    onPressed: (){

                    })
              ],
            )
          )
        ],
      ),
    );
}


}