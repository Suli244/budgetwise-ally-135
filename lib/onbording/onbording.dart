import 'package:budgetwise_ally_135/onbording/widget/onboarding_item_widget.dart';
import 'package:budgetwise_ally_135/premium/premium_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/core/ba_motin.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/body_onboar.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 40.h,
              bottom: 130.h,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currantPage = value;
                  });
                },
                children: const [
                  OnBoardingItem(
                    imageOnBoar: 'assets/images/onboarding_one.png',
                    titleOnBoar: 'Create budget',
                    desOnBoar:
                        'For a specifiс category \nand maintain expense reports',
                  ),
                  OnBoardingItem(
                    imageOnBoar: 'assets/images/onboarding_two.png',
                    titleOnBoar: 'Savings & expenses',
                    desOnBoar:
                        'Calculate expenses from total budget \nand keep track of them',
                  ),
                  OnBoardingItem(
                    imageOnBoar: 'assets/images/onboarding_three.png',
                    titleOnBoar: 'Expense report',
                    desOnBoar:
                        'Break daily expenses into categories \nand know how much you saved',
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 60.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Row(
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: BaColors.whateFDFDFF,
                        dotColor: BaColors.grey555555,
                        dotHeight: 6,
                        dotWidth: 8,
                      ),
                    ),
                    const Spacer(),
                    BaMotion(
                      onPressed: () {
                        if (currantPage == 2) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PremiumScreen(),
                            ),
                            (protected) => false,
                          );
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: BaColors.blue525DFF,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0).r,
                          child: Icon(
                            Icons.arrow_forward,
                            size: 25.h,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
