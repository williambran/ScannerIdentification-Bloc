


import 'package:firebase_auth/firebase_auth.dart';
import 'package:segurity_anam_app/Data/Network/FirebaseAuthAPi.dart';

class AuhtRepository{
  final _firebaseAuth = FirebaseAuthAPI();

  Future<UserCredential?> signInFirebase() {
    print("Sesiones3");
    return _firebaseAuth.signIn();
  }

  signOut() => _firebaseAuth.signOut();

}