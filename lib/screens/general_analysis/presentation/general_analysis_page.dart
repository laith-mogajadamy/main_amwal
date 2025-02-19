import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/screens/general_analysis/controller/general_analysis_bloc.dart';
import 'package:mainamwal/screens/general_analysis/presentation/chileds_general_analysis_component.dart';
import 'package:mainamwal/screens/general_analysis/presentation/parents_general_analysis_component.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class GeneralAnalysisPage extends StatelessWidget {
  final String title;

  const GeneralAnalysisPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    context.read<GeneralAnalysisBloc>().add(GetParentsGeneralAnalysis(
          parentGuid: "00000000-0000-0000-0000-000000000000",
          aLER: '',
          mainDTL: "-1",
        ));
    context.read<GeneralAnalysisBloc>().add(GetChiledGeneralAnalysis(
          parentGuid: "00000000-0000-0000-0000-000000000000",
          aLER: "",
          mainDTL: "0",
        ));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appbuleBG,
          title: AppText(
            text: title,
            color: AppColor.whiteColor,
            fontSize: 18,
          ),
          actions: [
            BlocBuilder<GeneralAnalysisBloc, GeneralAnalysisState>(
              builder: (context, state) {
                return SizedBox(
                  width: size.width / 2.7,
                  child: ListView.builder(
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
                                  color: AppColor.whiteColor,
                                  size: 20.sp,
                                ),
                          SizedBox(
                            width: 5.w,
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<GeneralAnalysisBloc>()
                                  .add(RemoveUtilPath(
                                    accountData: state.path[index],
                                  ));
                              context
                                  .read<GeneralAnalysisBloc>()
                                  .add(GetParentsGeneralAnalysis(
                                    parentGuid: state.path[index].parentGuid,
                                    aLER: (index == 0) ? "'R','E'" : '',
                                    mainDTL: "-1",
                                  ));
                              context
                                  .read<GeneralAnalysisBloc>()
                                  .add(GetChiledGeneralAnalysis(
                                    parentGuid: state.path[index].parentGuid,
                                    aLER: "",
                                    mainDTL: "0",
                                  ));
                            },
                            child: AppText(
                              text: state.path[index].accountCode,
                              color: AppColor.whiteColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min, // Let the column take minimum space
          children: [
            SizedBox(
                height: size.height / 4,
                child: ParentsGeneralAnalysisComponent()),
            Expanded(child: ChiledsGeneralAnalysisComponent()),
          ],
        ));
  }
}
