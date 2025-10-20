import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/core/network/api_config.dart';
import 'package:phirus/features/body/url/data/models/check_url.dart';

abstract class UrlRepo {
  Future<UrlModel> fetch({required String url});
}

class UrlRepoImpl extends UrlRepo {
  final ApiClient apiClient;

  UrlRepoImpl({required this.apiClient});

  @override
  Future<UrlModel> fetch({required String url}) async {
    final urlData = await apiClient.post(
      url: ApiConfig.urlcheck,
      data: {
        "url": url,
      },
    );
    return UrlModel.fromJson(urlData);
  }
}
