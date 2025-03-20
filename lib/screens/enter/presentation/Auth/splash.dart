import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/pages/home.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/screens/enter/presentation/Auth/login.dart';
import 'package:mainamwal/screens/enter/presentation/OnBoarding/obPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  static const double virsion = 1.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<EnterBloc, EnterState>(
      listenWhen: (previous, current) =>
          previous.versionState != current.versionState,
      listener: (context, state) async {
        if (virsion == state.version) {
          await goto(context, state);
        } else if (virsion < state.version) {
          showDialog(
            context: context,
            barrierDismissible: false,
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
                            onPressed: () async {
                              await goto(context, state);
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
        return Scaffold(
          backgroundColor: AppColor.whiteColorBG,
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Image.asset(
                    "assets/images/splash image.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.h),
                  child: SvgPicture.asset(
                    'assets/svg/splash logo.svg',
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  goto(BuildContext context, EnterState state) {
    bool? firsttime = Preferences.getIsFirstTime();
    if (firsttime!) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const OBPage(),
        ),
        (route) => false,
      );
    } else {
      if (state.islogedin == "true") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
          (route) => false,
        );
      } else {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
          (route) => false,
        );
      }
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
}
