import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToDayWidget extends StatelessWidget {
  const ToDayWidget({
    super.key,
    required this.title,
    required this.timeOne,
    required this.timeTwo,
    required this.timeThree,
    required this.spendMoneyForOne,
    required this.spendMoneyForTwo,
    required this.spendMoneyForThree,
    required this.expenseOne,
    required this.expenseTwo,
    required this.expenseThree,
  });

  final String title;
  final String timeOne;
  final String timeTwo;
  final String timeThree;
  final String spendMoneyForOne;
  final String spendMoneyForTwo;
  final String spendMoneyForThree;
  final String expenseOne;
  final String expenseTwo;
  final String expenseThree;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
          color: BaColors.grey1c1c1c,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: BaColors.grey555555,
                  fontSize: 14.h,
                  height: 0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    timeOne,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.h,
                      height: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    expenseOne,
                    style: TextStyle(
                      color: BaColors.redB91D1D,
                      fontSize: 18.h,
                      height: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Text(
                spendMoneyForOne,
                style: TextStyle(
                  color: BaColors.grey555555,
                  fontSize: 14.h,
                  height: 0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              const Divider(thickness: 1, color: BaColors.grey333333),
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        timeTwo,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.h,
                          height: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        spendMoneyForTwo,
                        style: TextStyle(
                          color: BaColors.grey555555,
                          fontSize: 14.h,
                          height: 0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    expenseTwo,
                    style: TextStyle(
                      color: BaColors.redB91D1D,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        timeThree,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.h,
                          height: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        spendMoneyForThree,
                        style: TextStyle(
                          color: BaColors.grey555555,
                          fontSize: 14.h,
                          height: 0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    expenseThree,
                    style: TextStyle(
                      color: BaColors.redB91D1D,
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
      ),
    );
  }
}
