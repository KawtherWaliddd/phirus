import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/core/network/api_config.dart';
import 'package:phirus/features/header/domain/data/models/black_list_model.dart';

abstract class DomainReposatory {
  Future<BlackListModel> fetch({required String domain});
}

class DomainReposatoryImpl extends DomainReposatory {
  final ApiClient apiClient;

  DomainReposatoryImpl({required this.apiClient});

  @override
  Future<BlackListModel> fetch({required String domain}) async {
    final data = await apiClient
        .post(url: ApiConfig.blacklist, data: {"domain": domain});
    return BlackListModel.fromJson(data);
  }
}
