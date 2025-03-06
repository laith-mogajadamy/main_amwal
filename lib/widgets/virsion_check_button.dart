import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

const double virsion = 1.0;

class Virsioncheckbutton extends StatelessWidget {
  const Virsioncheckbutton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<EnterBloc, EnterState>(
      listenWhen: (previous, current) =>
          previous.versionState != current.versionState,
      listener: (context, state) async {
        if (virsion == state.version) {
        } else if (virsion < state.version) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) {
              return AlertDialog(
                backgroundColor: AppColor.whiteColor,
                elevation: 5,
                content: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 3.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: S.of(context).thereisanupdate,
                        color: AppColor.apptitle,
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 3,
                                vertical: 3,
                              ),
                              fixedSize: Size(size.width / 4, size.height / 25),
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: AppText(
                              text: S.of(context).cancel,
                              color: AppColor.whiteColor,
                              fontSize: 16,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              openBrowser(state.updateUrl);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 3,
                                vertical: 3,
                              ),
                              fixedSize: Size(size.width / 4, size.height / 25),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: AppText(
                              text: S.of(context).update,
                              color: AppColor.whiteColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (state.versionState == RequestState.loading) {
            } else {
              context.read<EnterBloc>().add(
                    Getvirsion(),
                  );
            }
          },
          child: Row(
            children: [
              (state.versionState == RequestState.loading)
                  ? CircularProgressIndicator(
                      color: AppColor.appbuleBG,
                      strokeWidth: 4.w,
                    )
                  : Icon(
                      Icons.refresh_rounded,
                      color: AppColor.appbuleBG,
                    ),
              SizedBox(
                width: 10.h,
              ),
              AppText(
                text: S.of(context).checkforupdate,
                color: AppColor.apptitle,
                fontSize: 16,
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<void> openBrowser(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
