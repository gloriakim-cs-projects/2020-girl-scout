import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/default_theme.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/components/images_by_grade.dart';

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
              //TODO: create the list of collection and pass it
              //TODO: count the number of boxes for each grade
              ImagesByGrade(grade: "ALL", title: "Badge", subtitle: "18 collections", numBox: 1,),
              ImagesByGrade(grade: "DAISY", title: "Badge", subtitle: "18 collections", numBox: 1,),
              ImagesByGrade(grade: "BROWNIE", title: "Badge", subtitle: "18 collections", numBox: 1,),
              ImagesByGrade(grade: "JUNIOR", title: "Badge", subtitle: "18 collections", numBox: 1,),
              ImagesByGrade(grade: "CADETTE", title: "Badge", subtitle: "18 collections", numBox: 1,),
              ImagesByGrade(grade: "SENIOR", title: "Badge", subtitle: "18 collections", numBox: 1,),
              ImagesByGrade(grade: "AMBASSADOR", title: "Badge", subtitle: "18 collections", numBox: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
