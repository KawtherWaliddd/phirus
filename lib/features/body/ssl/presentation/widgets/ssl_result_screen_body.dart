import 'package:flutter/material.dart';
import 'package:phirus/features/body/body/data/result_model.dart';
import 'package:phirus/core/shared/card_result.dart';

class SslResultScreenBody extends StatelessWidget {
  const SslResultScreenBody({
    super.key,
    required this.sslResult,
  });

  final List<ResultModel> sslResult;

  @override
  Widget build(BuildContext context) {
    return ResultItemWidget(
      infoList: sslResult,
      title: 'SSL Certificate',
    );
  }
}