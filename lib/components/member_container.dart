//Hopefully this file will contain all data for members and return a list of widgets
//I am not sure that this is acceptable, but i believe that having all members accessable at a global level is optimal for our program to function efficiently.
//this file contains 8 lists and a couple functions for placing scouts into those lists based on thier level.abstract
//return funtion of this file returns a list of rows, each holding a member and an edit widget. pretty neat right? flutter is great!
import 'package:girl_scout_simple/components/member_card.dart';
import 'package:girl_scout_simple/components/member_edit_card.dart';
import 'package:girl_scout_simple/components/add_member_card.dart';
import 'package:flutter/material.dart';

//I might also enumerate the months of the year, but idk.
enum gradeEnum {
  DAISY,
  BROWNIE,
  JUNIOR,
  CADETTE,
  SENIOR,
  AMBASSADOR,
  ALL,
}

class Data {
  gradeEnum grade;
  String name;
  String team;
  String birthMonth;
  int birthDay;
  int birthYear;
  String photoLocation;

  Data(
      {this.grade, this.name, this.team, this.birthMonth, this.birthDay, this.birthYear, this.photoLocation});
}

var allList = new List<Data>();
var daisyList = new List<Data>();
var brownieList = new List<Data>();
var juniorList = new List<Data>();
var cadetteList = new List<Data>();
var seniorList = new List<Data>();
var ambassadorList = new List<Data>();

//returns 0 if scout is placed in a list, this can be used my the add_member_card to verify that all fields are filled out
int addScoutToList(gradeEnum grade, String team, String name, String birthMonth, int birthDay, int birthYear, String photoLocation) {
  if (name == '') return 1;
  //all other variables should come from a list the user has to chose, meaning that there is no room for empty fields as all fields will be populated with the first choice.

  switch (grade) {
    case gradeEnum.DAISY:
      daisyList.add(new Data(
        grade: grade,
        name: name,
        team: team,
        birthMonth: birthMonth,
        birthDay: birthDay,
        birthYear: birthYear,
        photoLocation: photoLocation,
      ));
      break;

    case gradeEnum.BROWNIE:
      brownieList.add(new Data(
        grade: grade,
        name: name,
        team: team,
        birthMonth: birthMonth,
        birthDay: birthDay,
        birthYear: birthYear,
        photoLocation: photoLocation,
      ));
      break;

    case gradeEnum.JUNIOR:
      juniorList.add(new Data(
        grade: grade,
        name: name,
        team: team,
        birthMonth: birthMonth,
        birthDay: birthDay,
        birthYear: birthYear,
        photoLocation: photoLocation,
      ));
      break;

    case gradeEnum.CADETTE:
      cadetteList.add(new Data(
        grade: grade,
        name: name,
        team: team,
        birthMonth: birthMonth,
        birthDay: birthDay,
        birthYear: birthYear,
        photoLocation: photoLocation,
      ));
      break;

    case gradeEnum.SENIOR:
      seniorList.add(new Data(
        grade: grade,
        name: name,
        team: team,
        birthMonth: birthMonth,
        birthDay: birthDay,
        birthYear: birthYear,
        photoLocation: photoLocation,
      ));
      break;

    case gradeEnum.AMBASSADOR:
      ambassadorList.add(new Data(
        grade: grade,
        name: name,
        team: team,
        birthMonth: birthMonth,
        birthDay: birthDay,
        birthYear: birthYear,
        photoLocation: photoLocation,
      ));
      break;

    default:
      return 1;
  }
  allList.add(new Data(
    grade: grade,
    name: name,
    team: team,
    birthMonth: birthMonth,
    birthDay: birthDay,
    birthYear: birthYear,
    photoLocation: photoLocation,
  ));

  return 0;
}

//this function also add the add member card at the end of the list.
List<Widget> getMemberWidgetList(gradeEnum grade, bool expanded) {
  var returnList = new List<Widget>();

  switch (grade) {
    case gradeEnum.DAISY:
    //add member data as widget
      for (var i in daisyList) {
        returnList.add(new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new AnimatedMemberCard(name: i.name,
                  team: i.team,
                  grade: i.grade,
                  birthMonth: i.birthMonth,
                  birthDay: i.birthDay,
                  birthYear: i.birthYear,
                  expanded: expanded),
              new AnimatedEditCard(expanded: expanded)
            ]));
      }
      break;
    case gradeEnum.BROWNIE:
      for (var i in brownieList) {
        returnList.add(new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new AnimatedMemberCard(name: i.name,
                  team: i.team,
                  grade: i.grade,
                  birthMonth: i.birthMonth,
                  birthDay: i.birthDay,
                  birthYear: i.birthYear,
                  expanded: expanded),
              new AnimatedEditCard(expanded: expanded)
            ]));
      }
      break;
    case gradeEnum.JUNIOR:
      for (var i in juniorList) {
        returnList.add(new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new AnimatedMemberCard(name: i.name,
                  team: i.team,
                  grade: i.grade,
                  birthMonth: i.birthMonth,
                  birthDay: i.birthDay,
                  birthYear: i.birthYear,
                  expanded: expanded),
              new AnimatedEditCard(expanded: expanded)
            ]));
      }
      break;
    case gradeEnum.CADETTE:
      for (var i in cadetteList) {
        returnList.add(new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new AnimatedMemberCard(name: i.name,
                  team: i.team,
                  grade: i.grade,
                  birthMonth: i.birthMonth,
                  birthDay: i.birthDay,
                  birthYear: i.birthYear,
                  expanded: expanded),
              new AnimatedEditCard(expanded: expanded)
            ]));
      }
      break;
    case gradeEnum.SENIOR:
      for (var i in seniorList) {
        returnList.add(new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new AnimatedMemberCard(name: i.name,
                  team: i.team,
                  grade: i.grade,
                  birthMonth: i.birthMonth,
                  birthDay: i.birthDay,
                  birthYear: i.birthYear,
                  expanded: expanded),
              new AnimatedEditCard(expanded: expanded)
            ]));
      }
      break;
    case gradeEnum.AMBASSADOR:
      for (var i in ambassadorList) {
        returnList.add(new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new AnimatedMemberCard(name: i.name,
                  team: i.team,
                  grade: i.grade,
                  birthMonth: i.birthMonth,
                  birthDay: i.birthDay,
                  birthYear: i.birthYear,
                  expanded: expanded),
              new AnimatedEditCard(expanded: expanded)
            ]));
      }
      break;
    case gradeEnum.ALL:
      for (var i in allList) {
        returnList.add(new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new AnimatedMemberCard(name: i.name,
                  team: i.team,
                  grade: i.grade,
                  birthMonth: i.birthMonth,
                  birthDay: i.birthDay,
                  birthYear: i.birthYear,
                  expanded: expanded),
              new AnimatedEditCard(expanded: expanded)
            ]));
      }
      break;
  }
  //add 'add member' card
  returnList.add(Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: !expanded,
          child: AnimatedAddCard(),
        )
      ]
  ));

  return returnList;
}
