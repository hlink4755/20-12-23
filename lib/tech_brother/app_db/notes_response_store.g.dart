// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_response_store.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotesResponseStoreAdapter extends TypeAdapter<NotesResponseStore> {
  @override
  final int typeId = 0;

  @override
  NotesResponseStore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotesResponseStore(
      tile: fields[0] as String,
      desc: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotesResponseStore obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.tile)
      ..writeByte(1)
      ..write(obj.desc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesResponseStoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
