import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/screens/box/controller/box_bloc.dart';
import 'package:mainamwal/screens/box/presentation/boxs_component.dart';
import 'package:mainamwal/widgets/font/white18text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxsPage extends StatelessWidget {
  final String title;
  const BoxsPage({
    super.key,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.whiteColorBG,
      appBar: AppBar(
        backgroundColor: AppColor.appbuleBG,
        title: White18text(
          text: title,
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: AppColor.whiteColor,
        color: AppColor.appbuleBG,
        strokeWidth: 3.w,
        onRefresh: () async {
          context.read<BoxBloc>().add(GetBoxs());
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: BoxsComponent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
