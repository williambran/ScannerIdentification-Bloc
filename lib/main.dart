import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:segurity_anam_app/User/bloc/bloc_user.dart';

import 'User/ui/screen/SignInScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(Tep());
    });
}

final baseDatos = FirebaseFirestore.instance;

// final var baseDatos = FirebaseFirestore.instance;

class Tep extends StatefulWidget {

  @override
  createState() => Estado();
}

class Estado extends State<Tep> {




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
        child: MaterialApp(
            title: "Seguridad unam",
            home: SignInScreen()),
        bloc: UserBloc());
  }

/*
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Servicios en la nube"),),
      body: Column(
        children: [
          ElevatedButton( child: Text("Insertar"),
              onPressed: (){
                insertar();
              }),
          ElevatedButton( child: Text("Eliminar"),
              onPressed: (){
                eliminar();
              }),
          ElevatedButton( child: Text("Actualizar"),
              onPressed: (){
                actualizar();
              }),
          ElevatedButton( child: Text("Consultar"),
              onPressed: (){
                consultar();
              })
        ],
      ),
    ),

  );*/

}







void insertar() async{
  
  try{
    baseDatos.collection("credencial")
        .doc("1")
        .set(
        {
          "habilitado":true,
          "id": "nuevoid",
          "nombre": "William"

        }

    );
  }catch(error){
    print("El error");
    print(error);
  }
}


void eliminar() async{

  try{
    baseDatos.collection("credencial")
        .doc("1")
        .delete();
  }catch(error){
    print("El error");
    print(error);
  }
}




void actualizar() async{

  try{
    baseDatos.collection("credencial")
        .doc("1")
        .update(
        {
          "habilitado":true,
          "id": "nuevoid",
          "nombre": "Brando"

        }

    );
  }catch(error){
    print("El error");
    print(error);
  }
}


void consultar() async{

  try{
    baseDatos.collection("credencial").get().then((value) {
      value.docs.forEach((element) {
        print("consultamos algo");
        print(element.data);
      });
    });
  }catch(error){
    print("El error");
    print(error);
  }
}