


class ScannerModel{
  final String idCuenta;
  final String name;
  final bool activo;
  final bool? tramitando;



  ScannerModel({
    required this.idCuenta,
    required this.name,
    required this.activo,
    this.tramitando
});
}