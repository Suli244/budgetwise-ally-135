// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalculatorHiveModelAdapter extends TypeAdapter<CalculatorHiveModel> {
  @override
  final int typeId = 0;

  @override
  CalculatorHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalculatorHiveModel(
      id: fields[0] as int,
      title: fields[1] as String,
      podhod: fields[2] as int,
      povtor: fields[3] as int,
      masStaryad: fields[4] as int,
      dayWeek: fields[5] as int,
      exerciseStatus: fields[6] as String,
      photo: fields[7] as String,
      date: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CalculatorHiveModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.podhod)
      ..writeByte(3)
      ..write(obj.povtor)
      ..writeByte(4)
      ..write(obj.masStaryad)
      ..writeByte(5)
      ..write(obj.dayWeek)
      ..writeByte(6)
      ..write(obj.exerciseStatus)
      ..writeByte(7)
      ..write(obj.photo)
      ..writeByte(8)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculatorHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
