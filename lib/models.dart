import 'dart:core';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'models.g.dart';

@HiveType(typeId: 0)
class Member {
  @HiveField(0)
  String name;

  @HiveField(1)
  Grade grade;

  @HiveField(2)
  DateTime birthday;

  @HiveField(3)
  List<BadgeTag> badgeTags;
}

@HiveType(typeId: 1)
class BadgeTag {
  @HiveField(0)
  String status;

  @HiveField(1)
  String completedRequirements;

  @HiveField(2)
  DateTime dateAcquired; // should not store the time

  @HiveField(3)
  Badge badge;

  @HiveField(4)
  Member member;

  BadgeTag();
  BadgeTag.date(this.dateAcquired);
}

@HiveType(typeId: 2)
class Badge {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subtitle;

  @HiveField(2)
  String description;

  @HiveField(3)
  Grade grade;

  @HiveField(4)
  String type;

  @HiveField(5)
  List<String> requirements;

  @HiveField(6)
  List<BadgeTag> badgeTags;
}

@HiveType(typeId: 3)
class Grade {
  @HiveField(0)
  String name;

  @HiveField(1)
  List<Member> members;

  @HiveField(2)
  List<Badge> badges;
}