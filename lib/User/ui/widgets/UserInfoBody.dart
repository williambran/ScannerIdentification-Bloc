

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:segurity_anam_app/widgets/ButtonCustom.dart';
import 'package:segurity_anam_app/widgets/ButtonWithoutCallback.dart';

import '../../bloc/bloc_user.dart';
import '../../model/User.dart';

class UserInfoBody extends StatelessWidget{

  UserModel user;
  UserBloc? userBloc;

  UserInfoBody({ required this.user}) ;


  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    double screenWidth = MediaQuery.of(context).size.width;

    final body = Container(
      alignment: Alignment.topCenter,
      width: screenWidth *0.90,
      height: 320,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(17.0) ),
        color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(" ${user.name}",
              style: TextStyle(
                 color: Colors.black,
                 fontWeight: FontWeight.bold,
                  fontSize: 25.0,
              ),
            ),
          ),

          Container(
            alignment: Alignment.center,

            child: Text(" ${user.email}",
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),),
          ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20.0),
          child: Text("Zona entrada rancho",
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 19.0,
            ),),
        ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20.0),
            child: ButtonWithoutCallback(title: "Vigitante")
          ),
          Container(

              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 46.0),
              child: GestureDetector(
                child: Text("Cerrar sesión"),
                onTap: () {
                  userBloc?.signOut();
                },

              )
          )


        ],
      ),
    );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
      child: body,
    );
  }

}