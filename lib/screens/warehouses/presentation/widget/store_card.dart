import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/model/warehouses/warehouses.dart';
import 'package:mainamwal/widgets/boxdecoration.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:mainamwal/widgets/font/money_text.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({
    super.key,
    required this.warehouse,
  });

  final Warehouses warehouse;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: boxdecoration2(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            fit: BoxFit.cover,
            "assets/svg/warehouse orange svg.svg",
          ),
          AppText(
            text: warehouse.storeName,
            color: AppColor.appbuleBG,
            fontSize: 16,
          ),
          MoneyText(
            text: warehouse.cost,
            color: AppColor.apporange,
            fontSize: 16,
            disimalnumber: 3,
          ),
        ],
      ),
    );
  }
}
