import 'package:flutter/material.dart';
import 'package:phirus/features/body/body/data/result_model.dart';
import 'package:phirus/features/header/whios/data/models/whios_model.dart';
import 'package:phirus/features/header/whios/data/repo/whios_repo.dart';
import 'package:phirus/core/shared/card_result.dart';
import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';

class ResultWhiosScreen extends StatefulWidget {
  final String domain;

  const ResultWhiosScreen({super.key, required this.domain});

  @override
  State<ResultWhiosScreen> createState() => _ResultWhiosScreenState();
}

class _ResultWhiosScreenState extends State<ResultWhiosScreen> {
  late Future<WhiosModel> whiosData;

  @override
  void initState() {
    super.initState();
    whiosData = WhiosRepositoryImpl(ApiClient()).fetchWhois(widget.domain);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScanduryAppBar(),
      body: FutureBuilder<WhiosModel>(
        future: whiosData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final model = snapshot.data!;
          final results = [
            ResultModel(title: 'Domain', value: model.domainName),
            ResultModel(
                title: 'Created At', value: model.creationDate.timeZoneName),
            ResultModel(title: 'Updated At', value: model.updatedDate),
            ResultModel(title: 'Expiration Date', value: model.expirationDate),
            ResultModel(title: 'Registrar', value: model.registrar),
            ResultModel(
                title: 'Organization',
                value: model.organization ?? "No't avilable"),
            ResultModel(
                title: 'Name Servers', value: model.nameServers.join(', ')),
            ResultModel(title: 'Status', value: model.status.join(', ')),
          ];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ListView(
              children: [
                ResultItemWidget(title: "Whois Information", infoList: results),
              ],
            ),
          );
        },
      ),
    );
  }
}
