// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemberAdapter extends TypeAdapter<Member> {
  @override
  final int typeId = 0;

  @override
  Member read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Member()
      ..name = fields[0] as String
      ..grade = fields[1] as Grade
      ..birthday = fields[2] as DateTime
      ..badgeTags = (fields[3] as List)?.cast<BadgeTag>();
  }

  @override
  void write(BinaryWriter writer, Member obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.grade)
      ..writeByte(2)
      ..write(obj.birthday)
      ..writeByte(3)
      ..write(obj.badgeTags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BadgeTagAdapter extends TypeAdapter<BadgeTag> {
  @override
  final int typeId = 1;

  @override
  BadgeTag read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BadgeTag()
      ..status = fields[0] as String
      ..completedRequirements = fields[1] as String
      ..dateAcquired = fields[2] as DateTime
      ..badge = fields[3] as Badge
      ..member = fields[4] as Member;
  }

  @override
  void write(BinaryWriter writer, BadgeTag obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.completedRequirements)
      ..writeByte(2)
      ..write(obj.dateAcquired)
      ..writeByte(3)
      ..write(obj.badge)
      ..writeByte(4)
      ..write(obj.member);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BadgeTagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BadgeAdapter extends TypeAdapter<Badge> {
  @override
  final int typeId = 2;

  @override
  Badge read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Badge()
      ..title = fields[0] as String
      ..subtitle = fields[1] as String
      ..description = fields[2] as String
      ..grade = fields[3] as Grade
      ..type = fields[4] as String
      ..requirements = (fields[5] as List)?.cast<String>()
      ..badgeTags = (fields[6] as List)?.cast<BadgeTag>();
  }

  @override
  void write(BinaryWriter writer, Badge obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.grade)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.requirements)
      ..writeByte(6)
      ..write(obj.badgeTags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BadgeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GradeAdapter extends TypeAdapter<Grade> {
  @override
  final int typeId = 3;

  @override
  Grade read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Grade()
      ..name = fields[0] as String
      ..members = (fields[1] as List)?.cast<Member>()
      ..badges = (fields[2] as List)?.cast<Badge>();
  }

  @override
  void write(BinaryWriter writer, Grade obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.members)
      ..writeByte(2)
      ..write(obj.badges);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GradeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
