

import 'package:segurity_anam_app/Data/FirebaseAuthAPi.dart';
import 'package:segurity_anam_app/Data/FirestoreApi.dart';
import 'package:sqflite/sqflite.dart';

import '../../Data/DB/dbSqlite.dart';
import '../../Scanner/model/ScannerModel.dart';
import '../model/CredentialModel.dart';

class CredentialDwRepository {

  FirestoreApi _firestoreApi = FirestoreApi();
  //DbSqlite db = DbSqlite();
  Database? miBaseDatos;


  consultaRepository() async {
    print("se en el repo");
    _firestoreApi.consultar().then((credential) {
      credential.listen((data) {
        print("leyende desde el repositorio");
        List<CredentialModel> credentialModelArr = [];
        data.docs.forEach((element) {
          var model = CredentialModel.fromJson(element);
          credentialModelArr.add(model);
          print(model.name);
        });
        insertCredential(credentialModelArr);
        //saveDataBase(credentialModelArr);
      },onDone:(){
        print("onDone wito");
      }
      );
    });
  }

  saveDataBase(List<CredentialModel> arrCredential) async {

    arrCredential.forEach((element) {

      print("salvando en DB" + element.name);
    });
  }


  insertCredential(List<CredentialModel> arrCredentials) async {
    DbSqlite.insertCredentials(arrCredentials);
  }


}