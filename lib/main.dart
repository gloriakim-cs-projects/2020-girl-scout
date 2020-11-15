import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/bottom_navigation.dart';
import 'package:girl_scout_simple/components/globals.dart';
import 'package:girl_scout_simple/components/database_operations.dart';
import 'package:girl_scout_simple/screens/dashboard.dart';
import 'package:girl_scout_simple/screens/members.dart';
import 'package:girl_scout_simple/screens/collection.dart';
import 'package:girl_scout_simple/screens/settings.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models.dart';

void main() async{
  await Hive.initFlutter();
  //Hive.registerAdapter(BadgeTagAdapter());
  //var badgeTags = await Hive.openBox<BadgeTag>('badgeTags');

  runApp(Home());
  GirlScoutDatabase db = GirlScoutDatabase();
  db.loadMembers(gradeEnum.DAISY);
  db.loadMembers(gradeEnum.BROWNIE);
  db.loadMembers(gradeEnum.JUNIOR);
  db.loadMembers(gradeEnum.CADETTE);
  db.loadMembers(gradeEnum.SENIOR);
  db.loadMembers(gradeEnum.AMBASSADOR);

  db.loadBadges(gradeEnum.DAISY);
  db.loadBadges(gradeEnum.BROWNIE);
  db.loadBadges(gradeEnum.JUNIOR);
  db.loadBadges(gradeEnum.CADETTE);
  db.loadBadges(gradeEnum.SENIOR);
  db.loadBadges(gradeEnum.AMBASSADOR);
  Hive.close();
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
