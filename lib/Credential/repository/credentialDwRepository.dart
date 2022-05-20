

import 'package:segurity_anam_app/Credential/ui/widget/credentialCart.dart';
import 'package:segurity_anam_app/Data/Network/FirebaseAuthAPi.dart';
import 'package:segurity_anam_app/Data/Network/FirestoreApi.dart';
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



  insertCredential(List<CredentialModel> arrCredentials) async {
    DbSqlite.insertCredentials(arrCredentials);
  }


  //Fatal, pero bueno se hace lo que se puede
  Future<List<CredentialCart>> getCredentials() async {
    List<CredentialCart> credentials = <CredentialCart>[];
    await DbSqlite.getCredentials().then((value) {
      value.forEach((element) {
        credentials.add(CredentialCart(
          credentialModel: (CredentialModel(
            name: element.name,
            activo: element.activo,
            idCuenta: element.idCuenta,
            processing: element.processing
          )),
        ));
      });
    });
    print("Desdel repositoryio");
    print(credentials.length);
   return credentials;
  }


  Future<bool> deleteCredentials () async {
    bool sera = false;
      await DbSqlite.deleteCredentials().then((value) {
        if(value > 0){
          print("Se eliminaron registro repo");
          sera=  true;
        }else {
          print("no se  eliminaron registro");
          sera = false;
        }
      });
      return sera;

  }

}