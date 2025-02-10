import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/warehouses/warehouses.dart';
import 'package:mainamwal/screens/warehouses/controller/warehouses_bloc.dart';
import 'package:mainamwal/screens/warehouses/presentation/searched_warehous_component.dart';
import 'package:mainamwal/screens/warehouses/presentation/warehouses_qr_code_scan.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class SearchForItemPage extends StatelessWidget {
  final Warehouses warehouses;
  const SearchForItemPage({super.key, required this.warehouses});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(
      text: context.read<WarehousesBloc>().state.scannedQR,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appbuleBG,
        title: AppText(
          text: S.of(context).warehouse,
          color: AppColor.whiteColor,
          fontSize: 18,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => WarehousesQrCodeScan(
                    warehouses: warehouses,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.qr_code_scanner_rounded,
              size: 45.r,
              color: AppColor.whiteColor,
            ),
          ),
        ],
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
              onEditingComplete: () {
                context.read<WarehousesBloc>().add(
                      GetSearchedWarehouses(
                        search: controller.text,
                        storeGuid: warehouses.storeGuid,
                        companyGuid: context
                            .read<WarehousesBloc>()
                            .state
                            .selectedcompany
                            .guid,
                        page: '1',
                        perPage: '50',
                      ),
                    );
                SystemChannels.textInput.invokeMethod('TextInput.hide');
              },
              decoration: InputDecoration(
                suffixIcon:
                    SuffixIcon(controller: controller, warehouses: warehouses),
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
                      "${S.of(context).resultcount} :${state.searchedWarehouses.length.toString()}",
                  color: AppColor.appbuleBG,
                  fontSize: 16,
                );
              },
            ),
            Expanded(
              child: SearchedWarehousComponent(
                controller: controller,
                warehouses: warehouses,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuffixIcon extends StatelessWidget {
  const SuffixIcon({
    super.key,
    required this.controller,
    required this.warehouses,
  });

  final TextEditingController controller;
  final Warehouses warehouses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              context.read<WarehousesBloc>().add(
                    GetSearchedWarehouses(
                      search: controller.text,
                      storeGuid: warehouses.storeGuid,
                      companyGuid: context
                          .read<WarehousesBloc>()
                          .state
                          .selectedcompany
                          .guid,
                      page: '1',
                      perPage: '50',
                    ),
                  );
              SystemChannels.textInput.invokeMethod('TextInput.hide');
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
                    ClearSearchedWarehouses(),
                  );
              SystemChannels.textInput.invokeMethod('TextInput.hide');
            },
            child: Icon(
              Icons.cancel,
              color: Colors.red,
              size: 25.r,
            ),
          ),
        ],
      ),
    );
  }
}
