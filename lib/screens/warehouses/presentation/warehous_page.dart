import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/warehouses/data/warehouses_reqwest.dart';
import 'package:mainamwal/widgets/boxdecoration.dart';
import 'package:mainamwal/widgets/font/blue16text.dart';
import 'package:mainamwal/widgets/font/orange_16_money_text.dart';
import 'package:mainamwal/widgets/font/white16text.dart';
import 'package:mainamwal/widgets/font/white18text.dart';

class WarehousPage extends StatelessWidget {
  const WarehousPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.whiteColorBG,
      appBar: AppBar(
        backgroundColor: AppColor.appbuleBG,
        title: White18text(
          text: S.of(context).warehouse,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                fixedSize: Size(size.width / 3, size.height / 20),
                backgroundColor: AppColor.apporange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              child: White18text(text: S.of(context).searchforitem),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          fixedSize: Size(size.width / 2.5, size.height / 20),
          backgroundColor: AppColor.appbuleBG,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search_rounded,
              color: AppColor.whiteColor,
            ),
            SizedBox(
              width: 3,
            ),
            White16text(text: S.of(context).searchforitem),
          ],
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: AppColor.whiteColor,
        color: AppColor.appbuleBG,
        strokeWidth: 3.w,
        onRefresh: () async {
          WarehousesReqwest.getWarehouses('');
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
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
                    Blue16text(text: S.of(context).warehouse),
                    Orange16Moneytext(text: "55992114")
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
