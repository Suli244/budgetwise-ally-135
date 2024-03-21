import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatDetaele extends StatefulWidget {
  const StatDetaele({super.key});

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
          '01.01.2001',
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
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
