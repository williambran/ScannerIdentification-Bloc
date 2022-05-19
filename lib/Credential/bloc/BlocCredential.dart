import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:segurity_anam_app/Credential/repository/credentialDwRepository.dart';



class BlocCredential implements Bloc {

  final credentialDwRepo =  CredentialDwRepository();


  downloadDocument (){
    credentialDwRepo.consultaRepository();
  }



  @override
  void dispose() {
    // TODO: implement dispose
  }

}