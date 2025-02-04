import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/enter/presentation/qr_code_scan.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class QRCodePage extends StatelessWidget {
  const QRCodePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: AppColor.whiteColorBG,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/svg/AS logo black.svg",
                    fit: BoxFit.cover,
                    height: 60.h,
                    width: 60.w,
                  ),
                ],
              ),
              LottieBuilder.asset(
                'assets/lottie/qrcodeblue.json',
                height: size.height / 2,
                width: size.width / 2,
                fit: BoxFit.contain,
              ),
              AppText(
                text: "قم بمسح QR Code من شاشة الحاسوب من أجل الربط مع المؤسسة",
                color: AppColor.apptitle,
                fontSize: 18,
              ),
              SizedBox(
                height: 10.h,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const QRCodeScannerPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width / 1.2, size.height / 18),
                  backgroundColor: AppColor.appblueGray,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColor.appblueGray),
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                  ),
                ),
                child: Text(
                  S.of(context).turnonthecameraandscan,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
