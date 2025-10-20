import 'package:flutter/material.dart';
import 'package:phirus/features/body/body/data/result_model.dart';
import 'package:phirus/core/shared/card_result.dart';

class SpfResultList extends StatelessWidget {
  const SpfResultList({
    super.key,
    required this.spfInfoList,
    required this.dmarcInfoList,
    required this.dkimInfoList,
  });

  final List<ResultModel> spfInfoList;
  final List<ResultModel> dmarcInfoList;
  final List<ResultModel> dkimInfoList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ResultItemWidget(title: "SPF", infoList: spfInfoList),
        ResultItemWidget(
          title: "DMARC",
          infoList: dmarcInfoList,
        ),
        ResultItemWidget(title: "DKIM", infoList: dkimInfoList),
      ],
    );
  }
}
