import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/core/ba_motin.dart';
import 'package:budgetwise_ally_135/core/con_bar.dart';
import 'package:budgetwise_ally_135/premium/widget/premium_item_widget.dart';
import 'package:budgetwise_ally_135/premium/widget/rest_wid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key, this.isClose = false});
  final bool isClose;
  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaColors.black101010,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15.h),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    if (widget.isClose) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BaBottomBar(
                            indexScr: 0,
                          ),
                        ),
                        (protected) => false,
                      );
                    }
                  },
                  child: Image.asset(
                    'assets/images/close.png',
                    width: 16.w,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/refresh.png',
                        width: 18.w,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Restore Purchases',
                        style: TextStyle(
                          fontSize: 14.h,
                          height: 0,
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 45.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Image.asset(
              'assets/images/premium.png',
              width: 255.w,
              height: 249.08.h,
            ),
          ),
          SizedBox(height: 65.h),
          FittedBox(
            child: Text(
              'Get Premium',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.h,
                height: 0,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 23.h),
          const PreItWid(
            imagSvg: 'assets/icons/one.svg',
            text: 'Statistics section',
          ),
          SizedBox(height: 13.h),
          const PreItWid(
            imagSvg: 'assets/icons/two.svg',
            text: 'No ADs',
          ),
          SizedBox(height: 35.h),
          BaMotion(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const BaBottomBar(
                    indexScr: 0,
                  ),
                ),
                (protected) => false,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: BaColors.blue525DFF,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 60.w,
                ),
                child: Text(
                  'Buy Premium \$0.99',
                  style: TextStyle(
                    color: BaColors.whate,
                    fontSize: 18.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 23.h),
          RestBut(
            onPrePrivPol: () {},
            onPreTerm: () {},
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
