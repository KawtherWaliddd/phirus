class SsltlsModel {
  final String issuedTo;
  final String issuer;
  final String validFrom;
  final String validTo;

  SsltlsModel(
      {required this.issuedTo,
      required this.issuer,
      required this.validFrom,
      required this.validTo});

  factory SsltlsModel.fromJson(Map<String, dynamic> json) {
    return SsltlsModel(
        issuedTo: json['IssuedTo'],
        issuer: json['Issuer'],
        validFrom: json['ValidFrom'],
        validTo: json['ValidTo']);
  }
}
