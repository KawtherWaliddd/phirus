import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/features/body/body/data/result_model.dart';
import 'package:phirus/features/body/url/data/models/check_url.dart';
import 'package:phirus/features/body/url/data/repo/url_repo.dart';
import 'package:phirus/features/body/url/presentation/widgets/url_result_list.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';

class UrlResultScreen extends StatefulWidget {
  const UrlResultScreen({super.key, required this.url});

  final String url;

  @override
  State<UrlResultScreen> createState() => _UrlResultScreenState();
}

class _UrlResultScreenState extends State<UrlResultScreen> {
  late Future<UrlModel> urlData;

  @override
  void initState() {
    super.initState();
    urlData = UrlRepoImpl(apiClient: ApiClient()).fetch(url: widget.url);
  }

  String formatUnixDate(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('dd/MM/yyyy – hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightGrey,
      appBar: ScanduryAppBar(),
      body: FutureBuilder<UrlModel>(
        future: urlData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final data = snapshot.data!;

            final urlDetailsList = [
              ResultModel(title: "Domain", value: data.urlInfo.domain),
              ResultModel(title: "Path", value: data.urlInfo.path),
              ResultModel(title: "Query", value: data.urlInfo.query),
              ResultModel(title: "Scheme", value: data.urlInfo.scheme),
              ResultModel(title: "Port", value: data.urlInfo.port),
              ResultModel(
                title: "Phirus Result",
                value: data.prediction == 0 ? "Harmless" : "Malicious",
              ),
            ];

            final virusTotalList = [
              ResultModel(title: "Type", value: "url"),
              ResultModel(
                  title: "Harmless Count",
                  value: data.virustotalResult.attributes.harmless.toString()),
              ResultModel(
                  title: "Malicious Count",
                  value: data.virustotalResult.attributes.malicious.toString()),
              ResultModel(
                  title: "Suspicious Count",
                  value:
                      data.virustotalResult.attributes.suspicious.toString()),
              ResultModel(
                  title: "Undetected Count",
                  value:
                      data.virustotalResult.attributes.undetected.toString()),
              // ResultModel(
              //     title: "Last Submission Date", value: lastSubmissionDate),
              // ResultModel(title: "Last Analysis Date", value: lastAnalysisDate),
            ];

            final engineMcAfee = [
              ResultModel(title: "Engine", value: "McAfee"),
              ResultModel(title: "Verdict", value: "harmless"),
              ResultModel(title: "Result", value: "Clean"),
            ];

            final engineKaspersky = [
              ResultModel(title: "Engine", value: "Kaspersky"),
              ResultModel(title: "Verdict", value: "harmless"),
              ResultModel(title: "Result", value: "Clean"),
            ];

            return UrlResultList(
              urlDetailsList: urlDetailsList,
              virusTotalList: virusTotalList,
              engineMcAfee: engineMcAfee,
              engineKaspersky: engineKaspersky,
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
