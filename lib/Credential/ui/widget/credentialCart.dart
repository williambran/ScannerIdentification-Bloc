
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:segurity_anam_app/Credential/model/CredentialModel.dart';

class CredentialCart extends StatelessWidget {

  CredentialModel? credentialModel;

  CredentialCart({Key? key,this.credentialModel}) ;


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var status = "";
    final nombre = Text(
      credentialModel!.name,
      style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 20.0,
          fontWeight: FontWeight.bold
      ),
    );

    final numCuenta = Text(
      credentialModel!.idCuenta.toString(),
      style: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.4),
          fontFamily: 'Lato',
          fontSize: 12.0,
          fontWeight: FontWeight.bold
      ),
    );
     if(credentialModel!.activo == 1){
       status = "Activo";
      }else{
       status = "Inactivo";
     }
    final statusAlumno = Text(
      'Alumno '+ status,
      style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber
      ),
    );

    final card = Container(
      margin: EdgeInsets.only(top: 5.0,bottom: 1.0),
      width: screenWidth * 0.89,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
      child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nombre,
              numCuenta,
              statusAlumno
            ],
          )
      ),
    );
    return Stack(
      alignment: const Alignment(0.8,1.25),
      children: [
        card
      ],
    );
  }

}