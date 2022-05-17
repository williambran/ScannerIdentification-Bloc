import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:segurity_anam_app/User/repository/AuthRepository.dart';

class UserBloc implements Bloc {


  final _auth_repository = AuhtRepository();

  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get autStatus => streamFirebase;

  Future<UserCredential?> signIn() {
    print("Sesiones2");

    return _auth_repository.signInFirebase();
  }

  signOut() {
    _auth_repository.signOut();
  }

/* Usarlo cuando la funcion no nos obligue a usar Stream
  Future<User?> getAuthStatus(){
    return
  }*/

  @override
  void dispose() {
    // TODO: implement dispose
  }

}