import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoneyLeftWidget extends StatelessWidget {
  const MoneyLeftWidget({
    super.key,
    required this.moneyLeft,
    required this.summaryExpense,
  });
  final String moneyLeft;
  final String summaryExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        color: BaColors.grey1c1c1c,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0).r,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Money Left',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.h,
                    height: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  moneyLeft,
                  style: TextStyle(
                    color: BaColors.green52FF63,
                    fontSize: 18.h,
                    height: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            const Divider(thickness: 1, color: BaColors.grey333333),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  'Summary Expense',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.h,
                    height: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  summaryExpense,
                  style: TextStyle(
                    color: BaColors.redFF5252,
                    fontSize: 18.h,
                    height: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
