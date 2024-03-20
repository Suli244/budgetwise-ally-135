import 'package:budgetwise_ally_135/calculator/bottom_sheet/bottom_sheet_confirm_calculator.dart';
import 'package:budgetwise_ally_135/calculator/budget/widget/app_unfocuser.dart';
import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/core/ba_motin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future bottomShetCalcu(BuildContext context) {
  TextEditingController controller = TextEditingController();
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return AppUnfocuser(
        child: Container(
          height: 490.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20).r,
              topRight: const Radius.circular(20).r,
            ),
            color: BaColors.grey1c1c1c,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 16.h, left: 16.h, right: 16.h),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaMotion(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: BaColors.grey555555,
                        size: 25,
                      ),
                    ),
                    SizedBox(width: 7.w),
                    Text(
                      'How much money would you like \nto add to your expense?',
                      style: TextStyle(
                        fontSize: 18.h,
                        fontWeight: FontWeight.w600,
                        height: 0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                const Divider(thickness: 1, color: BaColors.grey333333),
                TextField(
                  controller: controller,
                  style: TextStyle(
                    fontSize: 40.h,
                    fontWeight: FontWeight.w700,
                    height: 0,
                    color: BaColors.whate,
                  ),
                  maxLength: 10,
                  cursorColor: BaColors.blue525DFF,
                  cursorWidth: 6,
                  cursorHeight: 40.h,
                  cursorRadius: const Radius.circular(0),
                  strutStyle: const StrutStyle(
                    forceStrutHeight: true,
                    height: 1,
                  ),
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
                BaMotion(
                  onPressed: () async {
                    if (controller.text.isNotEmpty) {
                      Navigator.pop(context);
                      await bottomShetConfirmCalcu(context, controller.text);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100).r,
                      color: BaColors.blue525DFF,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 18.h, horizontal: 35.w),
                      child: Text(
                        'Confirm Expense',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.h,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
