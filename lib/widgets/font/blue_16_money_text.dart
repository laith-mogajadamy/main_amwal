import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Blue16Moneytext extends StatelessWidget {
  final String text;
  Blue16Moneytext({
    super.key,
    required this.text,
  });

  bool isNegative = true;

  String formatNumber(String text) {
    double number = double.parse(text);
    isNegative = number < 0;
    double absoluteNumber = number.abs();
    double roundedNumber = (absoluteNumber * 1000).round() / 1000;

    String roundedText = roundedNumber.toStringAsFixed(3);
    if (roundedText.endsWith(".000")) {
      roundedText = roundedText.substring(0, roundedText.indexOf("."));
    }
    String formattedText = roundedText.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => ',',
    );
    if (isNegative) {
      return "($formattedText)";
    } else {
      return formattedText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      formatNumber(text),
      style: GoogleFonts.cairo(
        fontSize: 16.sp,
        color: AppColor.appblueGray,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
