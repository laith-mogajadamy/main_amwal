import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/model/warehouses/searched_warehouses.dart';
import 'package:mainamwal/model/warehouses/warehouses.dart';
import 'package:mainamwal/screens/warehouses/controller/warehouses_bloc.dart';
import 'package:mainamwal/screens/warehouses/presentation/widget/searched_store_card.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class SearchedWarehousComponent extends StatefulWidget {
  final TextEditingController controller;
  final Warehouses warehouses;
  const SearchedWarehousComponent({
    super.key,
    required this.controller,
    required this.warehouses,
  });

  @override
  State<SearchedWarehousComponent> createState() =>
      _SearchedWarehousComponentState();
}

class _SearchedWarehousComponentState extends State<SearchedWarehousComponent> {
  int parePage = 50;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      context.read<WarehousesBloc>().add(LoadMoreSearchedWarehouses(
            search: widget.controller.text,
            storeGuid: widget.warehouses.storeGuid,
            companyGuid:
                context.read<WarehousesBloc>().state.selectedcompany.guid,
            perPage: parePage.toString(),
          ));
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
                ),
              ),
            );
          case RequestState.loaded:
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: state.searchedWarehouses.length,
                    itemBuilder: (BuildContext context, int index) {
                      SearchedWarehouses searchedWarehouse =
                          state.searchedWarehouses[index];
                      return SearchedStoreCard(
                          searchedWarehouse: searchedWarehouse);
                    },
                  ),
                ),
                (state.loadMoreState == RequestState.loading)
                    ? Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: AppColor.appblueGray,
                          strokeWidth: 4.w,
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: AppText(
                  text: state.searchedWarehousesMessage,
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
