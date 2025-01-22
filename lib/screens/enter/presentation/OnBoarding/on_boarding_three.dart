import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/enter/presentation/qr_code_page.dart';
import 'package:mainamwal/widgets/font/orange18text%20.dart';
import 'package:mainamwal/widgets/font/white18text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class OnBoardingThree extends StatelessWidget {
  final String image;
  final String text1;
  const OnBoardingThree({
    super.key,
    required this.image,
    required this.text1,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          color: AppColor.appblueGray,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/AS logo white.svg",
                      fit: BoxFit.cover,
                      height: 60.h,
                      width: 60.w,
                    ),
                  ],
                ),
                LottieBuilder.asset(
                  image,
                  height: size.height / 2,
                  width: size.width / 1.5,
                  fit: BoxFit.contain,
                  repeat: false,
                ),
                White18text(text: text1),
                SizedBox(
                  height: 10.h,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Preferences.saveIsFirstTime(false);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const QRCodePage(),
                          ),
                        );
                      },
                      child: Orange18text(text: S.of(context).startusingtheapp),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            color: AppColor.apporange,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
