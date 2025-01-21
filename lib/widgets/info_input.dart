import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/widgets/font/black16text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class InfoInput extends StatelessWidget {
  final String name;
  final String hint;
  final String? Function(String?)? validator;
  final Function(String?)? onchange;
  final TextEditingController controller;

  const InfoInput({
    super.key,
    required this.name,
    required this.hint,
    required this.validator,
    required this.onchange,
    required this.controller,
  });

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
          Black16text(text: name),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: size.height / 18,
            width: size.width / 1.1,
            child: TextFormField(
              controller: controller,
              validator: validator,
              onChanged: onchange,
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: hint,
                filled: true,
                fillColor: AppColor.applightgray,
                hintStyle: TextStyle(color: Colors.black45, fontSize: 16.sp),
                // border: InputBorder.none,

                // border: UnderlineInputBorder(
                //   borderSide: BorderSide(width: 3.h, color: Colors.black),
                // )
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
