import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/barChartData/bar_chart_data_model.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/widgets/bar_chart.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/widgets/home_drawer.dart';
import 'package:mainamwal/widgets/home_grid_component.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<BarChartDataModel> sampleData = [
      BarChartDataModel(label: "Jan", value: 50, color: AppColor.appbuleBG),
      BarChartDataModel(label: "Feb", value: 80, color: AppColor.apporange),
      BarChartDataModel(label: "Mar", value: 40, color: AppColor.appbuleBG),
      BarChartDataModel(label: "Apr", value: 70, color: AppColor.apporange),
      BarChartDataModel(label: "May", value: 90, color: AppColor.appbuleBG),
      BarChartDataModel(label: "Jun", value: 60, color: AppColor.apporange),
      BarChartDataModel(label: "Jul", value: 100, color: AppColor.appbuleBG),
      BarChartDataModel(label: "Aug", value: 85, color: AppColor.apporange),
      BarChartDataModel(label: "Sep", value: 75, color: AppColor.appbuleBG),
      BarChartDataModel(label: "Oct", value: 95, color: AppColor.apporange),
      BarChartDataModel(label: "Nov", value: 65, color: AppColor.appbuleBG),
      BarChartDataModel(label: "Dec", value: 110, color: AppColor.apporange),
    ];

    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldState,
      drawer: HomeDrawer(size: size),
      backgroundColor: AppColor.whiteColorBG,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
            children: [
              Container(
                height: size.height / 4,
                color: AppColor.appbuleBG,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height / 10, right: 20.w, left: 20.w),
                child: Row(
                  children: [
                    AppText(
                      text: S.of(context).fastaccess,
                      color: AppColor.apptitle,
                      fontSize: 18,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: HomeGridComponent(),
              )
            ],
          ),
          Positioned(
            top: size.height / 8,
            child: Container(
              height: size.height / 5,
              width: size.width / 1.11,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: AppColor.black.withOpacity(0.25),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: BarChartWidget(data: sampleData),
            ),
          ),
          BlocBuilder<EnterBloc, EnterState>(
            builder: (context, state) {
              return Positioned(
                top: 20.h,
                left: (state.language == 'ar') ? null : 5.w,
                right: (state.language == 'ar') ? 5.w : null,
                child: IconButton(
                  onPressed: () {
                    scaffoldState.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu_rounded,
                    size: 35.r,
                    color: AppColor.whiteColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
