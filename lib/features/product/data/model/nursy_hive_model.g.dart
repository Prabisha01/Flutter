// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nursy_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NursyHiveModelAdapter extends TypeAdapter<NursyHiveModel> {
  @override
  final int typeId = 2;

  @override
  NursyHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NursyHiveModel(
      plantId: fields[0] as String,
      plantName: fields[1] as String,
      plantDescription: fields[4] as String,
      plantImageUrl: fields[5] as String,
      plantPrice: fields[2] as int,
      plantCategory: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NursyHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.plantId)
      ..writeByte(1)
      ..write(obj.plantName)
      ..writeByte(2)
      ..write(obj.plantPrice)
      ..writeByte(3)
      ..write(obj.plantCategory)
      ..writeByte(4)
      ..write(obj.plantDescription)
      ..writeByte(5)
      ..write(obj.plantImageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NursyHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
