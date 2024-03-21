import 'dart:async';

import 'package:budgetwise_ally_135/calculator/budget/budget.dart';
import 'package:budgetwise_ally_135/calculator/logic/cubits/get_calculator_cubit/get_calculator_cubit.dart';
import 'package:budgetwise_ally_135/calculator/logic/models/calculator_model.dart';
import 'package:budgetwise_ally_135/statistics/stat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  double moneyLeft = 0;
  StreamSubscription<GetCalculatorState>? _calculatorSubscription;
  double totalExpenses = 0;
  @override
  void initState() {
    super.initState();
    svnsv();
    context.read<GetCalculatorCubit>().getAllCalculatorList();

    // _calculatorSubscription =
    //     context.read<GetCalculatorCubit>().stream.listen((state) {
    //   if (state is Success) {
    //     double totalExpenses =
    //         state.calculatorList.fold(0, (sum, event) => sum + event.sum);
    //     if (mounted) {
    //       setState(() {
    //         moneyLeft -= totalExpenses;
    //       });
    //     }
    //   }
    // });
  }

  @override
  void dispose() {
    _calculatorSubscription?.cancel();
    super.dispose();
  }

  Future<void> svnsv() async {
    double moneyLeftawait = await getBudgetUblndvd();
    setState(() {
      moneyLeft = moneyLeftawait;
    });
  }

  Map<DateTime, double> calculateTotalSumByDate(
      Map<DateTime, List<CalculatorHiveModel>> groupedEvents) {
    Map<DateTime, double> totalSumByDate = {};
    groupedEvents.forEach((date, events) {
      double totalSum = 0;
      for (var event in events) {
        totalSum += event.sum;
      }
      totalSumByDate[date] = totalSum;
    });
    return totalSumByDate;
  }

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
      body: BlocBuilder<GetCalculatorCubit, GetCalculatorState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Success) {
            final model = state.calculatorList;
            Map<DateTime, List<CalculatorHiveModel>> groupedEvents = {};
            for (var event in model) {
              DateTime dateWithoutTime =
                  DateTime(event.date.year, event.date.month, event.date.day);
              if (!groupedEvents.containsKey(dateWithoutTime)) {
                groupedEvents[dateWithoutTime] = [];
              }
              groupedEvents[dateWithoutTime]!.add(event);
            }
            List<DateTime> dates = groupedEvents.keys.toList();

            totalExpenses = model.fold(0, (sum, event) => sum + event.sum);

            return totalExpenses == 0
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/empty.png'),
                      ],
                    ),
                  )
                : ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      DateTime date = dates[index];
                      return StatWidget(
                        budget: moneyLeft,
                        exp: totalExpenses,
                        data: DateFormat('dd.MM.yyyy').format(date),
                        eventsOfTheDay: groupedEvents[date]!,
                      );
                    },
                    separatorBuilder: (_, i) => SizedBox(height: 16.h),
                    itemCount: dates.length);
          } else if (state is Error) {
            return Center(child: Text('An error occurred: ${state.error}'));
          } else {
            return const Center(child: Text('Unexpected state'));
          }
        },
      ),
    );
  }
}
