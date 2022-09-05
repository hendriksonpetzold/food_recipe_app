// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RatingModelAdapter extends TypeAdapter<RatingModel> {
  @override
  final int typeId = 1;

  @override
  RatingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RatingModel(
      rating: fields[0] as int,
      valid: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RatingModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.rating)
      ..writeByte(1)
      ..write(obj.valid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
