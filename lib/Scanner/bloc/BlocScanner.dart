import 'dart:async';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:segurity_anam_app/Scanner/repository/scannerRepository.dart';


class BlocScanner implements Bloc{


  final scannerRepository = ScannerRepository();

  StreamController<bool> streamController = StreamController();
  Stream<bool> get status => streamController.stream;



   buscarCredential() {
     streamController.add(true);
  }

   searchId() {
      scannerRepository.consultaRepository();
  }


/*
  final Stream<bool> avalible = ((){
    late final StreamController<bool> controller;
    controller = StreamController<bool>(
      onListen: () async {
        controller.add(true);
      }
    );
    return controller.stream;
  })();*/






  @override
  void dispose() {
    // TODO: implement dispose
  }

}