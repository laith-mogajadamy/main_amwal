import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/core/utils/appcolors.dart';

BoxDecoration boxdecoration1() {
  return BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 10,
      ),
    ],
    borderRadius: BorderRadius.circular(15.r),
  );
}

BoxDecoration boxdecoration2() {
  return BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: AppColor.black.withOpacity(0.1),
        blurRadius: 10,
      ),
    ],
    borderRadius: BorderRadius.circular(15.r),
  );
}
