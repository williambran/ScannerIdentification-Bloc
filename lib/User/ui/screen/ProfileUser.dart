


import 'package:flutter/cupertino.dart';

import '../../../widgets/GradientScreen.dart';
import '../widgets/headerProfile.dart';

class ProfileUser extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        GradientScreen(),
        ListView(
          children: [
            HeaderProfile()
          ],
        )

      ],
    );
  }


}