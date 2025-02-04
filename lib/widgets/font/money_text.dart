import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MoneyText extends StatelessWidget {
  final String text;
  final Color color;
  final int fontSize;
  final int disimalnumber;

  MoneyText({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.disimalnumber,
  });

  bool isNegative = true;

  String formatNumber(
    String text,
    int disimalnumber,
  ) {
    int x = 10 ^ disimalnumber;
    String y = '.'.padLeft(disimalnumber, '0');
    double number = double.parse(text);
    isNegative = number < 0;
    double absoluteNumber = number.abs();
    double roundedNumber = (absoluteNumber * x).round() / x;

    String roundedText = roundedNumber.toStringAsFixed(disimalnumber);
    if (roundedText.endsWith(y)) {
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
      formatNumber(text, disimalnumber),
      style: GoogleFonts.cairo(
        fontSize: fontSize.sp,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
