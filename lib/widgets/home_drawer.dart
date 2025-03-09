import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/widgets/change_the_language.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:mainamwal/widgets/logout_button.dart';
import 'package:mainamwal/widgets/virsion_check_button.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.size,
  });

  final Size size;
  static const double virsion = 1.0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.whiteColorBG,
      width: size.width / 1.5,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: size.width / 2,
                  height: size.height / 5,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/OB 2 image.png"),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ChangeTheLaguague(),
                SizedBox(
                  height: size.height / 5,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Virsioncheckbutton(),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                LogoutButoon(),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: "${S.of(context).version}: 0.4.9",
                      color: AppColor.apptitle,
                      fontSize: 16,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10),
                  child: SvgPicture.asset(
                    "assets/svg/as horizantel logo.svg",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
