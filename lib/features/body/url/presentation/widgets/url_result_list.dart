import 'package:flutter/material.dart';
import 'package:phirus/features/body/body/data/result_model.dart';
import 'package:phirus/core/shared/card_result.dart';

class UrlResultList extends StatelessWidget {
  const UrlResultList({
    super.key,
    required this.urlDetailsList,
    required this.virusTotalList,
    required this.engineMcAfee,
    required this.engineKaspersky,
  });

  final List<ResultModel> urlDetailsList;
  final List<ResultModel> virusTotalList;
  final List<ResultModel> engineMcAfee;
  final List<ResultModel> engineKaspersky;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        ResultItemWidget(title: "URL", infoList: urlDetailsList),
        ResultItemWidget(title: "Virus Total", infoList: urlDetailsList),
        ResultItemWidget(title: "McAfee", infoList: engineMcAfee),
        ResultItemWidget(title: "Kaspersky", infoList: engineKaspersky),
      ],
    );
  }
}
