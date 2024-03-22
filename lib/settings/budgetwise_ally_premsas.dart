// ignore_for_file: use_build_context_synchronously

import 'package:budgetwise_ally_135/core/con_bar.dart';
import 'package:budgetwise_ally_135/core/urls.dart';
import 'package:budgetwise_ally_135/settings/budgetwise_ally_adapsas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getBudgetwiseAllyPhbcsdcqq() async {
  final najkvasda = await SharedPreferences.getInstance();
  return najkvasda.getBool('ocevpoqwivs') ?? false;
}

Future<void> setBudgetwiseAllyPhbcsdcqq() async {
  final najkvasda = await SharedPreferences.getInstance();
  najkvasda.setBool('ocevpoqwivs', true);
}

Future<void> restoreBudgetwiseAllyPhbcsdcqq(BuildContext context) async {
  final currencyAdaptyRestoreResult =
      await BudgetwiseAllyAdapty().budgetwiseAllyRestorePurchases();
  if (currencyAdaptyRestoreResult?.accessLevels['premium']?.isActive ?? false) {
    final najkvasda = await SharedPreferences.getInstance();
    najkvasda.setBool("ocevpoqwivs", true);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const BaBottomBar()),
      (route) => false,
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Restore purchase'),
        content: const Text(
            'Your purchase is not found. Write to currencySupport: ${DocFF.s}'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => {Navigator.of(context).pop()},
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
