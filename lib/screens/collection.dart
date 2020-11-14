import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/default_theme.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/components/images_by_grade.dart';

import 'package:girl_scout_simple/components/globals.dart';
import 'package:girl_scout_simple/components/badge_container.dart';

class Collection extends StatefulWidget {
  static String id = '/Collection';

  @override
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DefaultTheme().theme,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: "ALL"),
                Tab(text: "DAISY"),
                Tab(text: "BROWNIE"),
                Tab(text: "JUNIOR"),
                Tab(text: "CADETTE"),
                Tab(text: "SENIOR"),
                Tab(text: "AMBASSADOR"),
              ],
            ),
            title: const Text(
              'Badges',
              style: TextStyle(
                color: kBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            actions: <Widget>[
              GestureDetector( onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.search, color: kBlackColor,), ),
              SizedBox(width: 10.0),
              GestureDetector( onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.apps, color: kBlackColor,), ),
              SizedBox(width: 10.0),
              GestureDetector( onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.format_list_bulleted, color: kBlackColor,), ),
              SizedBox(width: 10.0),
              GestureDetector( onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.get_app, color: kBlackColor,), ),
              SizedBox(width: 10.0),
            ],
            backgroundColor: kWhiteColor,

          ),
          backgroundColor: kLightGreyBackgroundColor,
          //Note: ListView makes the page vertically scrollable.
          body: TabBarView(
            children: [
              ListView( //all
                  children: getBadgeWidgetList(gradeEnum.ALL)),
              ListView( //daisy
                  children: getBadgeWidgetList(gradeEnum.DAISY)),
              ListView( //bownie
                  children: getBadgeWidgetList(gradeEnum.BROWNIE)),
              ListView( //cadette
                  children: getBadgeWidgetList(gradeEnum.JUNIOR)),
              ListView( //senior
                  children: getBadgeWidgetList(gradeEnum.CADETTE)),
              ListView( //senior
                  children: getBadgeWidgetList(gradeEnum.SENIOR)),
              ListView( //ambassador
                  children: getBadgeWidgetList(gradeEnum.AMBASSADOR)),
            ],
          ),
        ),
      ),
    );
  }
}
