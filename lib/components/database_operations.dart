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
/*
  ///MEMBERS
  Future<File> get _daisyMemberFile async {
    final path = await _localPath;
    print(path);
    return File('$path/daisyMembers.txt');
  }
  Future<File> get _brownieMemberFile async {
    final path = await _localPath;
    print(path);
    return File('$path/brownieMembers.txt');
  }
  Future<File> get _juniorMemberFile async {
    final path = await _localPath;
    return File('$path/juniorMembers.txt');
  }
  Future<File> get _cadetteMemberFile async {
    final path = await _localPath;
    return File('$path/cadetteMembers.txt');
  }
  Future<File> get _seniorMemberFile async {
    final path = await _localPath;
    return File('$path/seniorMembers.txt');
  }
  Future<File> get _ambassadorMemberFile async {
    final path = await _localPath;
    return File('$path/ambassadorMembers.txt');
  }

  ///BADGES
  Future<File> get _daisyBadgeFile async {
    final path = await _localPath;
    print(path);
    return File('$path/daisyBadges.txt');
  }
  Future<File> get _brownieBadgeFile async {
    final path = await _localPath;
    print(path);
    return File('$path/brownieBadges.txt');
  }
  Future<File> get _juniorBadgeFile async {
    final path = await _localPath;
    return File('$path/juniorBadges.txt');
  }
  Future<File> get _cadetteBadgeFile async {
    final path = await _localPath;
    return File('$path/cadetteBadges.txt');
  }
  Future<File> get _seniorBadgeFile async {
    final path = await _localPath;
    return File('$path/seniorBadges.txt');
  }
  Future<File> get _ambassadorBadgeFile async {
    final path = await _localPath;
    return File('$path/ambassadorBadges.txt');
  }
*/
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
    print('finished loading members');
    await db.loadBadges();
    print('finished loading badges');

    // */
    print('adding grades');
    var gradeBox = Hive.box('grades');
    var badgeBox = Hive.box('badges');
    var memberBox = Hive.box('members');

    await badgeBox.clear();
    await memberBox.clear();
    await gradeBox.clear();

    imageCache.clear();
    if (gradeBox.isEmpty) {
      var memberBox = Hive.box('members');
      var badgeBox = Hive.box('badges');
      var memberHiveList = HiveList(memberBox);
      var badgeHiveList = HiveList(badgeBox);

      gradeBox.put('Daisy', Grade(gradeEnum.DAISY, memberHiveList, badgeHiveList));
      gradeBox.put('Brownie', Grade(gradeEnum.BROWNIE, memberHiveList, badgeHiveList));
      gradeBox.put('Junior', Grade(gradeEnum.JUNIOR, memberHiveList, badgeHiveList));
      gradeBox.put('Cadette', Grade(gradeEnum.CADETTE, memberHiveList, badgeHiveList));
      gradeBox.put('Senior', Grade(gradeEnum.SENIOR, memberHiveList, badgeHiveList));
      gradeBox.put('Ambassador', Grade(gradeEnum.AMBASSADOR, memberHiveList, badgeHiveList));
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

  Future<void> addMember (String grade, String team, String name, String birthMonth, int birthDay, int birthYear, String photoPath) async{
    //try {
    print('adding member');
      var memberBox = Hive.box('members'); //open boxes
      var gradeBox = Hive.box('grades');

      var gradeLink = HiveList(gradeBox); // create a hive list to hold 1 grade
      print(gradeBox.get(grade));
      gradeLink.add(gradeBox.get(grade)); // add the member's grade to the list
      var date = DateTime(birthYear, monthNums[birthMonth], birthDay); // create a datetime object from string inputs
      Member member = Member(name, gradeLink, team, date, photoPath); // create member object based on data
      memberBox.put(name, member); // add member to db

      Grade gradeObj = gradeBox.get(grade); // get grade from db
      gradeObj.members.add(member); // add member to grades
      /*
    }
    catch (e) {
      print(e);
      print("Add member failed");
      return;
    }

       */
  }

  Member getMember (String name) {
    //try {
    print('getting member');
    var memberBox = Hive.box('members'); //open member box

    Member member = memberBox.get(name); // get member
    return member;
    /*
    }
    catch (e) {
      print(e);
      print("Add member failed");
      return;
    }

       */
  }

  Future<void> deleteMember(String grade, String team, String name, String birthMonth, int birthDay, int birthYear, String photoPath) async{
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

  Future<void> addBadge(String grade, String name, String description, List<String> requirements, String photoLocation) async{
    try {
      var badgeBox = Hive.box('badges'); //open boxes
      var gradeBox = Hive.box('grades');

      var gradeLink = HiveList(gradeBox); // create a hive list of grades
      gradeLink.add(gradeBox.get(grade)); // add the member's grade to the list
      Badge badge = Badge(name, description, gradeLink, requirements, photoLocation); // create member object based on data
      badgeBox.add(badge); // add member to db

      Grade gradeObj = gradeBox.get(grade); // get grade from db
      gradeObj.badges.add(badge); // add member to grades
    }
    catch (e) {
      print("Add member failed");
      return;
    }
  }


  List<dynamic> getMemberBadges (String name) {
    //try {
    print('getting member\'s badges');

    var badgeBox = Hive.box('badges');
    var gradeBox = Hive.box('grades');

    Member member = getMember(name); //get member
    Grade memberGrade = member.grade.first; // get member's grade
    print(memberGrade);
    var badgeGradeList = memberGrade.badges; // get badges for member's grade
    print(badgeGradeList);
    if (badgeGradeList != null) {
      print('returning member\'s badges');
      return badgeGradeList.toList();
    }
    print('member has no badges');
    return null;

    /*
    }
    catch (e) {
      print(e);
      print("Add member failed");
      return;
    }

       */
  }

  /*
  Future<File> writeMemberList(gradeEnum grade) async {
    String temp = '';
    switch (grade) {
      case gradeEnum.DAISY:
        final file = await _daisyMemberFile;
        for (var i in globals.daisyList) {
          temp += i.name;
          temp += ';';
          temp += i.team;
          temp += ';';
          temp += i.birthMonth;
          temp += ';';
          temp += i.birthDay.toString();
          temp += ';';
          temp += i.birthYear.toString();
          temp += ';';
          temp += i.photoLocation;
          temp += '\n';
        }
        return file.writeAsString(temp);
      case gradeEnum.BROWNIE:

        final file = await _brownieMemberFile;
        for (var i in globals.brownieList) {
          temp += i.name;
          temp += ';';
          temp += i.team;
          temp += ';';
          temp += i.birthMonth;
          temp += ';';
          temp += i.birthDay.toString();
          temp += ';';
          temp += i.birthYear.toString();
          temp += ';';
          temp += i.photoLocation;
          temp += '\n';
        }
        return file.writeAsString(temp);
      case gradeEnum.JUNIOR:
        final file = await _juniorMemberFile;
        for (var i in globals.juniorList) {
          temp += i.name;
          temp += ';';
          temp += i.team;
          temp += ';';
          temp += i.birthMonth;
          temp += ';';
          temp += i.birthDay.toString();
          temp += ';';
          temp += i.birthYear.toString();
          temp += ';';
          temp += i.photoLocation;
          temp += '\n';
        }
        return file.writeAsString(temp);
      case gradeEnum.CADETTE:
        final file = await _cadetteMemberFile;
        for (var i in globals.cadetteList) {
          temp += i.name;
          temp += ';';
          temp += i.team;
          temp += ';';
          temp += i.birthMonth;
          temp += ';';
          temp += i.birthDay.toString();
          temp += ';';
          temp += i.birthYear.toString();
          temp += ';';
          temp += i.photoLocation;
          temp += '\n';
        }
        return file.writeAsString(temp);
      case gradeEnum.SENIOR:
        final file = await _seniorMemberFile;
        for (var i in globals.seniorList) {
          temp += i.name;
          temp += ';';
          temp += i.team;
          temp += ';';
          temp += i.birthMonth;
          temp += ';';
          temp += i.birthDay.toString();
          temp += ';';
          temp += i.birthYear.toString();
          temp += ';';
          temp += i.photoLocation;
          temp += '\n';
        }
        return file.writeAsString(temp);
      case gradeEnum.AMBASSADOR:
        final file = await _ambassadorMemberFile;
        for (var i in globals.ambassadorList) {
          temp += i.name;
          temp += ';';
          temp += i.team;
          temp += ';';
          temp += i.birthMonth;
          temp += ';';
          temp += i.birthDay.toString();
          temp += ';';
          temp += i.birthYear.toString();
          temp += ';';
          temp += i.photoLocation;
          temp += '\n';
        }
        return file.writeAsString(temp);
    }
  }

  //TODO condense code --- only if we stick witht he file system.
  Future<File> writeBadgeList(gradeEnum grade) async {
    String temp = '';
    switch (grade) {
      case gradeEnum.DAISY:
        final file = await _daisyBadgeFile;
        for (var i in globals.daisyListBadge) {
          temp += i.name;
          temp += ';';
          temp += i.description;
          temp += ';';
          for (var j in i.requirements) {
            temp += j;
            temp += ':';
          }
          if (temp != null && temp.length > 0) {
            temp = temp.substring(0, temp.length - 1);
          }
          temp += ';';
          temp += i.quantity.toString();
          temp += ';';
          temp += i.photoLocation;
          temp += '\n';
        }
        return file.writeAsString(temp);
      case gradeEnum.BROWNIE:

        final file = await _brownieBadgeFile;
        for (var i in globals.brownieListBadge) {
          temp += i.name;
          temp += ';';
          temp += i.description;
          temp += ';';
          for (var j in i.requirements) {
            temp += j;
            temp += ':';
          }
          if (temp != null && temp.length > 0) {
            temp = temp.substring(0, temp.length - 1);
          }
          temp += ';';
          temp += i.quantity.toString();
          temp += ';';
          temp += i.photoLocation;
          temp += '\n';
        }
        return file.writeAsString(temp);
      case gradeEnum.JUNIOR:
        final file = await _juniorBadgeFile;
        for (var i in globals.juniorListBadge) {
          temp += i.name;
          temp += ';';
          temp += i.description;
          temp += ';';
          for (var j in i.requirements) {
            temp += j;
            temp += ':';
          }
          if (temp != null && temp.length > 0) {
            temp = temp.substring(0, temp.length - 1);
          }
          temp += ';';
          temp += i.quantity.toString();
          temp += ';';
          temp += i.photoLocation;
          temp += '\n';
        }
        return file.writeAsString(temp);
      case gradeEnum.CADETTE:
        final file = await _cadetteBadgeFile;
        for (var i in globals.cadetteListBadge) {
          temp += i.name;
          temp += ';';
          temp += i.description;
          temp += ';';
          for (var j in i.requirements) {
            temp += j;
            temp += ':';
          }
          if (temp != null && temp.length > 0) {
            temp = temp.substring(0, temp.length - 1);
          }
          temp += ';';
          temp += i.quantity.toString();
          temp += ';';
          temp += i.photoLocation;
          temp += '\n';
        }
        return file.writeAsString(temp);
      case gradeEnum.SENIOR:
        final file = await _seniorBadgeFile;
        for (var i in globals.seniorListBadge) {
          temp += i.name;
          temp += ';';
          temp += i.description;
          temp += ';';
          for (var j in i.requirements) {
            temp += j;
            temp += ':';
          }
          if (temp != null && temp.length > 0) {
            temp = temp.substring(0, temp.length - 1);
          }
          temp += ';';
          temp += i.quantity.toString();
          temp += ';';
          temp += i.photoLocation;
          temp += '\n';
        }
        return file.writeAsString(temp);
      case gradeEnum.AMBASSADOR:
        final file = await _ambassadorBadgeFile;
        for (var i in globals.ambassadorListBadge) {
          temp += i.name;
          temp += ';';
          temp += i.description;
          temp += ';';
          for (var j in i.requirements) {
            temp += j;
            temp += ':';
          }
          if (temp != null && temp.length > 0) {
            temp = temp.substring(0, temp.length - 1);
          }
          temp += ';';
          temp += i.quantity.toString();
          temp += ';';
          temp += i.photoLocation;
          temp += '\n';
        }
        return file.writeAsString(temp);
    }
  }
  */
}