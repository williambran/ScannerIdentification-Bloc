


import 'package:cloud_firestore/cloud_firestore.dart';

class CredentialModel{
   int idCuenta;
   String name;
   int activo;
   int? processing;


  CredentialModel({
    required this.idCuenta,
    required this.name,
    required this.activo,
    this.processing
  });

  factory CredentialModel.fromJson( QueryDocumentSnapshot<Map<String, dynamic>> json){


    return CredentialModel(
        idCuenta: json['idCuenta'],
        name: json['nombre'],
        activo: json['activo'],
        processing: json['processing']
    );
  }

  Map<String,dynamic> toMap() {
    return {'idCuenta': idCuenta, 'nombre': name, 'activo':activo,'processing': processing};
  }

}
