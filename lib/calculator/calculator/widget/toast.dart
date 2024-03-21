import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCustomToastTrue(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      content: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: BaColors.black101010,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/toasTrue.png', width: 32.w),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Congratulations!',
                      style: TextStyle(
                        fontSize: 18.h,
                        fontWeight: FontWeight.w600,
                        color: BaColors.whate,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Today you spent less! We hope\nyou had a great day!',
                      style: TextStyle(
                        fontSize: 14.h,
                        fontWeight: FontWeight.w500,
                        color: BaColors.whate.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned.fill(
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 5.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  color: BaColors.green00DF80,
                ),
              ),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
      elevation: 0,
    ),
  );
}

void showCustomToastFalse(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      content: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: BaColors.black101010,
            ),
            child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/toasFalse.png', width: 32.w),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daily Limit!',
                      style: TextStyle(
                        fontSize: 18.h,
                        fontWeight: FontWeight.w600,
                        color: BaColors.whate,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'You have exceeded the daily limit.\nPlease try to save for tomorrow!',
                      style: TextStyle(
                        fontSize: 14.h,
                        fontWeight: FontWeight.w500,
                        color: BaColors.whate.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned.fill(
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 5.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                   color: BaColors.yellowFFD21F,
                ),
              ),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}
