import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:segurity_anam_app/Credential/repository/credentialDwRepository.dart';
import 'package:segurity_anam_app/Credential/ui/widget/credentialCart.dart';

import '../model/CredentialModel.dart';



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
  Future<List<CredentialCart>> getCredentials() async{

   return await credentialDwRepo.getCredentials();
  }

  Future<bool> deleteCredential() async {
     return await credentialDwRepo.deleteCredentials();

  }


  @override
  void dispose() {
    // TODO: implement dispose
  }

}