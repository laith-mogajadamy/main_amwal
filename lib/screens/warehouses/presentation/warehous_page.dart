import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/warehouses/warehouses.dart';
import 'package:mainamwal/screens/warehouses/controller/warehouses_bloc.dart';
import 'package:mainamwal/screens/warehouses/presentation/search_for_item_page.dart';
import 'package:mainamwal/screens/warehouses/presentation/warehous_component.dart';
import 'package:mainamwal/screens/warehouses/presentation/widget/select_warehouse_company.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class WarehousPage extends StatefulWidget {
  const WarehousPage({super.key});

  @override
  State<WarehousPage> createState() => _WarehousPageState();
}

class _WarehousPageState extends State<WarehousPage> {
  ScrollController scrollController = ScrollController();
  bool isFabVisible = true;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isFabVisible) {
          setState(() {
            isFabVisible = false;
          });
        }
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isFabVisible) {
          setState(() {
            isFabVisible = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.whiteColorBG,
      appBar: AppBar(
        backgroundColor: AppColor.appbuleBG,
        title: AppText(
          text: S.of(context).warehouse,
          color: AppColor.whiteColor,
          fontSize: 18,
        ),
        actions: [
          SelectWarehouseCompany(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: isFabVisible ? 1.0 : 0.0,
        child: ElevatedButton(
          onPressed: () {
            if (isFabVisible) {
              context.read<WarehousesBloc>().add(ClearSearchedWarehouses());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchForItemPage(
                    warehouses: Warehouses(
                        storeGuid: '',
                        storeCode: '',
                        storeName: '',
                        companiesGuid: '',
                        companiesCode: '',
                        companiesName: '',
                        currentCost: '',
                        number: ''),
                  ),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            fixedSize: Size(size.width / 2.5, size.height / 20),
            backgroundColor: AppColor.appbuleBG,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: AppColor.whiteColor,
              ),
              SizedBox(
                width: 3,
              ),
              AppText(
                text: S.of(context).searchforitem,
                color: AppColor.whiteColor,
                fontSize: 16,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: RefreshIndicator(
          backgroundColor: AppColor.whiteColor,
          color: AppColor.appbuleBG,
          strokeWidth: 3.w,
          onRefresh: () async {
            context.read<WarehousesBloc>().add(GetWarehouses());
          },
          child: WarehousComponent(
            scrollController: scrollController,
          ),
        ),
      ),
    );
  }
}
