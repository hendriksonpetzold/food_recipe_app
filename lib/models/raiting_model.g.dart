// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raiting_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RaitingModelAdapter extends TypeAdapter<RaitingModel> {
  @override
  final int typeId = 1;

  @override
  RaitingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RaitingModel(
      raiting: fields[0] as int,
      valid: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RaitingModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.raiting)
      ..writeByte(1)
      ..write(obj.valid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RaitingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
