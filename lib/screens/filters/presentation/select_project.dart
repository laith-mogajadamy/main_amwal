import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/filters/project.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/font/black14text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectProject extends StatelessWidget {
  const SelectProject({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FiltesBloc, FiltersState>(
      builder: (context, state) {
        List<DropdownMenuItem<Project>> projectlist = [];
        for (var i = 0; i < state.projects.length; i++) {
          projectlist.add(
            DropdownMenuItem(
              value: state.projects[i],
              child:
                  FittedBox(child: Black14text(text: state.projects[i].name)),
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
                // ignore: deprecated_member_use
                color: AppColor.black.withOpacity(0.2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: DropdownButton<Project>(
              underline: const SizedBox.shrink(),
              icon: const Icon(Icons.keyboard_arrow_down),
              alignment: AlignmentDirectional.centerStart,
              iconSize: 30.r,
              isExpanded: true,
              dropdownColor: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(20.r),
              hint: Black14text(text: S.of(context).project),
              items: projectlist,
              value: (state.selectedproject ==
                      Project(guid: '', code: '', name: ''))
                  ? null
                  : state.selectedproject,
              onChanged: (value) {
                context.read<FiltesBloc>().add(
                      ProjectChanged(
                        project: value,
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
