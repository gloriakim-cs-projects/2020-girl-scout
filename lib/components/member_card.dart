import 'dart:io';

import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/models.dart';

//import 'globals.dart';

class AnimatedMemberCard extends StatefulWidget {
  final String parentPage;
  final String name;
  final String team;
  final gradeEnum grade;
  final String birthMonth;
  final int birthDay;
  final int birthYear;
  final int numBadgesCompleted;
  final String imageLocation;

  const AnimatedMemberCard({Key key, this.parentPage, this.name, this.team, this.grade, this.numBadgesCompleted, this.imageLocation, this.birthMonth, this.birthDay, this.birthYear}): super(key: key);

  @override
  _AnimatedMemberCard createState() => _AnimatedMemberCard();
}

class _AnimatedMemberCard extends State<AnimatedMemberCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      width: MediaQuery.of(context).size.width * 0.91,
      decoration: BoxDecoration(
        color: kWhiteColor,
        border: Border.all(
          color: kLightGreyColor,
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      duration: Duration(milliseconds: 100),

      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //parentPage == 'Setting' ? ExcludeTitle() : IncludeTitle(title: title, subtitle: subtitle),
              //show only if subtitle is not null ('')
              Expanded(
                flex: 4,
                  child: Image.file(File(widget.imageLocation)),
              ),
              SizedBox(width: 10.0),
              Expanded(
                flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(widget.name, style: Theme
                        .of(context)
                        .textTheme
                        .headline2,),
                    Text(widget.team, style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1,),
                  ]
              ),
              ),
              SizedBox(height: 20.0),
              Column(
                  children: <Widget>[
//TODO add number of bagdes completed in an elegant way, can be a button that appears when scout is ready to be moved to higher rank
                  ]
              ),
            ],
          ),
          onTap: (){
            setState((){
              //update();
            });
            //TODO create funtion so that if state is triggered, bring up edit page with populated information for tapped scout
          }
        ),
      ),
    );
  }
}