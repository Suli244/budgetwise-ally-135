import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/core/ba_motin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetItWid extends StatelessWidget {
  const SetItWid({
    super.key,
    required this.text,
    required this.onPressed,
    this.isIcon = true,
  });
  final String text;
  final Function()? onPressed;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return BaMotion(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isIcon ? BaColors.grey1c1c1c : BaColors.yellowFECA13,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 19.h,
            horizontal: 20.w,
          ),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  color: isIcon ? BaColors.whate : BaColors.black101010,
                  fontSize: 16.h,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              isIcon
                  ? const Opacity(
                      opacity: 0,
                      child: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: BaColors.black101010,
                        size: 28,
                      ),
                    )
                  : const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: BaColors.black101010,
                      size: 28,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
