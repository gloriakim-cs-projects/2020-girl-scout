import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/components/member_by_grade.dart';
import 'package:girl_scout_simple/components/reusable_card.dart';
import 'package:girl_scout_simple/components/default_theme.dart';

class Members extends StatefulWidget {
  static String id = '/Members';
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
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
              'Members',
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
            ],
            backgroundColor: kWhiteColor,
            
          ),
          backgroundColor: kLightGreyBackgroundColor,
          //Note: ListView makes the page vertically scrollable.
          body: TabBarView(
            children: [
              //TODO: create a list of members and pass it
              MemberByGrade(grade: "ALL"),
              MemberByGrade(grade: "DAISY"),
              MemberByGrade(grade: "BROWNIE"),
              MemberByGrade(grade: "JUNIOR"),
              MemberByGrade(grade: "CADETTE"),
              MemberByGrade(grade: "SENIOR"),
              MemberByGrade(grade: "AMBASSADOR"),
            ],
          ),
        ),
      ),
    );
  }
}
