import 'package:budgetwise_ally_135/calculator/logic/models/calculator_model.dart';
import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/statistics/stat_detaile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatWidget extends StatefulWidget {
  const StatWidget({
    super.key,
    required this.budget,
    required this.exp,
    required this.data,
    required this.eventsOfTheDay,
  });
  final String data;
  final double budget;
  final double exp;
  final List<CalculatorHiveModel> eventsOfTheDay;

  @override
  State<StatWidget> createState() => _StatWidgetState();
}

class _StatWidgetState extends State<StatWidget> {
  double _saved = 0; // Variable to store the calculated remaining amount

  @override
  void initState() {
    super.initState();
    _saved = widget.budget - widget.exp; // Calculate the remaining amount
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StatDetaele(
                data: widget.data,
                budget: widget.budget,
                exp: widget.exp,
                left: _saved,
                eventsOfTheDay: widget.eventsOfTheDay),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.r),
        padding: EdgeInsets.all(20.r),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data,
              style: TextStyle(
                color: BaColors.grey555555,
                fontSize: 14.h,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Budget',
                  style: TextStyle(
                    color: BaColors.whate,
                    fontSize: 18.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${widget.budget.toStringAsFixed(2).replaceAll(RegExp(r"(\.0*|0*)$"), "")}\$',
                  style: TextStyle(
                    color: BaColors.whate,
                    fontSize: 18.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Divider(
              height: 32.h,
              color: BaColors.grey555555,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Saved',
                  style: TextStyle(
                    color: BaColors.whate,
                    fontSize: 18.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${_saved.toStringAsFixed(2).replaceAll(RegExp(r"(\.0*|0*)$"), "")}\$',
                  style: TextStyle(
                    color: BaColors.green52FF63,
                    fontSize: 18.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
