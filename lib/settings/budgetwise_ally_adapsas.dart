import 'dart:async' show Future;
import 'package:adapty_flutter/adapty_flutter.dart';

class BudgetwiseAllyAdapty {
  void Function(AdaptyError)? onBudgetwiseAllyAdaptyErrorOccurred;
  void Function(Object)? onBudgetwiseAllyUnknownErrorOccurred;

  final budgetwiseAllyAdapty = Adapty();

  static final BudgetwiseAllyAdapty _budgetwiseAllyInstance = BudgetwiseAllyAdapty._internal();

  factory BudgetwiseAllyAdapty() {
    return _budgetwiseAllyInstance;
  }

  BudgetwiseAllyAdapty._internal();

  Future<AdaptyProfile?> learCall() async {
    try {
      final nvaiwiwe = await budgetwiseAllyAdapty.getProfile();
      return nvaiwiwe;
    } on AdaptyError catch (adaptyError) {
      onBudgetwiseAllyAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onBudgetwiseAllyUnknownErrorOccurred?.call(e);
    }
    return null;
  }

  Future<void> initializeBudgetwiseAllyAdapty() async {
    try {
      budgetwiseAllyAdapty.setLogLevel(AdaptyLogLevel.verbose);
      budgetwiseAllyAdapty.activate();
    } on AdaptyError catch (adaptyError) {
      onBudgetwiseAllyAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onBudgetwiseAllyUnknownErrorOccurred?.call(e);
    }
  }

  Future<AdaptyPaywall?> budgetwiseAllyGetPaywall(
    String budgetwiseAllyPaywallId,
  ) async {
    try {
      final budgetwiseAllynvaiwiwe = await budgetwiseAllyAdapty.getPaywall(
        placementId: budgetwiseAllyPaywallId,
        loadTimeout: const Duration(seconds: 5),
      );
      return budgetwiseAllynvaiwiwe;
    } on AdaptyError catch (adaptyError) {
      onBudgetwiseAllyAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onBudgetwiseAllyUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<List<AdaptyPaywallProduct>?>budgetwiseAllyGetPaywallProducts(
    AdaptyPaywall budgetwiseAllyPaywall,
  ) async {
    try {
      final budgetwiseAllynvaiwiwe =
          await budgetwiseAllyAdapty.getPaywallProducts(paywall: budgetwiseAllyPaywall);
      return budgetwiseAllynvaiwiwe;
    } on AdaptyError catch (adaptyError) {
      onBudgetwiseAllyAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onBudgetwiseAllyUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<AdaptyProfile?> budgetwiseAllyMakePurchase(
      AdaptyPaywallProduct budgetwiseAllyProduct) async {
    try {
      final budgetwiseAllynvaiwiwe =
          await budgetwiseAllyAdapty.makePurchase(product: budgetwiseAllyProduct);
      return budgetwiseAllynvaiwiwe;
    } on AdaptyError catch (adaptyError) {
      onBudgetwiseAllyAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onBudgetwiseAllyUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<AdaptyProfile?> budgetwiseAllyRestorePurchases() async {
    try {
      final budgetwiseAllynvaiwiwe = await budgetwiseAllyAdapty.restorePurchases();

      return budgetwiseAllynvaiwiwe;
    } on AdaptyError catch (adaptyError) {
      onBudgetwiseAllyAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onBudgetwiseAllyUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<bool> budgetwiseAllyHasPremiumStatus() async {
    try {
      final budgetwiseAllyProfile = await budgetwiseAllyAdapty.getProfile();
      if (budgetwiseAllyProfile.accessLevels['premium']?.isActive ?? false) {
        return true;
      }
    } on AdaptyError catch (adaptyError) {
      onBudgetwiseAllyAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onBudgetwiseAllyUnknownErrorOccurred?.call(e);
    }

    return false;
  }
}
