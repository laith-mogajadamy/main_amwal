import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/formstatus.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/screens/enter/presentation/qr_code_page.dart';
import 'package:mainamwal/widgets/font/black16text.dart';
import 'package:mainamwal/widgets/font/black18text.dart';
import 'package:mainamwal/widgets/font/blue14text.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Drawer(
          backgroundColor: AppColor.whiteColorBG,
          width: size.width / 1.5,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: size.width / 2,
                      height: size.height / 5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage("assets/images/OB 2 image.png"),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Black16text(
                          text: S.of(context).language,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(20.r),
                            items: [
                              DropdownMenuItem(
                                value: 'العربية',
                                child: Blue14text(text: 'العربية'),
                              ),
                              DropdownMenuItem(
                                value: 'English',
                                child: Blue14text(text: 'English'),
                              ),
                            ],
                            onChanged: (value) => context.read<EnterBloc>().add(
                                  LanguageChanged(
                                      language:
                                          (value == 'English') ? 'en' : 'ar'),
                                ),
                            value: (state.language == "ar")
                                ? 'العربية'
                                : 'English',
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.appbuleBG,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BlocListener<EnterBloc, EnterState>(
                      listenWhen: (previous, current) {
                        return previous.logoutStatus != current.logoutStatus;
                      },
                      listener: (context, state) {
                        if (state.logoutStatus is FormSubmitting) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                backgroundColor: AppColor.whiteColor,
                                elevation: 5,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Black18text(text: S.of(context).logingout),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    CircularProgressIndicator(
                                      color: AppColor.appbuleBG,
                                      strokeWidth: 8.w,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else if (state.logoutStatus is SubmissionSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              duration: const Duration(seconds: 2),
                              content: Text(
                                state.message,
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                              ),
                            ),
                          );
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QRCodePage()),
                            ModalRoute.withName('/'),
                          );
                        } else if (state.logoutStatus is SubmissionFailed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 2),
                              content: Text(
                                state.message,
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: InkWell(
                        onTap: () {
                          context.read<EnterBloc>().add(Logout(token: ''));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout_rounded,
                              color: AppColor.appbuleBG,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Black16text(
                              text: S.of(context).logout,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                    width: size.width / 2,
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    child:
                        SvgPicture.asset("assets/svg/as horizantel logo.svg")),
              ],
            ),
          ),
        );
      },
    );
  }
}
