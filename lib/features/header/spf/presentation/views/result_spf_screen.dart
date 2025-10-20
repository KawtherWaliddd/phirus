import 'package:flutter/material.dart';

import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/features/body/body/data/result_model.dart';
import 'package:phirus/features/header/spf/data/models/spfdmarc_model.dart';
import 'package:phirus/features/header/spf/data/repo/spf_dmarc.dart';
import 'package:phirus/features/header/spf/presentation/widgets/spf_result_list.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';

class ResultSpfScreen extends StatefulWidget {
  const ResultSpfScreen({super.key, required this.domain});
  final String domain;

  @override
  State<ResultSpfScreen> createState() => _ResultSpfScreenState();
}

class _ResultSpfScreenState extends State<ResultSpfScreen> {
  late Future<SpfdmarcModel> spfDmarcData;
  @override
  void initState() {
    spfDmarcData = SpfDmarcReposatoryImpl(apiClient: ApiClient())
        .fetch(domain: widget.domain);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.lightGrey,
        appBar: ScanduryAppBar(),
        body: FutureBuilder(
            future: spfDmarcData,
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.hasData) {
                final List<ResultModel> spfInfoList = [
                  ResultModel(
                    title: "Status",
                    value: asyncSnapshot.data!.spf.status,
                  ),
                  ResultModel(
                    title: "Comment",
                    value: asyncSnapshot.data!.spf.comment,
                  )
                ];
                final List<ResultModel> dmarcInfoList = [
                  ResultModel(
                    title: "Status",
                    value: asyncSnapshot.data!.dmarc.status,
                  ),
                  ResultModel(
                    title: "Comment",
                    value: asyncSnapshot.data!.dmarc.comment,
                  )
                ];
                final List<ResultModel> dkimInfoList = [
                  ResultModel(
                    title: "Status",
                    value: asyncSnapshot.data!.dkim.status,
                  ),
                  ResultModel(
                    title: "Comment",
                    value: asyncSnapshot.data!.dkim.comment,
                  )
                ];
                return SpfResultList(
                  spfInfoList: spfInfoList,
                  dmarcInfoList: dmarcInfoList,
                  dkimInfoList: dkimInfoList,
                );
              } else if (asyncSnapshot.hasError) {
                return Center(
                  child: Text(asyncSnapshot.error.toString()),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
