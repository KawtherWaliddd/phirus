import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/utils/constants.dart';
import 'package:phirus/core/shared/checking_widget.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';

class SslScreen extends StatelessWidget {
  SslScreen({
    super.key,
  });
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.backgroundColor,
        appBar: ScanduryAppBar(),
        body: CheckingWidget(
          input: 'Input URL....',
          itemScan: 'Check SSL Certificate',
          navigateToResult: () {
            Navigator.pushNamed(context, sslResultScreen,
                arguments: textEditingController.text);
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) {
            //   return SslResultScreen(
            //     url: textEditingController.text,
            //   );
            // }));
          },
          textEditingController: textEditingController,
        ));
  }
}
