// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:budgetwise_ally_135/calculator/bottom_sheet/widget/selec_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/core/ba_motin.dart';

Future bottomShet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        height: 560.h,
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
                  const Spacer(),
                  Text(
                    'Select budget category',
                    style: TextStyle(
                      fontSize: 18.h,
                      fontWeight: FontWeight.w600,
                      height: 0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  const Opacity(
                    opacity: 0,
                    child: Column(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_rounded,
                          color: BaColors.grey555555,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              const Divider(thickness: 1, color: BaColors.grey333333),
              SizedBox(height: 10.h),
              SelecWidgetItme(
                titleLeft: 'Bills',
                titleRig: 'Clothings',
                onPressedLeft: () {
                  Navigator.pop(context);
                },
                onPressedRig: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 9.h),
              SelecWidgetItme(
                titleLeft: 'Gifts',
                titleRig: 'Education',
                onPressedLeft: () {},
                onPressedRig: () {},
              ),
              SizedBox(height: 9.h),
              SelecWidgetItme(
                titleLeft: 'Entertainment',
                titleRig: 'Fitness',
                onPressedLeft: () {},
                onPressedRig: () {},
              ),
              SizedBox(height: 9.h),
              SelecWidgetItme(
                titleLeft: 'Food',
                titleRig: 'Health',
                onPressedLeft: () {},
                onPressedRig: () {},
              ),
              SizedBox(height: 9.h),
              SelecWidgetItme(
                titleLeft: 'Furniture',
                titleRig: 'Pet',
                onPressedLeft: () {},
                onPressedRig: () {},
              ),
              SizedBox(height: 9.h),
              SelecWidgetItme(
                titleLeft: 'Shopping',
                titleRig: 'Transportation',
                onPressedLeft: () {},
                onPressedRig: () {},
              ),
              SizedBox(height: 9.h),
              SelecWidgetItme(
                titleLeft: 'Travel',
                titleRig: 'Other',
                onPressedLeft: () {},
                onPressedRig: () {},
              ),
            ],
          ),
        ),
      );
    },
  );
}
