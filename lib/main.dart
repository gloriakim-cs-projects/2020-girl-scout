import 'package:flutter/material.dart';
import 'package:girl_scout_simple/constants.dart';
import 'package:girl_scout_simple/screens/dashboard.dart';
import 'package:girl_scout_simple/screens/members.dart';
import 'package:girl_scout_simple/screens/collection.dart';
import 'package:girl_scout_simple/screens/settings.dart';

void main() {
  runApp(GirlScout());
}

class GirlScout extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kDartGreyColor,
        scaffoldBackgroundColor: Color(0xFFF1F1F1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Dashboard.id,
      routes: {
        Dashboard.id: (context) => Dashboard(),
        Members.id: (context) => Members(),
        Collection.id: (context) => Collection(),
        Settings.id: (context) => Settings(),
      },
    );
  }
}