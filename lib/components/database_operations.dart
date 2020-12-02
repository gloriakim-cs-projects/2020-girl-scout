import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

//import 'package:girl_scout_simple/components/globals.dart' as globals;
import 'package:girl_scout_simple/components/globals.dart';
import 'package:girl_scout_simple/components/member_container.dart';
import 'package:girl_scout_simple/components/badge_container.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:girl_scout_simple/models.dart';

///HUGE TODO - make the work with our actual local database. I am using our old file system for now so that we can present our apps functionality!!!


class GirlScoutDatabase {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<void> initDB() async{
    WidgetsFlutterBinding.ensureInitialized();
    final appDBDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDBDirectory.path);
    Hive.registerAdapter(BadgeTagAdapter());
    Hive.registerAdapter(BadgeAdapter());
    Hive.registerAdapter(GradeAdapter());
    Hive.registerAdapter(MemberAdapter());
    Hive.registerAdapter(gradeEnumAdapter());

    ///*
    await Hive.openBox('members');
    await Hive.openBox('badgeTags');
    await Hive.openBox('grades');
    await Hive.openBox('badges');

    await db.loadMembers();
    await db.loadBadges();
    print('finished loading members');
    // */
    print('adding grades');
    var gradeBox = Hive.box('grades');
    var badgeBox = Hive.box('badges');
    if (gradeBox.isEmpty) {
      gradeBox.put('Daisy', Grade.name(gradeEnum.DAISY));
      gradeBox.put('Brownie', Grade.name(gradeEnum.BROWNIE));
      gradeBox.put('Junior', Grade.name(gradeEnum.JUNIOR));
      gradeBox.put('Cadette', Grade.name(gradeEnum.CADETTE));
      gradeBox.put('Senior', Grade.name(gradeEnum.SENIOR));
      gradeBox.put('Ambassador', Grade.name(gradeEnum.AMBASSADOR));
    }

  }

  Future<void> loadMembers() async{
    try {
      var memberBox = Hive.box('members');

      for (var i in memberBox.values)
        {
          Grade grade = i.grade.first;
          addScoutToList(describeEnum(grade.name), i.team, i.name, monthNames[i.birthday.month], i.birthday.day, i.birthday.year, i.photoPath);
        }
    }
    catch (e) {
      print("Load member failed");
      return;
    }
  }

  void addMember(String grade, String team, String name, String birthMonth, int birthDay, int birthYear, String photoPath) {
    //try {
    print('adding member');
      var memberBox = Hive.box('members'); //open boxes
      var gradeBox = Hive.box('grades');

      var gradeLink = HiveList(gradeBox); // create a hive list to hold 1 grade
      print(gradeLink);
      gradeLink.add(gradeBox.get(grade)); // add the member's grade to the list
      var date = DateTime(birthYear, monthNums[birthMonth], birthDay); // create a datetime object from string inputs
      Member member = Member(name, gradeLink, team, date, photoPath); // create member object based on data
      memberBox.add(member); // add member to db
      /*
    }
    catch (e) {
      print(e);
      print("Add member failed");
      return;
    }

       */
  }

  void deleteAllMembers()
  {
    var memberBox = Hive.box('members');
    memberBox.clear();
  }

  void deleteMember(String grade, String team, String name, String birthMonth, int birthDay, int birthYear, String photoPath) {
    try {
      var memberBox = Hive.box('members'); //open boxes
      var gradeBox = Hive.box('grades');

      var gradeLink = HiveList(gradeBox); // create a hive list to hold 1 grade
      gradeLink.add(gradeBox.get(grade)); // add the member's grade to the list
      var date = DateTime(birthYear, monthNums[birthMonth], birthDay); // create a datetime object from string inputs
      Member member = Member(name, gradeLink, team, date, photoPath); // create member object based on data
      memberBox.add(member); // add member to db
    }
    catch (e) {
      print("Add member failed");
      return;
    }
  }

  Future<void> loadBadges() async {
    try {
      var badgeBox = Hive.box('badges');

      for (var i in badgeBox.values)
      {
        Grade grade = i.grade.first;
        addBadgeToList(describeEnum(grade.name), i.name, i.description, i.requirements, i.photoPath);
      }
    } catch (e) {
      print("Load failed");
      return;
    }
  }

  void addBadge(String grade, String name, String description, List<String> requirements, String photoLocation) {
    try {
      var badgeBox = Hive.box('badges'); //open boxes
      var gradeBox = Hive.box('grades');

      var gradeLink = HiveList(gradeBox); // create a hive list of grades
      gradeLink.add(gradeBox.get(grade)); // add the member's grade to the list
      Badge badge = Badge(name, description, gradeLink, requirements, photoLocation); // create member object based on data
      badgeBox.add(badge); // add member to db
    }
    catch (e) {
      print("Add member failed");
      return;
    }
  }
}