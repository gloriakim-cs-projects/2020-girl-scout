import 'package:flutter/material.dart';
import 'package:girl_scout_simple/constants.dart';

class Dashboard extends StatefulWidget {

  static String id = '/Dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
//    return MaterialApp(
//      theme: ThemeData(
//        accentColor: kGreenColor,
//        scaffoldBackgroundColor: kLightGreyBackgroundColor,
//      ),
    );
  }
}
