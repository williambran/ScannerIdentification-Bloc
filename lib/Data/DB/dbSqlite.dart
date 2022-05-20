import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../Credential/model/CredentialModel.dart';



class DbSqlite {


  static final DbSqlite _db = DbSqlite();
  static DbSqlite get instance => _db;

  static Database? miBaseDatos;

  //Pather Desing Singleton
  Future<Database?> get create async{
    if(miBaseDatos == null)  {
      return crearBaseDatos();
    }else {
      print("uso de db");
      return miBaseDatos;
    }
  }

    Future<Database?> crearBaseDatos() async {
     print("creacio db");
    WidgetsFlutterBinding.ensureInitialized();

    var ruta = await getDatabasesPath();
    String rutaCompleta = join(ruta,'vigilancia.db');

    Database baseDatos = await openDatabase(
        rutaCompleta,
        version: 1,
        onCreate: (Database db,int version) async {
           db.execute('CREATE TABLE credential(idCuenta INTEGER, nombre TEXT, activo INTEGER,processing INTEGER)');
        }
    );
     miBaseDatos = baseDatos ;
    return  miBaseDatos;
    /*miBaseDatos =  baseDatos;
    print("Mibase");
    print(miBaseDatos?.path);*/
  }


/*
  insert() async{
    print("antes de meter"+ miBaseDatos!.path);
    miBaseDatos.rawInsert("INSERT INTO credential(idCuenta,nombre,activo,processing) VALUES(419107480,'william',1,0) ").then((value) {
      print("el valor al insertar $value");
    });
  }*/

  static Future<void> insertCredentials1(List<CredentialModel> arrCredentials) async {
  //  deleteCredentials();
    Database? database = await DbSqlite.instance.create;
    arrCredentials.forEach((element) {
      print("${element.idCuenta}, ${element.name},${element.processing},${element.activo}");
      database?.rawInsert("INSERT INTO credential(idCuenta,nombre,activo,processing) VALUES(2132,'william',2,1)" ).then((value) {
        print("el valor al insertar $value");
      });
    });
    return ;
  }
  static Future<void> insertCredentials(List<CredentialModel> arrCredentials) async {
      deleteCredentials();

    Database? database = await DbSqlite.instance.create;
    arrCredentials.forEach((element) {
      print("${element.idCuenta}, ${element.name},${element.processing},${element.activo}");
      database?.insert("credential", element.toMap()).then((value) {
        print("el valor al insertar $value");
      });
    });

    return ;
  }

  static Future<int> deleteCredentials() async {
    Database? database = await DbSqlite.instance.create;
    return database!.rawInsert("DELETE FROM credential" );


  }


  static Future<List<CredentialModel>> getCredentials() async{
    Database? database = await DbSqlite.instance.create;
    final List<Map<String, dynamic>> credentials = await database!.query("credential");


     return  List.generate(
          credentials.length,
              (i) => CredentialModel(
                  idCuenta: credentials[i]['idCuenta'],
                  name: credentials[i]['nombre'],
                  activo:credentials[i]['activo'],
                  processing: credentials[i]['processing']
              ));
  }



}





