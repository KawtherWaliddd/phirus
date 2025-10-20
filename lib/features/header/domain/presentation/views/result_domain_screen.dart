import 'package:flutter/material.dart';

import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/features/body/body/data/result_model.dart';
import 'package:phirus/features/header/domain/data/models/black_list_model.dart';
import 'package:phirus/features/header/domain/data/repo/domain_reposatory.dart';
import 'package:phirus/core/shared/card_result.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';

class ResultDomainScreen extends StatefulWidget {
  const ResultDomainScreen({super.key, required this.domain});
  final String domain;

  @override
  State<ResultDomainScreen> createState() => _ResultDomainScreenState();
}

class _ResultDomainScreenState extends State<ResultDomainScreen> {
  late Future<BlackListModel> domainData;
  @override
  void initState() {
    domainData = DomainReposatoryImpl(apiClient: ApiClient())
        .fetch(domain: widget.domain);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightGrey,
      appBar: ScanduryAppBar(),
      body: FutureBuilder(
          future: domainData,
          builder: (context, sanapshot) {
            if (sanapshot.hasData) {
              final List<ResultModel> domainInfo = [
                ResultModel(title: "domain", value: sanapshot.data!.domain),
                ResultModel(
                    title: "malicious_votes",
                    value: sanapshot.data!.maliciousVotes.toString()),
                ResultModel(
                  title: "suspicious_votes",
                  value: sanapshot.data!.suspiciousVotes.toString(),
                ),
                ResultModel(
                  title: "status",
                  value: sanapshot.data!.status,
                )
              ];
              return ResultItemWidget(
                title: 'Domain',
                infoList: domainInfo,
              );
            } else if (sanapshot.hasError) {
              return Center(
                child: Text(sanapshot.error.toString()),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
