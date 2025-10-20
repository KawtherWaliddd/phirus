import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/core/network/api_config.dart';
import 'package:phirus/features/header/whios/data/models/whios_model.dart';

abstract class WhiosRepository {
  Future<WhiosModel> fetchWhois(String domain);
}

class WhiosRepositoryImpl implements WhiosRepository {
  final ApiClient apiClient;

  WhiosRepositoryImpl(this.apiClient);

  @override
  Future<WhiosModel> fetchWhois(String domain) async {
    final data = await apiClient.post(
      url: ApiConfig.whios,
      data: {"domain": domain},
    );
    return WhiosModel.fromjson(data);
  }
}
