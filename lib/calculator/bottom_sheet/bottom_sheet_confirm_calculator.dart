// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:budgetwise_ally_135/calculator/bottom_sheet/widget/selec_item_widget.dart';
import 'package:budgetwise_ally_135/calculator/logic/cubits/set_calculator_cubit/set_calculator_cubit.dart';
import 'package:budgetwise_ally_135/calculator/logic/models/calculator_model.dart';
import 'package:budgetwise_ally_135/calculator/logic/repositories/calculator_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budgetwise_ally_135/core/ba_colors.dart';
import 'package:budgetwise_ally_135/core/ba_motin.dart';

Future bottomShetConfirmCalcu(
    BuildContext context, String text, ValueChanged onTtt) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return ShowCal(
        text: text,
        onTtt: onTtt,
      );
    },
  );
}

class ShowCal extends StatefulWidget {
  const ShowCal({
    super.key,
    required this.text,
    required this.onTtt,
  });
  final String text;
  final ValueChanged onTtt;
  @override
  State<ShowCal> createState() => _ShowCalState();
}

class _ShowCalState extends State<ShowCal> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetCalculatorCubit(CalculatorRepoImpl()),
      child: BlocConsumer<SetCalculatorCubit, SetCalculatorState>(
        listener: (context, state) {
          if (state is Success) {
            Navigator.pop(context);
            widget.onTtt('');
          } else if (state is Error) {
            final errorMessage = state.error;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: $errorMessage')),
            );
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            height: 560.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20).r,
                topRight: const Radius.circular(20).r,
              ),
              color: BaColors.grey1c1c1c,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 16.h, left: 16.h, right: 16.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      BaMotion(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: BaColors.grey555555,
                          size: 25,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Select budget category',
                        style: TextStyle(
                          fontSize: 18.h,
                          fontWeight: FontWeight.w600,
                          height: 0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      const Opacity(
                        opacity: 0,
                        child: Column(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_rounded,
                              color: BaColors.grey555555,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  const Divider(thickness: 1, color: BaColors.grey333333),
                  SizedBox(height: 10.h),
                  SelecWidgetItme(
                    titleLeft: 'Bills',
                    titleRig: 'Clothings',
                    onPressedLeft: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Bills',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                    onPressedRig: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Clothings',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                  ),
                  SizedBox(height: 9.h),
                  SelecWidgetItme(
                    titleLeft: 'Gifts',
                    titleRig: 'Education',
                    onPressedLeft: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Gifts',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                    onPressedRig: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Education',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                  ),
                  SizedBox(height: 9.h),
                  SelecWidgetItme(
                    titleLeft: 'Entertainment',
                    titleRig: 'Fitness',
                    onPressedLeft: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Entertainment',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                    onPressedRig: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Fitness',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                  ),
                  SizedBox(height: 9.h),
                  SelecWidgetItme(
                    titleLeft: 'Food',
                    titleRig: 'Health',
                    onPressedLeft: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Food',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                    onPressedRig: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Health',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                  ),
                  SizedBox(height: 9.h),
                  SelecWidgetItme(
                    titleLeft: 'Furniture',
                    titleRig: 'Pet',
                    onPressedLeft: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Furniture',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                    onPressedRig: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Pet',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                  ),
                  SizedBox(height: 9.h),
                  SelecWidgetItme(
                    titleLeft: 'Shopping',
                    titleRig: 'Transportation',
                    onPressedLeft: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Shopping',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                    onPressedRig: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Transportation',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                  ),
                  SizedBox(height: 9.h),
                  SelecWidgetItme(
                    titleLeft: 'Travel',
                    titleRig: 'Other',
                    onPressedLeft: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Travel',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                    onPressedRig: () {
                      CalculatorHiveModel calculatorHiveModel =
                          CalculatorHiveModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              title: 'Other',
                              sum: double.tryParse(widget.text) ?? 0,
                              date: DateTime.now());
                      context
                          .read<SetCalculatorCubit>()
                          .setCalculator(calculatorHiveModel);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
