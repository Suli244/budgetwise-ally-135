import 'package:budgetwise_ally_135/calculator/logic/models/calculator_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class CalculatorRepo {
  Future<List<CalculatorHiveModel>> getCalculator();
  Future<void> setCalculator(CalculatorHiveModel calculatorHiveModel);
}

class CalculatorRepoImpl implements CalculatorRepo {
  @override
  Future<List<CalculatorHiveModel>> getCalculator() async {
    final calculatorBox =
        await Hive.openBox<CalculatorHiveModel>('CalculatorBox');
    return calculatorBox.values.toList();
  }

  @override
  Future<void> setCalculator(CalculatorHiveModel calculatorHiveModel) async {
    final calculatorBox =
        await Hive.openBox<CalculatorHiveModel>('CalculatorBox');
    await calculatorBox.add(calculatorHiveModel);
  }
}
