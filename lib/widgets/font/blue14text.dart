import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Blue14text extends StatelessWidget {
  final String text;
  const Blue14text({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: GoogleFonts.cairo(
        fontSize: 14.sp,
        color: AppColor.appblueGray,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
