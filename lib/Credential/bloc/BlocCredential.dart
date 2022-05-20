import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:segurity_anam_app/Credential/repository/credentialDwRepository.dart';



class BlocCredential implements Bloc {

  final credentialDwRepo =  CredentialDwRepository();


  downloadDocument (){
    print("se en el block");
    credentialDwRepo.consultaRepository();
  }
/*
  insert(){
    print("pasamos bloc");
    credentialDwRepo.insertCredential();
  }*/


  @override
  void dispose() {
    // TODO: implement dispose
  }

}