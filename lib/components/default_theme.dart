import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';

class DefaultTheme {
  ThemeData get theme => ThemeData(
    primaryColor: kWhiteColor,
    accentColor: kGreenColor,
    //fontFamily: 'Georgia',
    textTheme: TextTheme(
      //(ex) Dashboard, Collection
      headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: kBlackColor),
      //(ex) Badge, In Progress, Digital Game Design
      headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kBlackColor),
      //(ex) tab - DAISY, BROWNIE
      headline3: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: kBlackColor),
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




