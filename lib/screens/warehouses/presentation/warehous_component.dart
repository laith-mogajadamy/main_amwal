import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/model/warehouses/warehouses.dart';
import 'package:mainamwal/screens/warehouses/controller/warehouses_bloc.dart';
import 'package:mainamwal/screens/warehouses/presentation/widget/store_card.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class WarehousComponent extends StatelessWidget {
  final ScrollController scrollController;

  const WarehousComponent({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<WarehousesBloc, WarehousesState>(
      builder: (context, state) {
        switch (state.warehousesState) {
          case RequestState.loading:
            return SizedBox(
              height: size.height / 1.5,
              child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: AppColor.appblueGray,
                    strokeWidth: 4.w,
                  )),
            );
          case RequestState.loaded:
            return GridView.builder(
              controller: scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: state.filteredWarehouses.length,
              itemBuilder: (BuildContext context, int index) {
                Warehouses warehouse = state.filteredWarehouses[index];
                return StoreCard(warehouse: warehouse);
              },
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: AppText(
                  text: state.warehousesMessage,
                  color: AppColor.redfont,
                  fontSize: 14,
                ),
              ),
            );
        }
      },
    );
  }
}
