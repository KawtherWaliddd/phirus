import 'package:flutter/material.dart';
import 'package:phirus/features/body/body/data/result_model.dart';
import 'package:phirus/core/shared/card_result.dart';

class AttachmentResultBody extends StatelessWidget {
  const AttachmentResultBody({
    super.key,
    required this.attachmentList,
  });
  final List<ResultModel> attachmentList;

  @override
  Widget build(BuildContext context) {
    return ResultItemWidget(
      title: 'Attachment',
      infoList: attachmentList,
    );
  }
}
