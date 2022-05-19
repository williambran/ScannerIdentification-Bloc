import 'package:flutter/material.dart';
import 'package:segurity_anam_app/Scanner/model/ScannerModel.dart';
import '../../Credential/model/CredentialModel.dart';
import '../../Data/FirestoreApi.dart';

class ScannerRepository {

  final _firestoreApi = FirestoreApi();


  consultaRepository() async {
    _firestoreApi.consultar().then((credential) {
       credential.listen((data) {
       print("leyende desde el repositorio");
       List<ScannerModel> credentialModelArr = [];
       data.docs.forEach((element) {
        var model = ScannerModel.fromJson(element);
        credentialModelArr.add(model);
        print(model.name);
       });
       saveDataBase(credentialModelArr);
     },onDone:(){
         print("onDone wito");

     },onError: (error) {
         print("onError wito");

       }
     );
    });
  }

  saveDataBase(List<ScannerModel> arrCredential) async {
    arrCredential.forEach((element) {

      print("salvando en DB" + element.name);
    });
  }
}
