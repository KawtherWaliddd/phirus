import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/core/network/api_config.dart';
import 'package:phirus/features/body/ssl/data/models/ssltls_model.dart';

abstract class SslRepo {
  Future<SsltlsModel> fetch({required String url});
}

class SslRepoImpl extends SslRepo {
  final ApiClient apiClient;

  SslRepoImpl({required this.apiClient});
  @override
  Future<SsltlsModel> fetch({required String url}) async {
    final sslData = await apiClient.post(
      url: ApiConfig.ssltls,
      data: {
        "url": url,
      },
    );
    return SsltlsModel.fromJson(sslData);
  }
}
