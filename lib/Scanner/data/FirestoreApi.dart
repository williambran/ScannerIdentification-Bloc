import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:segurity_anam_app/Scanner/model/ScannerModel.dart';


class FirestoreApi {

  final baseDatos = FirebaseFirestore.instance;

  /*Future<List<ScannerModel>?>*/void consultar() async{

    try{
      baseDatos.collection("credencial").get().then((value) {
        value.docs.forEach((element) {
          print("consultamos algo");
          print(element.data().toString());
        });
      });
     // return [ScannerModel(idCuenta: "idCuenta", name: "name", activo: false)];
    }catch(error){
      print("El error");
      print(error);
      //return null;

    }
  }

}