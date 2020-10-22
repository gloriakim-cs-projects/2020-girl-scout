import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/all_bottom_navigation.dart';
import 'package:girl_scout_simple/models/member_globals.dart';
import 'package:girl_scout_simple/databases/member_database_operations.dart';
import 'package:girl_scout_simple/screens/dashboard.dart';
import 'package:girl_scout_simple/screens/members.dart';
import 'package:girl_scout_simple/screens/collection.dart';
import 'package:girl_scout_simple/screens/settings.dart';

void main() {
  runApp(Home());
  GirlScoutDatabase db = GirlScoutDatabase();
  db.loadMembers(gradeEnum.DAISY);
  db.loadMembers(gradeEnum.BROWNIE);
  db.loadMembers(gradeEnum.JUNIOR);
  db.loadMembers(gradeEnum.CADETTE);
  db.loadMembers(gradeEnum.SENIOR);
  db.loadMembers(gradeEnum.AMBASSADOR);
}

class Home extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavigation(),
      routes: {
        BottomNavigation.id: (context) => BottomNavigation(),
        Dashboard.id: (context) => Dashboard(),
        Members.id: (context) => new Members(),
        Collection.id: (context) => Collection(),
        Settings.id: (context) => Settings(),
      },
    );
  }
}
