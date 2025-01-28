import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/widgets/font/black18text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/widgets/home_drawer.dart';
import 'package:mainamwal/widgets/home_grid_component.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldState,
      drawer: HomeDrawer(size: size),
      backgroundColor: AppColor.whiteColorBG,
      body: Stack(
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
                    Black18text(text: S.of(context).fastaccess),
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
            left: size.width / 18,
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
            ),
          ),
          BlocBuilder<EnterBloc, EnterState>(
            builder: (context, state) {
              return Positioned(
                top: 10.h,
                left: (state.language == 'ar') ? null : 0,
                right: (state.language == 'ar') ? 0 : null,
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
