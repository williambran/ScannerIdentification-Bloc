


import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential?> signIn() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSignInA = await googleSignInAccount!.authentication;

    UserCredential user = await _auth.signInWithCredential(
      GoogleAuthProvider.credential(idToken: gSignInA.idToken, accessToken: gSignInA.accessToken)
    );
    print("Sesiones4");
    return user;
  }

  signOut() async {
    await _auth.signOut().then((onValue) => print("Sesión cerrada"));
    googleSignIn.signOut();
    print("Sesiones cerradas");
  }

}