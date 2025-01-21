import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20.r,
            color: AppColor.black.withOpacity(0.2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        style: GoogleFonts.cairo(
          fontSize: 16.sp,
          color: AppColor.apptitle,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          filled: true,
          hintText: S.of(context).name,
          hintStyle: GoogleFonts.cairo(
            fontSize: 16.sp,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          fillColor: AppColor.whiteColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              20.r,
            ),
          ),
        ),
      ),
    );
  }
}
