import 'package:budgetwise_ally_135/calculator/logic/models/calculator_model.dart';
import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class StatDetaele extends StatefulWidget {
  const StatDetaele(
      {super.key,
      required this.data,
      required this.budget,
      required this.exp,
      required this.left,
      required this.eventsOfTheDay});
  final String data;
  final double budget;
  final double exp;
  final double left;
  final List<CalculatorHiveModel> eventsOfTheDay;

  @override
  State<StatDetaele> createState() => _StatDetaeleState();
}

class _StatDetaeleState extends State<StatDetaele> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          widget.data,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.h,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 32.h),
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/graphicImage.png',
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.r,
                        vertical: 8.r,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xff151515),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.exp.toStringAsFixed(2).replaceAll(RegExp(r"(\.0*|0*)$"), "")}\$',
                            style: TextStyle(
                              fontSize: 16.h,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xffFF5252),
                            ),
                          ),
                          Text(
                            'Expense',
                            style: TextStyle(
                              fontSize: 12.h,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 38,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.r,
                          vertical: 8.r,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xff151515),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.left.toStringAsFixed(2).replaceAll(RegExp(r"(\.0*|0*)$"), "")}\$',
                              style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xff52FF63),
                              ),
                            ),
                            Text(
                              'Left',
                              style: TextStyle(
                                fontSize: 12.h,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Container(
                  padding: EdgeInsets.only(
                      top: 20.r, left: 20.r, right: 20.r, bottom: 4.r),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ...widget.eventsOfTheDay.map(
                        (event) => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat('hh:mm').format(event.date),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.h,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 3.h),
                                    Text(
                                      event.title,
                                      style: TextStyle(
                                        color: BaColors.grey555555,
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '-${event.sum.toStringAsFixed(2).replaceAll(RegExp(r"(\.0*|0*)$"), "")}\$',
                                  style: TextStyle(
                                    color: BaColors.redB91D1D,
                                    fontSize: 18.h,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
