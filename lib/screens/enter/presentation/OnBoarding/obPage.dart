import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/screens/enter/presentation/Auth/login.dart';
import 'package:mainamwal/screens/enter/presentation/OnBoarding/on_boarding_one.dart';
import 'package:mainamwal/screens/enter/presentation/OnBoarding/on_boarding_three.dart';
import 'package:mainamwal/screens/enter/presentation/OnBoarding/on_boarding_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OBPage extends StatefulWidget {
  const OBPage({super.key});

  @override
  State<OBPage> createState() => _OBPageState();
}

class _OBPageState extends State<OBPage> {
  final controller = LiquidController();

  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    final pages = [
      const OnBoardingOne(
        image: "assets/lottie/Calendar.json",
        text1:
            "استعلام الحركات اليومية المحاسبية للمنشآت المختلفة النشاط، سواء كانت صناعية أو تجارية. ",
      ),
      const OnBoardingTwo(
        image: "assets/lottie/business-investor.json",
        text1:
            "استعراض تقارير الحسابات العامة والزبائن والموردين وحركة المواد والتصنيع في المخازن.",
      ),
      const OnBoardingThree(
        image: "assets/lottie/amwal2New.json",
        text1: "مع تطبيق أموال، تستطيع تتبع أعمالك بسهولة واحترافية. ",
      ),
    ];

    return Scaffold(
      backgroundColor: (controller.currentPage == 1)
          ? AppColor.whiteColorBG
          : AppColor.appblueGray,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: LiquidSwipe(
              initialPage: 0,
              enableLoop: false,
              liquidController: controller,
              onPageChangeCallback: onPageChangeCallback,
              pages: pages,
              enableSideReveal: false,
              preferDragFromRevealedArea: false,
              waveType: WaveType.liquidReveal,
              positionSlideIcon: 0.8,
              slideIconWidget: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 30.r,
                color: AppColor.apporange,
              ),
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.only(bottom: 10.h),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: AppColor.whiteColorBG,
          //       shape: const StadiumBorder(),
          //     ),
          //     onPressed: () {
          //       page1a2a3(context);
          //     },
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
          //       child: Text(
          //         "   التالي   ",
          //         style: TextStyle(fontSize: 20.sp, color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void onPageChangeCallback(int activePageIndex) {
    currentpage = activePageIndex;
    setState(() {});
  }

  void page1a2a3(BuildContext context) {
    if (controller.currentPage != 2) {
      int nextpage = controller.currentPage + 1;
      controller.animateToPage(
        page: nextpage,
      );
    } else {
      Preferences.saveIsFirstTime(false);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    }
  }
}
