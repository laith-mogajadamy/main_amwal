import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/filters/documents.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/font/black14text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/widgets/font/black16text.dart';

class SelectDocument extends StatelessWidget {
  const SelectDocument({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        List<DropdownMenuItem<Documents>> documentslist = [];
        for (var i = 0; i < state.documents.length; i++) {
          documentslist.add(
            DropdownMenuItem(
              value: state.documents[i],
              child:
                  FittedBox(child: Black14text(text: state.documents[i].name)),
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Black16text(
              text: "${S.of(context).invoicetype}: ",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
              child: Container(
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: DropdownButton<Documents>(
                    underline: const SizedBox.shrink(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    alignment: AlignmentDirectional.centerStart,
                    iconSize: 30.r,
                    isExpanded: true,
                    dropdownColor: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(20.r),
                    hint: Black14text(text: S.of(context).invoicetype),
                    items: documentslist,
                    value: (state.selectedDocument ==
                            Documents(
                                guid: '',
                                code: '',
                                name: '',
                                categoriesGuid: ''))
                        ? null
                        : state.selectedDocument,
                    onChanged: (value) {
                      context.read<FiltersBloc>().add(
                            DocumentChanged(
                              document: value,
                            ),
                          );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
