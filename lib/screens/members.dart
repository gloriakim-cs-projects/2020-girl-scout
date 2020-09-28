import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/components/images_by_grade.dart';
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
              //TODO: create a list of members and pass it
              ImagesByGrade(grade: "ALL", title: "Team YAY!", subtitle: "18 members", numBox: 1,),
              ImagesByGrade(grade: "DAISY", title: "Team YAY!", subtitle: "18 members", numBox: 1,),
              ImagesByGrade(grade: "BROWNIE", title: "Team YAY!", subtitle: "18 members", numBox: 1,),
              ImagesByGrade(grade: "JUNIOR", title: "Team YAY!", subtitle: "18 members", numBox: 1,),
              ImagesByGrade(grade: "CADETTE", title: "Team YAY!", subtitle: "18 members", numBox: 1,),
              ImagesByGrade(grade: "SENIOR", title: "Team YAY!", subtitle: "18 members", numBox: 1,),
              ImagesByGrade(grade: "AMBASSADOR", title: "Team YAY!", subtitle: "18 members", numBox: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
