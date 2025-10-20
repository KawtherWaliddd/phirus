import 'dart:io';

import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/features/body/body/data/result_model.dart';
import 'package:phirus/features/header/heder_info/data/model/heder_model.dart';
import 'package:phirus/features/header/heder_info/data/repo/header_repo.dart';
import 'package:phirus/core/shared/card_result.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';

class ResultHeaderInfo extends StatefulWidget {
  const ResultHeaderInfo({super.key, required this.file});
  final File file;

  @override
  State<ResultHeaderInfo> createState() => _ResultHeaderInfoState();
}

class _ResultHeaderInfoState extends State<ResultHeaderInfo> {
  late Future<HederModel> hederData;

  @override
  void initState() {
    super.initState();
    hederData = HeaderRepoImpl(apiClient: ApiClient()).fetch(widget.file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightGrey,
      appBar: ScanduryAppBar(),
      body: FutureBuilder<HederModel>(
        future: hederData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;

            final List<ResultModel> headerInfo = [
              ResultModel(title: "From", value: data.from),
              ResultModel(title: "To", value: data.to),
              ResultModel(title: "Subject", value: data.subject),
              ResultModel(title: "Date", value: _formatDate(data.date)),
              ResultModel(title: "Reply_to", value: data.replyTo),
              ResultModel(title: "Message_id", value: data.messageId),
            ];
            return ResultItemWidget(
              title: 'Header Information',
              infoList: headerInfo,
            );
          } else {
            return const Center(child: Text("No data found."));
          }
        },
      ),
    );
  }

  String _formatDate(String rawDate) {
    try {
      // Parses a date like "Thu, 29 May 2025 13:47:07 -0400"
      final parsedDate = HttpDate.parse(rawDate);

      return '${_getWeekday(parsedDate.weekday)}, '
          '${parsedDate.day.toString().padLeft(2, '0')} '
          '${_getMonth(parsedDate.month)} '
          '${parsedDate.year}';
    } catch (_) {
      return rawDate; // fallback if parsing fails
    }
  }

  String _getWeekday(int weekday) {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekdays[weekday - 1];
  }

  String _getMonth(int month) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month];
  }
}
