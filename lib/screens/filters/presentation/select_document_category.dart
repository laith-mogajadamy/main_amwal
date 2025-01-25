import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/filters/documents_categories.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/font/black14text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDocumentCategory extends StatelessWidget {
  const SelectDocumentCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<FiltesBloc, FiltersState>(
      builder: (context, state) {
        List<DropdownMenuItem<DocumentsCategories>> documentsCategorieslist =
            [];
        for (var i = 0; i < state.documentsCategories.length; i++) {
          documentsCategorieslist.add(
            DropdownMenuItem(
              value: state.documentsCategories[i],
              child: FittedBox(
                  child: Black14text(text: state.documentsCategories[i].name)),
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
            child: DropdownButton<DocumentsCategories>(
              underline: const SizedBox.shrink(),
              icon: const Icon(Icons.keyboard_arrow_down),
              alignment: AlignmentDirectional.centerStart,
              iconSize: 30.r,
              isExpanded: true,
              dropdownColor: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(20.r),
              hint: Black14text(text: S.of(context).movementtype),
              items: documentsCategorieslist,
              value: (state.selectedDocumentsCategorie ==
                      DocumentsCategories(
                          guid: '', code: '', name: '', iddefault: false))
                  ? null
                  : state.selectedDocumentsCategorie,
              onChanged: (value) {
                context.read<FiltesBloc>().add(
                      DocumentsCategoriesChanged(
                        documentsCategorie: value,
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
