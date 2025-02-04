import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/warehouses/controller/warehouses_bloc.dart';
import 'package:mainamwal/screens/warehouses/presentation/searched_warehous_component.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class SearchForItemPage extends StatelessWidget {
  const SearchForItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appbuleBG,
        title: AppText(
          text: S.of(context).warehouse,
          color: AppColor.whiteColor,
          fontSize: 18,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              style: GoogleFonts.cairo(
                fontSize: 14.sp,
                color: AppColor.apptitle,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<WarehousesBloc>().add(
                                GetWarehouses(
                                  search: controller.text,
                                ),
                              );
                        },
                        child: Icon(
                          Icons.search_rounded,
                          color: AppColor.apporange,
                          size: 25.r,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.clear();
                          context.read<WarehousesBloc>().add(
                                ClearWarehouses(),
                              );
                        },
                        child: Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 25.r,
                        ),
                      ),
                    ],
                  ),
                ),
                filled: true,
                hintText: S.of(context).name,
                hintStyle: GoogleFonts.cairo(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                fillColor: AppColor.whiteColor,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.appblueGray,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(
                    20.r,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.appblueGray,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(
                    20.r,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<WarehousesBloc, WarehousesState>(
              builder: (context, state) {
                return AppText(
                  text:
                      "${S.of(context).resultcount} :${state.warehouses.length.toString()}",
                  color: AppColor.appbuleBG,
                  fontSize: 16,
                );
              },
            ),
            Expanded(
              child: SearchedWarehousComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
