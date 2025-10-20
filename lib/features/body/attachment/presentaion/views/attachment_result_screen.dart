import 'dart:io';
import 'package:flutter/material.dart';
import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/features/body/attachment/data/models/check_checkattach_model.dart';
import 'package:phirus/features/body/attachment/data/repo/attachment_repo.dart';
import 'package:phirus/features/body/body/data/result_model.dart';
import 'package:phirus/features/body/attachment/presentaion/widgets/attachment_result_body.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';

class AttachmentResultScreen extends StatefulWidget {
  const AttachmentResultScreen({
    super.key,
    required this.file,
  });
  final File file;

  @override
  State<AttachmentResultScreen> createState() => _AttachmentResultScreenState();
}

class _AttachmentResultScreenState extends State<AttachmentResultScreen> {
  late Future<AttachmentModel> attachmentData;

  @override
  void initState() {
    super.initState();
    attachmentData =
        AttachmentRepoImpl(apiClient: ApiClient()).fetch(widget.file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScanduryAppBar(),
      body: FutureBuilder<AttachmentModel>(
        future: attachmentData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            List<ResultModel> attachmentList = [
              ResultModel(
                title: "file_id",
                value: data.fileId,
              ),
              ResultModel(
                title: "malicious",
                value: data.malicious.toString(),
              ),
              ResultModel(
                title: "undetected",
                value: data.undetected.toString(),
              ),
            ];
            return AttachmentResultBody(
              attachmentList: attachmentList,
            );
          }
          return Center(
            child: Text('No Data found.'),
          );
        },
      ),
    );
  }
}
