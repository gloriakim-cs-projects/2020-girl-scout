import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/bottom_navigation.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/screens/dashboard.dart';
import 'package:girl_scout_simple/screens/members.dart';
import 'package:girl_scout_simple/screens/collection.dart';
import 'package:girl_scout_simple/screens/settings.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kBlackColor,
        accentColor: kGreenColor,
        //fontFamily: 'Georgia',
        textTheme: TextTheme(
          //(ex) Dashboard, Collection
          headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: kBlackColor),
          //(ex) Badge, In Progress, Digital Game Design
          headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: kBlackColor),
          //(ex) tab - DAISY, BROWNIE
          headline3: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: kBlackColor),
          //(ex) develop an app, annabelle enjoyed...
          bodyText1: TextStyle(
            fontSize: 15.0,
            color: kBlackColor,
          ),
          //(ex) 18 items, Coding for Good II
          bodyText2: TextStyle(
            fontSize: 10.0,
            color: kLightGreyColor,
          ),
        ),
      ),
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
