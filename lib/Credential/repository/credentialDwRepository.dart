

import 'package:segurity_anam_app/Data/FirebaseAuthAPi.dart';
import 'package:segurity_anam_app/Data/FirestoreApi.dart';

import '../../Scanner/model/ScannerModel.dart';

class CredentialDwRepository {

  FirestoreApi _firestoreApi = FirestoreApi();


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
      },onError: (){
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