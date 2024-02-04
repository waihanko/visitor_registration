// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_data_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisitorDataVoAdapter extends TypeAdapter<VisitorDataVo> {
  @override
  final int typeId = 0;

  @override
  VisitorDataVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisitorDataVo(
      name: fields[1] as String?,
      businessEmail: fields[2] as String?,
      companyName: fields[3] as String?,
      designation: fields[4] as String?,
      businessNumber: fields[5] as String?,
      nrc: fields[6] as String?,
      isOnQuarantine: fields[7] as bool?,
      isContactWithCovidPerson: fields[8] as bool?,
      isSufferFlu: fields[10] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, VisitorDataVo obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.businessEmail)
      ..writeByte(3)
      ..write(obj.companyName)
      ..writeByte(4)
      ..write(obj.designation)
      ..writeByte(5)
      ..write(obj.businessNumber)
      ..writeByte(6)
      ..write(obj.nrc)
      ..writeByte(7)
      ..write(obj.isOnQuarantine)
      ..writeByte(8)
      ..write(obj.isContactWithCovidPerson)
      ..writeByte(10)
      ..write(obj.isSufferFlu);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitorDataVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
