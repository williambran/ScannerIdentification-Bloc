import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:segurity_anam_app/Scanner/model/ScannerModel.dart';

import '../Credential/model/CredentialModel.dart';


class FirestoreApi {

  final baseDatos = FirebaseFirestore.instance;
  List<ScannerModel> credentialModelArr = [];

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> consultar() async{

   /* var dataCredential = baseDatos.collection("credencil").get();

    return dataCredential;
    */
    var  prueba = baseDatos.collection("credencial").snapshots();
    return prueba;
/*
    try{
      baseDatos.collection("credencial").get().then((value) {
      //  val valuedd = value.docs.first;
        value.docs.forEach((element) {
          print("consultamos algo");
           credentialModelArr.add(ScannerModel.fromJson(element));
//          var arCredential = CredentialModel(idCuenta:element['idCuenta'],name: element['nombre'], activo: element['activo'], processing:element['processing'] );
        });
        return  credentialModelArr;
      });
      return  credentialModelArr;

      // return [ScannerModel(idCuenta: "idCuenta", name: "name", activo: false)];
    }catch(error){
      print("El error");
      print(error);
      //return null;
    }*/
  }

}