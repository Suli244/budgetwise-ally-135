import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.imageOnBoar,
    required this.titleOnBoar,
    required this.desOnBoar,
  });
  final String imageOnBoar;
  final String titleOnBoar;
  final String desOnBoar;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imageOnBoar,
          width: 247.w,
          height: 490.h,
        ),
        SizedBox(height: 25.h),
        Text(
          titleOnBoar,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 0,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          desOnBoar,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: BaColors.grey939393,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
