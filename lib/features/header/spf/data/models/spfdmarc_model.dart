import 'package:phirus/features/header/spf/data/models/dkim_model.dart';
import 'package:phirus/features/header/spf/data/models/dmark_model.dart';
import 'package:phirus/features/header/spf/data/models/spf_model.dart';

class SpfdmarcModel {
  final DkimModel dkim;
  final DmarkModel dmarc;
  final String domain;
  final SpfModel spf;

  SpfdmarcModel(
      {required this.dkim,
      required this.dmarc,
      required this.domain,
      required this.spf});
  factory SpfdmarcModel.fromJson(Map<String, dynamic> json) {
    return SpfdmarcModel(
      dkim: DkimModel.fromjson(json['dkim']),
      dmarc: DmarkModel.fromJson(json['dmarc']),
      domain: json['domain'],
      spf: SpfModel.fromJson(json['spf']),
    );
  }
}
