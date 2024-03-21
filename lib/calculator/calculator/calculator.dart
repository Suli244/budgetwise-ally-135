import 'dart:async';

import 'package:budgetwise_ally_135/calculator/bottom_sheet/bottom_sheet_calculator.dart';
import 'package:budgetwise_ally_135/calculator/budget/budget.dart';
import 'package:budgetwise_ally_135/calculator/calculator/widget/money_left_widget.dart';
import 'package:budgetwise_ally_135/calculator/calculator/widget/toast.dart';
import 'package:budgetwise_ally_135/calculator/logic/cubits/get_calculator_cubit/get_calculator_cubit.dart';
import 'package:budgetwise_ally_135/calculator/logic/models/calculator_model.dart';
import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/core/ba_motin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double moneyLeft = 0;
  StreamSubscription<GetCalculatorState>? _calculatorSubscription;
  double totalExpenses = 0;
  @override
  void initState() {
    super.initState();
    svnsv();
    context.read<GetCalculatorCubit>().getAllCalculatorList();

    _calculatorSubscription =
        context.read<GetCalculatorCubit>().stream.listen((state) {
      if (state is Success) {
        double totalExpenses =
            state.calculatorList.fold(0, (sum, event) => sum + event.sum);
        if (mounted) {
          setState(() {
            moneyLeft -= totalExpenses;
          });
        }
      }
    });
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

  Future<void> addExpenseAndUpdateMoneyLeft() async {
    await bottomShetCalcu(context, (_) {
      context.read<GetCalculatorCubit>().getAllCalculatorList();
      if (moneyLeft > totalExpenses) {
        showCustomToastTrue(context);
      } else {
        showCustomToastFalse(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            return SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Column(
                children: [
                  MoneyLeftWidget(
                    sum: moneyLeft,
                    sum2: totalExpenses,
                  ),
                  SizedBox(height: 16.h),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        DateTime date = dates[index];
                        List<CalculatorHiveModel> eventsOfTheDay =
                            groupedEvents[date]!;

                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: index == dates.length - 1 ? 100.r : 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(20.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20).r,
                              color: BaColors.grey1c1c1c,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat('dd MMMM').format(date),
                                  style: TextStyle(
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w700,
                                    color: BaColors.grey555555,
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                ...eventsOfTheDay
                                    .map((event) => Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      DateFormat('hh:mm')
                                                          .format(event.date),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18.h,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(height: 3.h),
                                                    Text(
                                                      event.title,
                                                      style: TextStyle(
                                                        color:
                                                            BaColors.grey555555,
                                                        fontSize: 14.h,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '-${event.sum.toStringAsFixed(2).replaceAll(RegExp(r"(\.0*|0*)$"), "")}',
                                                  style: TextStyle(
                                                    color: BaColors.redB91D1D,
                                                    fontSize: 18.h,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height: 16
                                                    .h), // Отступ между событиями того же дня
                                          ],
                                        ))
                                    .toList(),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, i) => SizedBox(height: 16.h),
                      itemCount: dates.length),
                ],
              ),
            );
          } else if (state is Error) {
            return Center(child: Text('An error occurred: ${state.error}'));
          } else {
            return const Center(child: Text('Unexpected state'));
          }
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BaMotion(
          onPressed: () async {
            await addExpenseAndUpdateMoneyLeft();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100).r,
              color: BaColors.blue525DFF,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 35.w),
              child: Text(
                'Add Expense',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.h,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
