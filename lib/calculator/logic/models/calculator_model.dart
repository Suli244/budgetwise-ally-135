import 'package:hive_flutter/hive_flutter.dart';

part 'calculator_model.g.dart';

@HiveType(typeId: 0)
class CalculatorHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int podhod;
  @HiveField(3)
  int povtor;
  @HiveField(4)
  int masStaryad;
  @HiveField(5)
  int dayWeek;
  @HiveField(6)
  String exerciseStatus;
  @HiveField(7)
  String photo;
  @HiveField(8)
  DateTime date;

  CalculatorHiveModel({
    required this.id,
    required this.title,
    required this.podhod,
    required this.povtor,
    required this.masStaryad,
    required this.dayWeek,
    required this.exerciseStatus,
    required this.photo,
    required this.date,
  });
  @override
  String toString() {
    return '$id, $title, $podhod, $povtor, $masStaryad, $dayWeek, $exerciseStatus, $photo, $date';
  }
}
