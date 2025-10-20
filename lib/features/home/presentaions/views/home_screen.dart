import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/utils/constants.dart';
import 'package:phirus/features/home/presentaions/widgets/home_body.dart';
import 'package:phirus/core/shared/main_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String? selectedItem;

  void onItemSelected(String text) {
    setState(() {
      selectedItem = text;
    });
  }

  void navigateToSelectedScreen() {
    if (selectedItem == "Header") {
      Navigator.pushNamed(context, headerAnalysisScreen);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const HeaderAnalysisScreen()),
      // );
    } else if (selectedItem == "Body") {
      Navigator.pushNamed(context, bodyAnalysisScreen);

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const BodyAnalysisScreen()),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: MainAppBar(
        selectedItem: selectedItem,
        onNextPressed: navigateToSelectedScreen,
        isHomePage: true,
      ),
      body: HomeBody(
        selectedItem: selectedItem,
        onItemSelected: onItemSelected,
      ),
    );
  }
}
