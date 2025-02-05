import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/model/warehouses/searched_warehouses.dart';
import 'package:mainamwal/screens/warehouses/controller/warehouses_bloc.dart';
import 'package:mainamwal/screens/warehouses/presentation/widget/searched_store_card.dart';

class SearchedWarehousComponent extends StatelessWidget {
  const SearchedWarehousComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<WarehousesBloc, WarehousesState>(
      builder: (context, state) {
        switch (state.searchedWarehousesState) {
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
            return ListView.builder(
              itemCount: state.searchedWarehouses.length,
              itemBuilder: (BuildContext context, int index) {
                SearchedWarehouses searchedWarehouse =
                    state.searchedWarehouses[index];
                return SearchedStoreCard(searchedWarehouse: searchedWarehouse);
              },
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: Text(state.searchedWarehousesMessage),
              ),
            );
        }
      },
    );
  }
}
