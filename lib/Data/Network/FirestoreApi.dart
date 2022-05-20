import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:segurity_anam_app/Scanner/model/ScannerModel.dart';

import '../../Credential/model/CredentialModel.dart';


class FirestoreApi {

  final baseDatos = FirebaseFirestore.instance;
  List<ScannerModel> credentialModelArr = [];

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> consultar() async{

   /* var dataCredential = baseDatos.collection("credencil").get();

    return dataCredential;
    */
    var  prueba = baseDatos.collection("credencial").snapshots();
    return prueba;

  }

}