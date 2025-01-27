import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/customers_and_suppliers/agent.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/font/black14text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectAgent extends StatelessWidget {
  const SelectAgent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        List<DropdownMenuItem<Agent>> agentslist = [];
        for (var i = 0; i < state.agents.length; i++) {
          agentslist.add(
            DropdownMenuItem(
              value: state.agents[i],
              child: FittedBox(child: Black14text(text: state.agents[i].name)),
            ),
          );
        }
        return Container(
          height: size.height / 22,
          width: size.width / 2.5,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: AppColor.black.withOpacity(0.2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: DropdownButton<Agent>(
              underline: const SizedBox.shrink(),
              icon: const Icon(Icons.keyboard_arrow_down),
              alignment: AlignmentDirectional.centerStart,
              iconSize: 30.r,
              isExpanded: true,
              dropdownColor: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(20.r),
              hint: Black14text(text: S.of(context).agent),
              items: agentslist,
              value: (state.selectedagent ==
                      const Agent(guid: '', code: '', name: ''))
                  ? null
                  : state.selectedagent,
              onChanged: (value) {
                context.read<FiltersBloc>().add(
                      AgentChanged(
                        agent: value,
                      ),
                    );
              },
            ),
          ),
        );
      },
    );
  }
}
