import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/model/customers_and_suppliers/statment_detailed.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/widgets/detailed_statment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailedStatmentComponent extends StatelessWidget {
  const DetailedStatmentComponent({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomersBloc, CustomersState>(
      builder: (context, state) {
        switch (state.statmentDetailedState) {
          case RequestState.loading:
            return SizedBox(
              height: size.height / 3,
              child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: AppColor.appblueGray,
                    strokeWidth: 4.w,
                  )),
            );
          case RequestState.loaded:
            return SizedBox(
              height: size.height / 2.1,
              child: ListView.builder(
                shrinkWrap: false,
                physics: BouncingScrollPhysics(),
                itemCount: state.statmentDetailed.length,
                itemBuilder: (context, index) {
                  StatmentDetailed statmentDetailed =
                      state.statmentDetailed[index];
                  return DetailedStatmentCard(
                      statmentDetailed: statmentDetailed, size: size);
                },
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: Text("no data"),
              ),
            );
        }
      },
    );
  }
}
