class DkimModel {
  final String comment;
  final String headerIntegrity;
  final String signingDomain;
  final String status;

  DkimModel(
      {required this.comment,
      required this.headerIntegrity,
      required this.signingDomain,
      required this.status});
  factory DkimModel.fromjson(Map<String, dynamic> json) {
    return DkimModel(
        comment: json['comment'],
        headerIntegrity: json['header_integrity'],
        signingDomain: json['signing_domain'],
        status: json['status']);
  }
}
