import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:girl_scout_simple/components/globals.dart' as globals;
import 'package:girl_scout_simple/components/globals.dart';
import 'package:girl_scout_simple/components/member_container.dart';
import 'package:girl_scout_simple/components/badge_container.dart';

///HUGE TODO - make the work with our actual local database. I am using our old file system for now so that we can present our apps functionality!!!

class GirlScoutDatabase {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

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

  Future<void> loadMembers(gradeEnum grade) async {
    try {
      List<String> contents;
      switch (grade)
      {
        case gradeEnum.DAISY:
          final file = await _daisyMemberFile;
          contents = await file.readAsLines();
          break;
        case gradeEnum.BROWNIE:
          final file = await _brownieMemberFile;
          contents = await file.readAsLines();
          break;
        case gradeEnum.JUNIOR:
          final file = await _juniorMemberFile;
          contents = await file.readAsLines();
          break;
        case gradeEnum.CADETTE:
          final file = await _cadetteMemberFile;
          contents = await file.readAsLines();
          break;
        case gradeEnum.SENIOR:
          final file = await _seniorMemberFile;
          contents = await file.readAsLines();
          break;
        case gradeEnum.AMBASSADOR:
          final file = await _ambassadorMemberFile;
          contents = await file.readAsLines();
          break;
      }
      for (var i in contents)
        {
          List<String> j = i.split(';');
          addScoutToList(grade, j[1], j[0], j[2], int.parse(j[3]), int.parse(j[4]), j[5]);
        }
    } catch (e) {
      print("Load failed");
      return;
    }
  }

  Future<void> loadBadges(gradeEnum grade) async {
    try {
      List<String> contents;
      switch (grade)
      {
        case gradeEnum.DAISY:
          final file = await _daisyBadgeFile;
          contents = await file.readAsLines();
          break;
        case gradeEnum.BROWNIE:
          final file = await _brownieBadgeFile;
          contents = await file.readAsLines();
          break;
        case gradeEnum.JUNIOR:
          final file = await _juniorBadgeFile;
          contents = await file.readAsLines();
          break;
        case gradeEnum.CADETTE:
          final file = await _cadetteBadgeFile;
          contents = await file.readAsLines();
          break;
        case gradeEnum.SENIOR:
          final file = await _seniorBadgeFile;
          contents = await file.readAsLines();
          break;
        case gradeEnum.AMBASSADOR:
          final file = await _ambassadorBadgeFile;
          contents = await file.readAsLines();
          break;
      }
      for (var i in contents)
      {
        List<String> j = i.split(';');
        List<String> requirements = j[2].split(':');
        addBadgeToList(grade, j[0], j[1], requirements, int.parse(j[3]), j[3]);
      }
    } catch (e) {
      print("Load failed");
      return;
    }
  }

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
}