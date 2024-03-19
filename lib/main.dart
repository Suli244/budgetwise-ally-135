import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BudgetWise Ally',
        home: child,
        theme: ThemeData(
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: BaColors.black101010,
          appBarTheme: const AppBarTheme(
            backgroundColor: BaColors.black101010,
          ),
        ),
      ),
      child: const SplashScreen(),
    );
  }
}
