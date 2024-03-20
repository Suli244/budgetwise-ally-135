import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/core/ba_motin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelecWidgetItme extends StatelessWidget {
  const SelecWidgetItme({
    super.key,
    required this.titleLeft,
    required this.titleRig,
    required this.onPressedLeft,
    required this.onPressedRig,
  });
  final String titleLeft;
  final String titleRig;
  final Function() onPressedLeft;
  final Function() onPressedRig;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BaMotion(
          onPressed: onPressedLeft,
          child: Container(
            width: 165.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13).r,
              color: BaColors.grey272727,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Text(
                titleLeft,
                style: TextStyle(
                  color: BaColors.grey888888,
                  fontSize: 13.h,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 9.w),
        BaMotion(
          onPressed: onPressedRig,
          child: Container(
            width: 167.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13).r,
              color: BaColors.grey272727,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Text(
                titleRig,
                style: TextStyle(
                  color: BaColors.grey888888,
                  fontSize: 13.h,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
