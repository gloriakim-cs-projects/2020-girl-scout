import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/components/images_by_grade.dart';
import 'package:girl_scout_simple/components/member_card.dart';
import 'package:girl_scout_simple/components/default_theme.dart';
import 'package:girl_scout_simple/components/member_edit_card.dart';
import 'package:girl_scout_simple/components/add_member_card.dart';

class Members extends StatefulWidget {
  static String id = '/Members';

  var members = new List<AnimatedMemberCard>();
  //members.add(AnimatedMemberCard(name: 'Christiana Ramey', team: 'Team! team'));

  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {

  bool expanded = true;

  @override
  Widget build(BuildContext context) {

    var memberWidgets = List<Widget>();
    for (var i = 0; i < 20; ++i ) {
      memberWidgets.add(new AnimatedMemberCard(name: 'name', team: 'team', expanded: expanded));
    }
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
              //search, grid, list, export.. do we need list and grid?
              GestureDetector(onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.search, color: kBlackColor,),),
              SizedBox(width: 10.0),
              GestureDetector(onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.apps, color: kBlackColor,),),
              SizedBox(width: 10.0),
              GestureDetector(onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.format_list_bulleted, color: kBlackColor,),),
              SizedBox(width: 10.0),
              GestureDetector(onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.get_app, color: kBlackColor,),),
              SizedBox(width: 10.0),
            ],
            backgroundColor: kWhiteColor,

          ),
          backgroundColor: kLightGreyBackgroundColor,
          //Note: ListView makes the page vertically scrollable.
          body: TabBarView(
            children: [
              //TODO: create a list of members and pass it
              ListView( //all
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Visibility(
                            visible: !expanded,
                            child: AnimatedAddCard(),
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedMemberCard(name: 'NewName', team: 'newTeam', expanded: expanded),
                          AnimatedEditCard(expanded: expanded),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedMemberCard(name: 'NewName', team: 'newTeam', expanded: expanded),
                          AnimatedEditCard(expanded: expanded),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedMemberCard(name: 'NewName', team: 'newTeam', expanded: expanded),
                          AnimatedEditCard(expanded: expanded),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedMemberCard(name: 'NewName', team: 'newTeam', expanded: expanded),
                          AnimatedEditCard(expanded: expanded),
                        ]
                    ),
                  ]),
              ListView( //daisy
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Visibility(
                            visible: !expanded,
                            child: AnimatedAddCard(),
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedMemberCard(name: 'NewName', team: 'newTeam', expanded: expanded),
                          AnimatedEditCard(expanded: expanded),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedMemberCard(name: 'NewName', team: 'newTeam', expanded: expanded),
                          AnimatedEditCard(expanded: expanded),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedMemberCard(name: 'NewName', team: 'newTeam', expanded: expanded),
                          AnimatedEditCard(expanded: expanded),
                        ]
                    ),
                  ]),
              ListView( //bownie
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Visibility(
                            visible: !expanded,
                            child: AnimatedAddCard(),
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedMemberCard(name: 'NewName', team: 'newTeam', expanded: expanded),
                          AnimatedEditCard(expanded: expanded),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedMemberCard(name: 'NewName', team: 'newTeam', expanded: expanded),
                          AnimatedEditCard(expanded: expanded),
                        ]
                    ),
                  ]),
              ListView( //junior
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Visibility(
                            visible: !expanded,
                            child: AnimatedAddCard(),
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedMemberCard(name: 'NewName', team: 'newTeam', expanded: expanded),
                          AnimatedEditCard(expanded: expanded),
                        ]
                    ),
                  ]),
              ListView( //cadette
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Visibility(
                            visible: !expanded,
                            child: AnimatedAddCard(),
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedMemberCard(name: 'NewName', team: 'newTeam', expanded: expanded),
                          AnimatedEditCard(expanded: expanded),
                        ]
                    ),
                  ]),
              ListView( //senior
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Visibility(
                            visible: !expanded,
                            child: AnimatedAddCard(),
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedMemberCard(name: 'NewName', team: 'newTeam', expanded: expanded),
                          AnimatedEditCard(expanded: expanded),
                        ]
                    ),
                  ]),
              ListView( //ambassador
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Visibility(
                            visible: !expanded,
                            child: AnimatedAddCard(),
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedMemberCard(name: 'NewName', team: 'newTeam', expanded: expanded),
                          AnimatedEditCard(expanded: expanded),
                        ]
                    ),
                  ]),
            ],
          ),
          floatingActionButton: FloatingActionButton( //pressing this creates options for editing members. its fancy. im sorry, i got carried away
            onPressed: () {
              //TODO manage team members with actions such as add, delete, move, and edit
              setState(() {
                expanded = !expanded;
              });
              // Add your onPressed code here!
            },
            child: Icon(Icons.edit),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
