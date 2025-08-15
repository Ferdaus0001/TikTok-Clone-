// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_modle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PDFPageAdapter extends TypeAdapter<PDFPage> {
  @override
  final int typeId = 0;

  @override
  PDFPage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PDFPage(
      pageTitle: fields[0] as String,
      pageContent: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PDFPage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.pageTitle)
      ..writeByte(1)
      ..write(obj.pageContent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PDFPageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
