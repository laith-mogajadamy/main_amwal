import 'package:flutter/services.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/formstatus.dart';
import 'package:mainamwal/core/utils/user_hive.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/pages/pages.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/screens/enter/presentation/qr_code_page.dart';
import 'package:mainamwal/widgets/info_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mainamwal/widgets/password_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userRepository = UserRepository();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  getusername() async {
    await userRepository.init();
    Map<String, String?> user = userRepository.getUser();
    String? useremail = user['username'] ?? '';
    String? userpassword = user['password'] ?? '';
    email.text = useremail;
    password.text = userpassword;
  }

  @override
  void initState() {
    getusername();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: size.height / 3,
                    width: size.width,
                    color: AppColor.appblueGray,
                    child: SvgPicture.asset(
                      'assets/svg/amwal white.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Form(
                        key: formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              InfoInput(
                                  name: S.of(context).username,
                                  hint: "",
                                  validator: (value) => null,
                                  onchange: (value) =>
                                      context.read<EnterBloc>().add(
                                            LoginEmailChanged(email: value),
                                          ),
                                  controller: email),
                              SizedBox(
                                height: 30.h,
                              ),
                              PasswordInput(
                                name: S.of(context).Password,
                                hint: "",
                                validator: (value) => null,
                                onchange: (value) =>
                                    context.read<EnterBloc>().add(
                                          LoginPasswordChanged(password: value),
                                        ),
                                controller: password,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              BlocListener<EnterBloc, EnterState>(
                                listenWhen: (previous, current) =>
                                    current.formStatus != previous.formStatus,
                                listener: (context, state) {
                                  if (state.formStatus is SubmissionSuccess) {
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     backgroundColor: Colors.green,
                                    //     duration: const Duration(seconds: 2),
                                    //     content: Text(
                                    //       state.message,
                                    //       style: TextStyle(
                                    //           fontSize: 14.sp,
                                    //           color: Colors.white),
                                    //     ),
                                    //   ),
                                    // );
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MyPages(),
                                      ),
                                      (route) => false,
                                    );
                                  } else if (state.formStatus
                                      is SubmissionFailed) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 2),
                                        content: Text(
                                          state.message,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: ElevatedButton(
                                  onPressed: () {
                                    SystemChannels.textInput
                                        .invokeMethod('TextInput.hide');
                                    if (formKey.currentState!.validate()) {
                                      if ((state.formStatus
                                          is FormSubmitting)) {
                                      } else {
                                        context.read<EnterBloc>().add(
                                              LoginSubmitted(
                                                email.text,
                                                password.text,
                                              ),
                                            );
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                        size.width / 1.2, size.height / 18),
                                    backgroundColor: AppColor.appblueGray,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  child: (state.formStatus is FormSubmitting)
                                      ? CircularProgressIndicator(
                                          color: AppColor.whiteColor,
                                          strokeWidth: 4.w,
                                        )
                                      : Text(
                                          S.of(context).LogInbotton,
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const QRCodePage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize:
                                      Size(size.width / 1.2, size.height / 18),
                                  backgroundColor: AppColor.whiteColorBG,
                                  shape: RoundedRectangleBorder(
                                    side:
                                        BorderSide(color: AppColor.appblueGray),
                                    borderRadius: BorderRadius.circular(
                                      10.r,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  S.of(context).chnagecompcode,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColor.appblueGray,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 10,
                      ),
                      SvgPicture.asset("assets/svg/as horizantel logo.svg"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
