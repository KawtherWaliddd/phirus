class WhiosModel {
  final DateTime creationDate;
  final String domainName;
  final String expirationDate;
  final List<String> nameServers;
  final String? organization;
  final String registrar;
  final List<String> status;
  final String updatedDate;

  WhiosModel(
      {required this.creationDate,
      required this.domainName,
      required this.expirationDate,
      required this.nameServers,
      required this.organization,
      required this.registrar,
      required this.status,
      required this.updatedDate});

  factory WhiosModel.fromjson(Map<String, dynamic> json) {
    return WhiosModel(
        creationDate: DateTime.parse(json['creation_date']),
        domainName: json['domain_name'],
        expirationDate: json['expiration_date'],
        nameServers: List<String>.from(json['name_servers']),
        organization: json['organization'],
        registrar: json['registrar'],
        status: List<String>.from(json['status']),
        updatedDate: json['updated_date']);
  }
}
