import 'package:budgetwise_ally_135/calculator/budget/budget.dart';
import 'package:budgetwise_ally_135/calculator/calculator/calculator.dart';
import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.h,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                height: 35.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: BaColors.grey28282b,
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: BaColors.black101010,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelColor: Colors.white,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w600,
                  ),
                  indicator: BoxDecoration(
                    color: BaColors.grey636366,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: BaColors.grey28282b,
                      width: 3,
                    ),
                  ),
                  tabs: const [
                    Tab(
                      text: 'Budget',
                    ),
                    Tab(
                      text: 'Calculator',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              const Expanded(
                child: TabBarView(
                  children: [
                    Budget(),
                    Calculator(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
