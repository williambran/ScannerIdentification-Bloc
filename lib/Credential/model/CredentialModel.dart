


class CredentialModel{
  final String idCuenta;
  final String name;
  final bool activo;
  final bool? processing;


  CredentialModel({
    required this.idCuenta,
    required this.name,
    required this.activo,
    this.processing
  });

}
