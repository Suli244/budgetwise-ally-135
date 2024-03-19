import 'package:budgetwise_ally_135/calculator/calculator_screen.dart';
import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/core/ba_motin.dart';
import 'package:budgetwise_ally_135/settings/settings_screen.dart';
import 'package:budgetwise_ally_135/statistics/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BaBottomBarState extends State<BaBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: isActive,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: 18.r,
          bottom: 35.r,
        ),
        decoration: const BoxDecoration(
          color: BaColors.blacBt,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BaMotion(
              onPressed: () => setState(() => isActive = 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/calculator.svg',
                    color: isActive == 0 ? null : BaColors.grey555555,
                    width: 24.w,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Calculator',
                    style: TextStyle(
                      color: isActive == 0
                          ? BaColors.blue525DFF
                          : BaColors.grey5b5b5b,
                      fontSize: 14.h,
                      height: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            BaMotion(
              onPressed: () => setState(() => isActive = 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/statistics.svg',
                    color: isActive == 1 ? null : BaColors.grey555555,
                    width: 22.w,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Statistics',
                    style: TextStyle(
                      color: isActive == 1
                          ? BaColors.blue525DFF
                          : BaColors.grey5b5b5b,
                      fontSize: 14.h,
                      height: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            BaMotion(
              onPressed: () => setState(() => isActive = 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/settings.svg',
                    color: isActive == 2 ? null : BaColors.grey555555,
                    width: 23.w,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: isActive == 2
                          ? BaColors.blue525DFF
                          : BaColors.grey5b5b5b,
                      fontSize: 14.h,
                      height: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  late int isActive = widget.indexScr;
  final _pages = <Widget>[
    const CalculatorScreen(),
    const StatisticsScreen(),
    const SettingsScreen(),
  ];
}

class BaBottomBar extends StatefulWidget {
  const BaBottomBar({super.key, this.indexScr = 0});
  final int indexScr;

  @override
  State<BaBottomBar> createState() => BaBottomBarState();
}
