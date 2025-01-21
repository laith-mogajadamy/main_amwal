import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/pages/home.dart';
import 'package:mainamwal/screens/pages/search.dart';
import 'package:mainamwal/welcome/controller/enter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPages extends StatefulWidget {
  const MyPages({super.key});

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  late int select = 0;
  late PageController controller;
  bool hasnet = true;

  @override
  void initState() {
    super.initState();

    controller = PageController(initialPage: select, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (select != 0) {
          setState(() {
            select = 0;
            controller.jumpToPage(select);
          });
          return false;
        } else {
          SystemNavigator.pop();
          return true;
        }
      },
      child: BlocBuilder<EnterBloc, EnterState>(
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            body: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                Home(),
                Search(),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black, width: 2.h),
                  ),
                ),
                child: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.home),
                      label: S.of(context).home,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.search),
                      label: S.of(context).search,
                    ),
                  ],
                  currentIndex: select,
                  onTap: (index) {
                    setState(() {
                      select = index;
                      controller.jumpToPage(select);
                    });
                  },
                  elevation: 0,
                  selectedItemColor: Colors.orange,
                  selectedFontSize: 12.sp,
                  unselectedFontSize: 10.sp,
                  selectedIconTheme:
                      IconThemeData(size: 30.r, color: Colors.orange),
                  showUnselectedLabels: true,
                  unselectedIconTheme:
                      IconThemeData(size: 25.r, color: Colors.grey),
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool get wantKeepAlive => true;
}
