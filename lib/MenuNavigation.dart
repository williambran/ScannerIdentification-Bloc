
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:segurity_anam_app/Credential/bloc/BlocCredential.dart';
import 'package:segurity_anam_app/Credential/ui/screen/credentialScreen.dart';
import 'package:segurity_anam_app/Scanner/bloc/BlocScanner.dart';
import 'package:segurity_anam_app/Scanner/ui/screens/ScannerScreen.dart';

import 'Scanner/ui/screens/ScannerMenuScreen.dart';
import 'interface/dismitPatther.dart';


class MenuNavigation extends StatefulWidget {

  var qrNavigate = false;

  @override
  createState() => _MenuNavigation();


}


class _MenuNavigation extends State<MenuNavigation> implements DissmitPather {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if(widget.qrNavigate){
      return BlocProvider(
          child: ScannerScreen(dismit: this),
          bloc: BlocScanner());

    }else{
      return menuNavigator();
    }
  }


  Widget menuNavigator(){
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_rounded, color: Color.fromARGB(253, 19, 19, 56),), label:  'Scanner'

        ),
            BottomNavigationBarItem(
                icon: Icon(Icons.vertical_align_bottom, color: Color.fromARGB(253, 19, 19, 56),),label: 'Descarga'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp, color: Color.fromARGB(253, 19, 19, 56),) , label:  'perfil'
            )
          ],
        ), tabBuilder: (BuildContext context, int index) {

        switch(index){
          case 0:
            return CupertinoTabView(
                builder:(BuildContext context) {
                  return BlocProvider<BlocScanner>(
                      child: ScannerMenuScreen(pather: this),
                      bloc: BlocScanner());
                }
            );

          case 1:
            return CupertinoTabView(
                builder:(BuildContext context) {

                  return BlocProvider(
                      child: CredentialScreenMenu(),
                      bloc: BlocCredential()  );
                }
            );
          case 2: return CupertinoTabView(
            builder: (BuildContext context) => ScannerMenuScreen(),
          );
          default:
            return CupertinoTabView(
                builder: (BuildContext context) {

                  return ScannerMenuScreen();
                }
            );
        }
      },

      ),

    );
  }


  @override
  void dissmit() {
    // TODO: implement dissmit
    print("llamado desde la interfaz");
    setState(() {
      widget.qrNavigate = !widget.qrNavigate;
    });

  }

}