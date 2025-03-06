import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/formstatus.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/screens/enter/presentation/qr_code_page.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class LogoutButoon extends StatelessWidget {
  const LogoutButoon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<EnterBloc, EnterState>(
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
                    AppText(
                      text: S.of(context).logingout,
                      color: AppColor.apptitle,
                      fontSize: 18,
                    ),
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
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
              ),
            ),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const QRCodePage()),
            ModalRoute.withName('/'),
          );
        } else if (state.logoutStatus is SubmissionFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
              content: Text(
                state.message,
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
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
            AppText(
              text: S.of(context).logout,
              color: AppColor.apptitle,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
