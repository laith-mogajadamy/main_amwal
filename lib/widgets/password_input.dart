import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class PasswordInput extends StatefulWidget {
  final String name;
  final String hint;
  final String? Function(String?)? validator;
  final Function(String?)? onchange;
  final TextEditingController controller;

  const PasswordInput({
    super.key,
    required this.name,
    required this.hint,
    required this.validator,
    required this.onchange,
    required this.controller,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isObscure = true; // To toggle the password visibility

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width,
          ),
          AppText(
            text: widget.name,
            color: AppColor.apptitle,
            fontSize: 16,
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: size.height / 18,
            width: size.width / 1.1,
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              onChanged: widget.onchange,
              obscureText:
                  _isObscure, // Use the toggle variable for obscuring text
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: widget.hint,
                filled: true,
                fillColor: AppColor.applightgray,
                hintStyle: TextStyle(color: Colors.black45, fontSize: 16.sp),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure
                        ? Icons
                            .visibility // Show eye icon when password is obscured
                        : Icons
                            .visibility_off, // Show crossed-eye icon when password is visible
                    color: Colors.black45,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure; // Toggle visibility
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
