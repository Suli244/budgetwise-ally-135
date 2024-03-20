import 'package:budgetwise_ally_135/calculator/logic/models/calculator_model.dart';
import 'package:budgetwise_ally_135/calculator/logic/repositories/calculator_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SetCalculatorState {
  const SetCalculatorState();

  bool get isLoading => false;
}

class Initial extends SetCalculatorState {
  const Initial();
}

class Loading extends SetCalculatorState {
  const Loading();

  @override
  bool get isLoading => true;
}

class Error extends SetCalculatorState {
  final String error;

  const Error(this.error);
}

class Success extends SetCalculatorState {
  const Success();
}

class SetCalculatorCubit extends Cubit<SetCalculatorState> {
  final CalculatorRepo repo;

  SetCalculatorCubit(this.repo) : super(const Initial());

  Future<void> setCalculator(CalculatorHiveModel calculatorHiveModel) async {
    emit(const Loading());
    try {
      await repo.setCalculator(calculatorHiveModel);
      emit(const Success());
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
