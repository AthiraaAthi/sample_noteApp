// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotesModelAdapter extends TypeAdapter<NotesModel> {
  @override
  final int typeId = 1;

  @override
  NotesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotesModel(
      title: fields[1] as String,
      date: fields[2] as String,
      description: fields[3] as String,
      color: fields[4] as int,
      Category: '',
    );
  }

  @override
  void write(BinaryWriter writer, NotesModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
