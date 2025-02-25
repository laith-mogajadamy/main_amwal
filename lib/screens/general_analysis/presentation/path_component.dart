import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/screens/general_analysis/controller/general_analysis_bloc.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class PathComponent extends StatelessWidget {
  const PathComponent({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralAnalysisBloc, GeneralAnalysisState>(
      builder: (context, state) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.path.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                (index == 0)
                    ? SizedBox.shrink()
                    : Icon(
                        Icons.arrow_forward,
                        color: AppColor.appbuleBG,
                        size: 20.sp,
                      ),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                  onTap: () {
                    if (context
                                .read<GeneralAnalysisBloc>()
                                .state
                                .parentsGeneralAnalysisState ==
                            RequestState.loading ||
                        context
                                .read<GeneralAnalysisBloc>()
                                .state
                                .chiledsGeneralAnalysisState ==
                            RequestState.loading) {
                      //nothing
                    } else {
                      if (state.path[index].accountCode == 'رئيسي') {
                        context.read<GeneralAnalysisBloc>().add(RemoveUtilPath(
                              accountData: state.path[index],
                            ));
                        context.read<GeneralAnalysisBloc>().add(
                              GetParentsGeneralAnalysis(
                                parentGuid:
                                    "00000000-0000-0000-0000-000000000000",
                                aLER: "'A','L','E','R'",
                                mainDTL: "-1",
                              ),
                            );
                        context.read<GeneralAnalysisBloc>().add(
                              GetChiledGeneralAnalysis(
                                parentGuid:
                                    "00000000-0000-0000-0000-000000000000",
                                aLER: "",
                                mainDTL: "0",
                              ),
                            );
                      } else {
                        context.read<GeneralAnalysisBloc>().add(RemoveUtilPath(
                              accountData: state.path[index],
                            ));
                        context
                            .read<GeneralAnalysisBloc>()
                            .add(GetParentsGeneralAnalysis(
                              parentGuid: state.path[index].accountGuid,
                              aLER: '',
                              mainDTL: "-1",
                            ));
                        context
                            .read<GeneralAnalysisBloc>()
                            .add(GetChiledGeneralAnalysis(
                              parentGuid: state.path[index].accountGuid,
                              aLER: "",
                              mainDTL: "0",
                            ));
                      }
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColor.appbuleBG,
                        width: 1.w,
                      ),
                    ),
                    child: AppText(
                      text: state.path[index].accountCode,
                      color: AppColor.appdarkorange,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
