
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Scanner/ui/screens/ScannerScreen.dart';



class MenuNavigation extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.vertical_align_bottom, color: Color.fromARGB(253, 19, 19, 56),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card_rounded, color: Color.fromARGB(253, 19, 19, 56),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp, color: Color.fromARGB(253, 19, 19, 56),)
            )
          ],
        ), tabBuilder: (BuildContext context, int index) {
          switch(index){
            case 0: return CupertinoTabView(
              builder:(BuildContext context) => ScannerScreen()
            );
            case 1: return CupertinoTabView(
              builder:(BuildContext context) => ScannerScreen(),
            );
            case 2: return CupertinoTabView(
              builder: (BuildContext context) => ScannerScreen(),
            );
            default:
              return CupertinoTabView(
                  builder: (BuildContext context) {
                    return ScannerScreen();
                  }
              );

          }
      },

      ),

    );
  }

}