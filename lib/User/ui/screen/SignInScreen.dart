import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:segurity_anam_app/widgets/ButtonCustom.dart';
import 'package:segurity_anam_app/widgets/GradientScreen.dart';

import '../../../MenuNavigation.dart';
import '../../bloc/bloc_user.dart';



class SignInScreen extends StatefulWidget {
  @override
   createState() => _SignInScreen();

}

class _SignInScreen extends State<SignInScreen> {
  UserBloc? userBloc;


  @override
  Widget build(BuildContext context)  {
    userBloc = BlocProvider.of(context);
    return _handlerSession();
  }


  Widget _handlerSession(){
    return StreamBuilder(
        stream: userBloc?.autStatus,
        builder: (BuildContext contex, AsyncSnapshot snapshot){
          if(snapshot.hasData && snapshot.error == null){
            return MenuNavigation();
          }else{
            return signIn();
          }

        }
    );
  }



  Widget signIn(){
    return Scaffold(
      
      body: Stack(
       // alignment: Alignment.center,
        children: [
          GradientScreen(),
          Container(

            padding: EdgeInsets.only(top: 180.0,left: 20.0,right: 20.0),
            child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(

                  children:  [
                    Image.asset('assets/icon/unamIcon.png',width: 100.0,height: 100,),
                    const Text("Vigilancia \n UnamApp",
                      style: TextStyle(
                        fontSize: 39.0,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
                const Text("Para continuar inicie sesion ",
                  style: TextStyle(
                    fontSize: 23.0,
                    fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),

                ),
                const Text("con su cuenta institucional",
                  style: TextStyle(
                      fontSize: 19.0,
                      fontFamily: "Lato",
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold
                  ),

                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 200.0),
                  child: ButtonCustom(title: "Login con Google",
                    imagePath: 'assets/icon/icon_google.png',
                    onPressed: () {
                    print("Se preciono login");
                    userBloc!.signOut();
                    userBloc!.signIn();
                    },
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }

}
