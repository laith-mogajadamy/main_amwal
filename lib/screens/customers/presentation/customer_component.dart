import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/model/customers_and_suppliers/customer.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/widgets/customer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerComponent extends StatelessWidget {
  final CustomersEvent event;
  const CustomerComponent({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CustomersBloc, CustomersState>(
      builder: (context, state) {
        switch (state.customerState) {
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
            return Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: state.customers.length,
                      itemBuilder: (context, index) {
                        Customer customer = state.customers[index];
                        return CustomerCard(customer: customer);
                      },
                    ),
                  ),
                )
              ],
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: Text(state.customerMessage),
              ),
            );
        }
      },
    );
  }
}
