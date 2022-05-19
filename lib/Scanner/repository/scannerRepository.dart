import 'package:segurity_anam_app/Scanner/model/ScannerModel.dart';
import '../data/FirestoreApi.dart';

class ScannerRepository {

 final _firestoreApi = FirestoreApi();

  consultaRepository() {
 _firestoreApi.consultar();
}
}