import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class White18text extends StatelessWidget {
  final String text;
  const White18text({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: GoogleFonts.cairo(
        fontSize: 18.sp,
        color: AppColor.whiteColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
