import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Red14Moneytext extends StatelessWidget {
  final String text;
  Red14Moneytext({
    super.key,
    required this.text,
  });

  bool isNegative = true;

  String formatNumber(String text) {
    double number = double.parse(text);
    isNegative = number < 0;
    double absoluteNumber = number.abs();
    double roundedNumber = (absoluteNumber * 100).round() / 100;

    String roundedText = roundedNumber.toStringAsFixed(2);
    if (roundedText.endsWith(".00")) {
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
        fontSize: 14.sp,
        color: AppColor.redfont,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
