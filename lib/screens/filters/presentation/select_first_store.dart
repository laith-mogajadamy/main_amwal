import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/filters/store.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectFirstStore extends StatelessWidget {
  const SelectFirstStore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        String code = state.selectedDocumentsCategorie.code;
        List<DropdownMenuItem<Store>> storeList = state.stores
            .map(
              (store) => DropdownMenuItem(
                value: store,
                child: FittedBox(
                  child: AppText(
                    text: store.name,
                    color: AppColor.apptitle,
                    fontSize: 14,
                  ),
                ),
              ),
            )
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: ([
                '34',
                '31',
                '24',
                '21',
                '26',
                '36',
                '22',
                '32',
                '23',
                '33'
              ].contains(code))
                  ? "${S.of(context).stores}: "
                  : "${S.of(context).rawmstore}: ",
              color: AppColor.apptitle,
              fontSize: 16,
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
                  child: DropdownButton<Store>(
                    underline: const SizedBox.shrink(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    alignment: AlignmentDirectional.centerStart,
                    iconSize: 30.r,
                    isExpanded: true,
                    dropdownColor: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(20.r),
                    hint: AppText(
                      text: S.of(context).stores,
                      color: AppColor.apptitle,
                      fontSize: 14,
                    ),
                    items: storeList,
                    value: (state.firstSelectedStores ==
                            Store(guid: '', code: '', name: ''))
                        ? null
                        : state.firstSelectedStores,
                    onChanged: (value) {
                      context.read<FiltersBloc>().add(
                            FirstStoreChanged(
                              store: value,
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
