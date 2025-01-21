import 'package:mainamwal/widgets/boxdecoration.dart';
import 'package:mainamwal/widgets/font/black14text.dart';
import 'package:mainamwal/widgets/font/black_14_money_text.dart';
import 'package:mainamwal/widgets/font/blue16text.dart';
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
        Blue16text(text: text1),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: size.width / 3.5,
          height: size.height / 20,
          decoration: boxdecoration1(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: FittedBox(child: Black14Moneytext(text: text2)),
          ),
        ),
      ],
    );
  }
}
