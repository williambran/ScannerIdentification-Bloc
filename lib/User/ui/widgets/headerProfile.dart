
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:segurity_anam_app/User/bloc/bloc_user.dart';
import 'package:segurity_anam_app/User/model/User.dart';
import 'package:segurity_anam_app/User/ui/widgets/UserInfoBody.dart';
import 'package:segurity_anam_app/User/ui/widgets/UserInfoHead.dart';



class HeaderProfile extends StatelessWidget {
  UserBloc? userBloc;
  UserModel?  user;



  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return StreamBuilder(stream: userBloc?.streamFirebase ,builder: (BuildContext context ,AsyncSnapshot snapshot){
      switch (snapshot.connectionState){
        case ConnectionState.waiting: {
          return CircularProgressIndicator();
        }
        case ConnectionState.none: {
          return CircularProgressIndicator();
        }
        case ConnectionState.active :{
          return showProfileHeader(snapshot);
        }
        case ConnectionState.done : {
          return showProfileHeader(snapshot);
        }

      }

    });

  }



  Widget showProfileHeader (AsyncSnapshot asyncSnapshot){

    if(asyncSnapshot.hasData && !asyncSnapshot.hasError){
      user = UserModel(name: asyncSnapshot.data.displayName,email: asyncSnapshot.data.email,uid: asyncSnapshot.data.uid,photoURL: asyncSnapshot.data.photoURL);
      return Container(
        margin: const EdgeInsets.only(left: 20.0,top: 50.0,right: 20.0),
        child: Stack(

          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Text("Perfil",style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 100),
                child: UserInfoBody(user: user!,)),
            Container(
              padding: EdgeInsets.only(top: 50),
                child: UserInfoHead(user: user!,)),

          ],
        ),
      );
    }else {
      return Container(

      );
    }

  }

}