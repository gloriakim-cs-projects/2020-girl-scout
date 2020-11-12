import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';

class DefaultTheme {
  ThemeData get theme => ThemeData(
    primaryColor: kWhiteColor ,
    accentColor: kGreenColor,
    // scaffoldBackgroundColor: Color(0xFF2c2f33),
    //fontFamily: 'Georgia',
    textTheme: TextTheme(
      //(ex) Title - Dashboard, Collection
      headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: kBlackColor),
      //(ex) ReusableCard Title - Undistributed, Badge, This Month
      headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kBlackColor),
      //(ex) Setting - About Us
      headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kBlackColor),
      //(ex) develop an app, annabelle enjoyed...
      bodyText1: TextStyle(
        fontSize: 15.0,
        color: kBlackColor,
      ),
      //(ex) 18 items, Coding for Good II
      bodyText2: TextStyle(
        fontSize: 12.0,
        color: kLightGreyColor,
      ),
    ),
  );
}




