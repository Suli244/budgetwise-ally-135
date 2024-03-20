import 'package:budgetwise_ally_135/calculator/budget/widget/app_unfocuser.dart';
import 'package:budgetwise_ally_135/calculator/budget/widget/bottom_sheet.dart';
import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/core/ba_motin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set up and save your budget from\n1 to 45 days 👇',
              style: TextStyle(
                fontSize: 18.h,
                fontWeight: FontWeight.w500,
                height: 0,
                color: BaColors.grey636366,
              ),
            ),
            TextField(
              style: TextStyle(
                fontSize: 40.h,
                fontWeight: FontWeight.w700,
                height: 0,
                color: BaColors.whate,
              ),
              cursorColor: BaColors.blue525DFF,
              cursorWidth: 6,
              cursorHeight: 40.h,
              cursorRadius: const Radius.circular(0),
              strutStyle: const StrutStyle(
                forceStrutHeight: true,
                height: 1.05,
              ),
              maxLength: 10,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                counterText: '',
                hintText: '0',
                hintStyle: TextStyle(
                  fontSize: 40.h,
                  fontWeight: FontWeight.w700,
                  height: 0,
                  color: BaColors.grey888888,
                ),
                prefixIcon: Icon(
                  CupertinoIcons.money_dollar,
                  size: 48.h,
                  color: Colors.white,
                ),
                border: InputBorder.none,
              ),
            ),
            Center(
              child: BaMotion(
                onPressed: () {
                  bottomShet(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100).r,
                    color: BaColors.blue525DFF,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 18.h, horizontal: 35.w),
                    child: Text(
                      'Confirm Budget',
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
          ],
        ),
      ),
    );
  }
}
