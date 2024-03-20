import 'package:budgetwise_ally_135/calculator/bottom_sheet/bottom_sheet_calculator.dart';
import 'package:budgetwise_ally_135/calculator/calculator/widget/money_left_widget.dart';
import 'package:budgetwise_ally_135/calculator/calculator/widget/to_day_widget.dart';
import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/core/ba_motin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BaMotion(
          onPressed: () {
            bottomShetCalcu(context);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100).r,
              color: BaColors.blue525DFF,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 35.w),
              child: Text(
                'Add Expense',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.h,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20.h),
        child: const Column(
          children: [
            MoneyLeftWidget(
              moneyLeft: '2 446 65\$',
              summaryExpense: '-2 446 65\$',
            ),
            ToDayWidget(
              title: 'TODAY',
              timeOne: '10:00 AM',
              timeTwo: '12:00 PM',
              timeThree: '12:00 PM',
              spendMoneyForOne: 'Food',
              spendMoneyForTwo: 'Gifts',
              spendMoneyForThree: 'Clothings',
              expenseOne: '-446 65\$',
              expenseTwo: '-546 65\$',
              expenseThree: '-946 65\$',
            ),
            ToDayWidget(
              title: 'Yesterday',
              timeOne: '10:00 AM',
              timeTwo: '12:00 PM',
              timeThree: '13:00 PM',
              spendMoneyForOne: 'Other',
              spendMoneyForTwo: 'Gifts',
              spendMoneyForThree: 'Clothings',
              expenseOne: '-446 65\$',
              expenseTwo: '-546 65\$',
              expenseThree: '-946 65\$',
            ),
          ],
        ),
      ),
    );
  }
}
