import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/widgets/boxdecoration.dart';
import 'package:mainamwal/widgets/font/app_text.dart'; // Import AppText
import 'package:mainamwal/widgets/font/money_text.dart'; // Import MoneyText
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgetCardColumn extends StatelessWidget {
  const AgetCardColumn({
    super.key,
    required this.text1,
    required this.text2,
  });

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: text1,
          color: AppColor.appbuleBG,
          fontSize: 16,
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: size.width / 3.5,
          height: size.height / 20,
          decoration: boxdecoration1(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: FittedBox(
              child: MoneyText(
                text: text2,
                color: AppColor.appbuleBG,
                fontSize: 14,
                disimalnumber: 3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
