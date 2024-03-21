import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/statistics/stat_detaile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(
            'Statistics',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.h,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: const Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatWidget(),
            // Image.asset('assets/images/empty.png'),
          ],
        ),
      ),
    );
  }
}

class StatWidget extends StatelessWidget {
  const StatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StatDetaele(),
          ),
        );
      },
      child: Container(
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
              'TODAY',
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
                  '2 446 65\$',
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
                  '446 65\$',
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
