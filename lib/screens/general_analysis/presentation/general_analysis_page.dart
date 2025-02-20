import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/screens/general_analysis/controller/general_analysis_bloc.dart';
import 'package:mainamwal/screens/general_analysis/presentation/chileds_general_analysis_component.dart';
import 'package:mainamwal/screens/general_analysis/presentation/parents_general_analysis_component.dart';
import 'package:mainamwal/screens/general_analysis/presentation/path_component.dart';
import 'package:mainamwal/screens/general_analysis/presentation/widgets/select_general_analysis_company.dart';
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

    context.read<GeneralAnalysisBloc>().add(GetGeneralAnalysisCompanys());
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
              if (state.path.isEmpty) {
                return SelectGeneralAnalysisCompany();
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min, // Let the column take minimum space
        children: [
          SizedBox(
            height: size.height / 20,
            child: PathComponent(size: size),
          ),
          BlocBuilder<GeneralAnalysisBloc, GeneralAnalysisState>(
            builder: (context, state) {
              if (state.parentsGeneralAnalysiss.isNotEmpty) {
                return SizedBox(
                    height: size.height / 4,
                    child: ParentsGeneralAnalysisComponent());
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          Expanded(child: ChiledsGeneralAnalysisComponent()),
        ],
      ),
    );
  }
}
