import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/core/network/api_config.dart';
import 'package:phirus/features/header/spf/data/models/spfdmarc_model.dart';

abstract class SpfDmarcReposatory {
  Future<SpfdmarcModel> fetch({required String domain});
}

class SpfDmarcReposatoryImpl extends SpfDmarcReposatory {
  final ApiClient apiClient;

  SpfDmarcReposatoryImpl({required this.apiClient});
  @override
  Future<SpfdmarcModel> fetch({required String domain}) async {
    final data = await apiClient.post(
      url: ApiConfig.spfdmarc,
      data: {"domain": domain},
    );
    return SpfdmarcModel.fromJson(data);
  }
}
