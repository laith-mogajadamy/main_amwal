import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/model/customers_and_suppliers/customer.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/widgets/customer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';

class CustomerComponent extends StatefulWidget {
  final String name;
  const CustomerComponent({super.key, required this.name});

  @override
  State<CustomerComponent> createState() => _CustomerComponentState();
}

class _CustomerComponentState extends State<CustomerComponent> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (context.read<FiltersBloc>().state.page == 'customers') {
        context.read<CustomersBloc>().add(LoadMoreCustomers(
              name: widget.name,
              currency: context.read<FiltersBloc>().state.selectedcurrency,
              company: context.read<FiltersBloc>().state.selectedcompany,
              accountType:
                  context.read<FiltersBloc>().state.selectedaccounttype,
              agent: context.read<FiltersBloc>().state.selectedagent,
              city: context.read<FiltersBloc>().state.selectedcity,
            ));
      } else {
        context.read<CustomersBloc>().add(LoadMoreSuppliers(
              name: widget.name,
              currency: context.read<FiltersBloc>().state.selectedcurrency,
              company: context.read<FiltersBloc>().state.selectedcompany,
              accountType:
                  context.read<FiltersBloc>().state.selectedaccounttype,
              agent: context.read<FiltersBloc>().state.selectedagent,
              city: context.read<FiltersBloc>().state.selectedcity,
            ));
      }
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
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: state.customers.length,
                    itemBuilder: (context, index) {
                      Customer customer = state.customers[index];
                      return CustomerCard(customer: customer);
                    },
                  ),
                ),
                (state.customerLoadMoreState == RequestState.loading)
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
                child: Text(state.customerMessage),
              ),
            );
        }
      },
    );
  }
}
