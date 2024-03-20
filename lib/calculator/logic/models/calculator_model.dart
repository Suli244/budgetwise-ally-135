import 'package:hive_flutter/hive_flutter.dart';

part 'calculator_model.g.dart';

@HiveType(typeId: 0)
class CalculatorHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  double sum;
  @HiveField(3)
  DateTime date;

  CalculatorHiveModel({
    required this.id,
    required this.title,
    required this.sum,
    required this.date,
  });
  @override
  String toString() {
    return '$id, $title, $date';
  }
}
