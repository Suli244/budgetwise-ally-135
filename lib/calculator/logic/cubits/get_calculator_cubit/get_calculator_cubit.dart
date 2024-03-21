import 'package:budgetwise_ally_135/calculator/logic/models/calculator_model.dart';
import 'package:budgetwise_ally_135/calculator/logic/repositories/calculator_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class GetCalculatorState {
  const GetCalculatorState();
}

class Loading extends GetCalculatorState {
  const Loading();
}

class Error extends GetCalculatorState {
  final String error;

  const Error(this.error);
}

class Success extends GetCalculatorState {
  final List<CalculatorHiveModel> calculatorList;

  const Success(this.calculatorList);
}

class GetCalculatorCubit extends Cubit<GetCalculatorState> {
  final CalculatorRepo repo;
  GetCalculatorCubit(this.repo) : super(const Loading());
  Future<void> getAllCalculatorList() async {
    emit(const Loading());
    try {
      final calculatorList = await repo.getCalculator();
      emit(Success(calculatorList));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
