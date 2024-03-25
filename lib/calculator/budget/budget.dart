import 'dart:async';

import 'package:budgetwise_ally_135/calculator/budget/widget/app_unfocuser.dart';
import 'package:budgetwise_ally_135/calculator/budget/widget/bottom_sheet.dart';
import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/core/ba_motin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  int? highlightedButtonIndex;
  String inputString = '';
  double usdValue = 0;

  void _updateConversion() {
    double value = double.tryParse(inputString) ?? 0.0;
    setState(() {
      usdValue = value;
    });
  }

  Widget _buildKeyPadButton(String label, int buttonIndex) {
    bool isHighlighted = highlightedButtonIndex == buttonIndex;
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          highlightedButtonIndex = buttonIndex;
        });

        Timer(const Duration(milliseconds: 300), () {
          setState(() {
            highlightedButtonIndex = null;
          });
        });

        if (label != '<-') {
          inputString += label;
        } else {
          if (inputString.isNotEmpty) {
            inputString = inputString.substring(0, inputString.length - 1);
          }
        }
        _updateConversion();
      },
      onTapUp: (_) {},
      onTapCancel: () {},
      child: Container(
        padding: EdgeInsets.all(5.r),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isHighlighted
              ? BaColors.blue525DFF
              : BaColors.blue525DFF.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 26.h,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
Widget build(BuildContext context) {
  // ScreenUtil.init(context, designSize: const Size(360, 890));
  return AppUnfocuser(
    child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  '\$ ',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 40.h,
                    fontWeight: FontWeight.w700,
                    color: BaColors.whate,
                  ),
                ),
                Expanded(
                  child: Text(
                    usdValue
                        .toStringAsFixed(2)
                        .replaceAll(RegExp(r"(\.0*|0*)$"), ""),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 40.h,
                      fontWeight: FontWeight.w700,
                      height: 0,
                      color: usdValue != 0
                          ? BaColors.whate
                          : BaColors.whate.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 69.h),
            // const Spacer(),
            usdValue != 0
                ? Center(
                    child: BaMotion(
                      onPressed: () async {
                        if (usdValue != 0) {
                          await bottomShet(context, usdValue);
                          setState(() {
                            usdValue = 0;
                          });
                        }
                      },
                      child: Container(
                        height: 61.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100).r,
                          color: BaColors.blue525DFF,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 18.h, horizontal: 35.w),
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
                  )
                : SizedBox(height: 61.h),
            SizedBox(height: 16.h),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                mainAxisExtent: 68,
              ),
              itemBuilder: (context, index) {
                String label;
                if (index < 9) {
                  label = '${index + 1}';
                } else if (index == 9) {
                  label = '.';
                } else if (index == 10) {
                  label = '0';
                } else {
                  label = '<-';
                }
                return _buildKeyPadButton(label, index);
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    ),
  );
}
}

Future<double> getBudgetUblndvd() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getDouble('BudgetUblndvd') ?? 0;
}

Future<void> setBudgetUblndvd(double budgetUblndvd) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble('BudgetUblndvd', budgetUblndvd);
}
