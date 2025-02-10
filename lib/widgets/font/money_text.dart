import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MoneyText extends StatelessWidget {
  final String text;
  final Color color;
  final int fontSize;
  final int disimalnumber;

  const MoneyText({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.disimalnumber,
  });

  String formatNumber(String text, int disimalnumber) {
    double number = double.parse(text);
    bool isNegative = number < 0; // Local variable instead of global
    double absoluteNumber = number.abs();

    // Round to the required decimal places
    String roundedText = absoluteNumber.toStringAsFixed(disimalnumber);

    // Remove unnecessary trailing zeros
    roundedText = roundedText.replaceAll(RegExp(r'(\.0+|(?<=\.\d)0+)$'), '');

    // Split integer and decimal parts
    List<String> parts = roundedText.split('.');
    String integerPart = parts[0].replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => ',',
    );

    // Recombine integer and decimal parts
    String formattedText =
        parts.length > 1 ? "$integerPart.${parts[1]}" : integerPart;

    return isNegative ? "($formattedText)" : formattedText;
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
