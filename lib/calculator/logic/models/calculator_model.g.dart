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
      sum: fields[2] as double,
      date: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CalculatorHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.sum)
      ..writeByte(3)
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
