import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/bottom_navigation.dart';
import 'package:girl_scout_simple/screens/dashboard.dart';
import 'package:girl_scout_simple/screens/members.dart';
import 'package:girl_scout_simple/screens/collection.dart';
import 'package:girl_scout_simple/screens/settings.dart';

import 'screens/dashboard.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: ThemeData(
//        primaryColor: kDartGreyColor,
//        scaffoldBackgroundColor: Color(0xFFF1F1F1),
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
      initialRoute: BottomNavigation.id,
      routes: {
        BottomNavigation.id: (context) => BottomNavigation(),
        Dashboard.id: (context) => Dashboard(),
        Members.id: (context) => Members(),
        Collection.id: (context) => Collection(),
        Settings.id: (context) => Settings(),
      },
    );
  }
}
