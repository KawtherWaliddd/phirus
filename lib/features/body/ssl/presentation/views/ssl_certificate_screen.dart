import 'package:flutter/material.dart';
import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/features/body/body/data/result_model.dart';
import 'package:phirus/features/body/ssl/data/models/ssltls_model.dart';
import 'package:phirus/features/body/ssl/data/repo/ssl_repo.dart';
import 'package:phirus/features/body/ssl/presentation/widgets/ssl_result_screen_body.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';

class SslResultScreen extends StatefulWidget {
  const SslResultScreen({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<SslResultScreen> createState() => _SslResultScreenState();
}

class _SslResultScreenState extends State<SslResultScreen> {
  late Future<SsltlsModel> sslData;
  @override
  void initState() {
    sslData = SslRepoImpl(apiClient: ApiClient()).fetch(url: widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScanduryAppBar(),
      body: FutureBuilder(
          future: sslData,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              final List<ResultModel> sslResult = [
                ResultModel(
                  title: "IssuedTo",
                  value: snapshot.data!.issuedTo,
                ),
                ResultModel(
                  title: "Issuer",
                  value: snapshot.data!.issuer,
                ),
                ResultModel(
                  title: "ValidFrom",
                  value: snapshot.data!.validFrom,
                ),
                ResultModel(
                  title: "ValidTo",
                  value: snapshot.data!.validTo,
                ),
              ];
              return SslResultScreenBody(sslResult: sslResult);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
