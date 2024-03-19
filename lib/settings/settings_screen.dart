import 'package:budgetwise_ally_135/settings/widget/settings_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(
            'Settings',
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
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
        child: Column(
          children: [
            SetItWid(
              text: 'Get Premium',
              onPressed: () {},
              isIcon: false,
            ),
            SizedBox(height: 16.h),
            SetItWid(
              text: 'Privacy Policy',
              onPressed: () {},
            ),
            SizedBox(height: 16.h),
            SetItWid(
              text: 'Terms of Use',
              onPressed: () {},
            ),
            SizedBox(height: 16.h),
            SetItWid(
              text: 'Support',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
