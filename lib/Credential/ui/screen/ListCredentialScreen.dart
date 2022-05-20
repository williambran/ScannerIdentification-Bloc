import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:segurity_anam_app/Credential/bloc/BlocCredential.dart';
import 'package:segurity_anam_app/Credential/ui/widget/credentialCart.dart';

import 'package:segurity_anam_app/widgets/GradientScreen.dart';




class ListCredentialScreen extends StatefulWidget {

  List<CredentialCart>? credentialCart;

  ListCredentialScreen({Key? key,this.credentialCart });

  @override
   createState() => _ListCredentialScreen();

}


class _ListCredentialScreen extends State<ListCredentialScreen> {
  // BlocCredential? blocCredential;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  //  blocCredential = BlocProvider.of(context);
    return listCredentials();
  }



  Widget listCredentials(){
    return Scaffold(
      body: Stack(
      children: [
        GradientScreen(height: 100.0,),
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: ListView(
            padding: EdgeInsets.only(top: 50.0),
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50.0),

                child: Column(
                  children: widget.credentialCart!,
                ),
              )
            ],
          ),
        ),
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
                      Navigator.pop(context);
                    }
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 55.0),
              child: Text("Volver",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28.0),),
            )
          ],

        ),

      ],
      ),
    );
  }

}