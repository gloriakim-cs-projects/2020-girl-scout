import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:girl_scout_simple/models/member_globals.dart' as globals;
import 'package:girl_scout_simple/models/member_globals.dart';
import 'package:girl_scout_simple/models/member_container.dart';

class GirlScoutDatabase {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

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
}