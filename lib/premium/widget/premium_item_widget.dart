import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PreItWid extends StatelessWidget {
  const PreItWid({
    super.key,
    required this.imagSvg,
    required this.text,
  });
  final String text;
  final String imagSvg;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BaColors.black101010,
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(
          width: 2,
          color: BaColors.grey202020,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 13.h,
          horizontal: 20.w,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              imagSvg,
              width: 26.w,
            ),
            SizedBox(width: 7.w),
            Text(
              text,
              style: TextStyle(
                color: BaColors.grey888888,
                fontSize: 16.h,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
