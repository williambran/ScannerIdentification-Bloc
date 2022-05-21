import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:segurity_anam_app/User/model/User.dart';

class UserInfoHead extends StatelessWidget{
  UserModel user;

  UserInfoHead({ required this.user}) ;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final userPhoto = Container(
      width: 100.0,
      height: 100.0,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2.0,
          style: BorderStyle.solid
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(user.photoURL!)
        )
      ),
    );
   return Container(
     margin: const EdgeInsets.symmetric(
       vertical: 20.0,
       horizontal: 20.0

     ),
     alignment: Alignment.topCenter,
     child: userPhoto,
   );
  }

}