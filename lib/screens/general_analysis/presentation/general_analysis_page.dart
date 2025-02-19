import 'package:flutter/material.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class GeneralAnalysisPage extends StatelessWidget {
  final String title;

  const GeneralAnalysisPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appbuleBG,
        title: AppText(
          text: title,
          color: AppColor.whiteColor,
          fontSize: 18,
        ),
      ),
      body: Container(),
    );
  }
}
