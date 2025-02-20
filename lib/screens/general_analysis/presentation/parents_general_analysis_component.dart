import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/model/general_analysis/account_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/screens/general_analysis/controller/general_analysis_bloc.dart';
import 'package:mainamwal/screens/general_analysis/presentation/widgets/parents_general_analysis_card.dart';

class ParentsGeneralAnalysisComponent extends StatefulWidget {
  const ParentsGeneralAnalysisComponent({
    super.key,
  });

  @override
  State<ParentsGeneralAnalysisComponent> createState() =>
      _ParentsGeneralAnalysisComponentState();
}

class _ParentsGeneralAnalysisComponentState
    extends State<ParentsGeneralAnalysisComponent> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // AccountData parent = context.read<GeneralAnalysisBloc>().state.path.last;
      // context.read<GeneralAnalysisBloc>().add(LoadMoreGeneralAnalysis(
      //     parentGuid: parent.parentGuid, aLER: '', mainDTL: '0'));
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
    return BlocBuilder<GeneralAnalysisBloc, GeneralAnalysisState>(
      builder: (context, state) {
        switch (state.parentsGeneralAnalysisState) {
          case RequestState.loading:
            return SizedBox(
              height: size.height / 2,
              child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: AppColor.appblueGray,
                    strokeWidth: 4.w,
                  )),
            );
          case RequestState.loaded:
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              itemCount: state.parentsGeneralAnalysiss.length,
              itemBuilder: (context, index) {
                AccountData accountData = state.parentsGeneralAnalysiss[index];
                return ParentsGeneralAnalysisCard(
                  accountData: accountData,
                  scrollController: scrollController,
                );
              },
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: Text(state.parentsGeneralAnalysisMessage),
              ),
            );
        }
      },
    );
  }
}
