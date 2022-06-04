import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ScannerModel{
  final String idCuenta;
  final String name;
  final bool activo;
  final bool? tramitando;



  ScannerModel({
    required this.idCuenta,
    required this.name,
    required this.activo,
    this.tramitando
});

  factory ScannerModel.fromJson( QueryDocumentSnapshot<Map<String, dynamic>> json){


    return ScannerModel(
      idCuenta: json['idCuenta'],
      name: json['nombre'],
      activo: json['activo'],
      tramitando: json['processing']
    );
  }
}