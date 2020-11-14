//Hopefully this file will contain all data for members and return a list of widgets
//I am not sure that this is acceptable, but i believe that having all members accessable at a global level is optimal for our program to function efficiently.
//this file contains 8 lists and a couple functions for placing scouts into those lists based on thier level.abstract
//return funtion of this file returns a list of rows, each holding a member and an edit widget. pretty neat right? flutter is great!
import 'dart:io';

import 'package:girl_scout_simple/components/database_operations.dart';
import 'package:girl_scout_simple/components/badge_card.dart';
import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/globals.dart' as globals;
import 'package:girl_scout_simple/components/globals.dart';
import 'package:flutter/widgets.dart';

//returns 0 if scout is placed in a list, this can be used my the add_member_card to verify that all fields are filled out
Row addBadgeToList(gradeEnum grade, String name, String description, List<String> requirements, int quantity, String photoLocation) {
  if (name == '') return null;
  GirlScoutDatabase db = GirlScoutDatabase();
  //all other variables should come from a list the user has to chose, meaning that there is no room for empty fields as all fields will be populated with the first choice.

  var newData = new BadgeData(
    grade: grade,
    name: name,
    description: description,
    requirements: requirements,
    quantity: quantity,
    photoLocation: photoLocation,
  );

  switch (grade) {
    case gradeEnum.DAISY:
      globals.daisyListBadge.add(newData);
      break;
    case gradeEnum.BROWNIE:
      globals.brownieListBadge.add(newData);
      break;
    case gradeEnum.JUNIOR:
      globals.juniorListBadge.add(newData);
      break;
    case gradeEnum.CADETTE:
      globals.cadetteListBadge.add(newData);
      break;
    case gradeEnum.SENIOR:
      globals.seniorListBadge.add(newData);
      break;
    case gradeEnum.AMBASSADOR:
      globals.ambassadorListBadge.add(newData);
      break;
  }
  globals.allListBadge.add(newData);
  db.writeBadgeList(grade); //this needs to work with HIVE
}

void deleteMember(gradeEnum grade, BadgeData data)
{
  GirlScoutDatabase db = GirlScoutDatabase();

  switch (grade)
  {
    case gradeEnum.DAISY:
      globals.daisyListBadge.remove(data);
      break;
    case gradeEnum.BROWNIE:
      globals.brownieListBadge.remove(data);
      break;
    case gradeEnum.JUNIOR:
      globals.juniorListBadge.remove(data);
      break;
    case gradeEnum.CADETTE:
      globals.cadetteListBadge.remove(data);
      break;
    case gradeEnum.SENIOR:
      globals.seniorListBadge.remove(data);
      break;
    case gradeEnum.AMBASSADOR:
      globals.ambassadorListBadge.remove(data);
      break;
  }
  globals.allListBadge.remove(data);
  final dir = Directory(data.photoLocation);
  dir.delete(recursive:true); //maybe change to false
  db.writeBadgeList(grade); //HIVE
}

//this function also add the add member card at the end of the list.
List<Widget> getBadgeWidgetList(gradeEnum grade) {
  var returnList = new List<Widget>();

  switch (grade) {
    case gradeEnum.DAISY:
    //add member data as widget
      for (var i in globals.daisyListBadge) {
        returnList.add(new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new BadgeCard(grade: i.grade,
                  name: i.name,
                  description: i.description,
                  requirements: i.requirements,
                  quantity: i.quantity,
                  photoLocation: i.photoLocation),
            ]));
      }
      break;
    case gradeEnum.BROWNIE:
      for (var i in globals.brownieListBadge) {
        returnList.add(new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new BadgeCard(grade: i.grade,
                  name: i.name,
                  description: i.description,
                  requirements: i.requirements,
                  quantity: i.quantity,
                  photoLocation: i.photoLocation),
            ]));
      }
      break;
    case gradeEnum.JUNIOR:
      for (var i in globals.juniorListBadge) {
        returnList.add(new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new BadgeCard(grade: i.grade,
                  name: i.name,
                  description: i.description,
                  requirements: i.requirements,
                  quantity: i.quantity,
                  photoLocation: i.photoLocation),
            ]));
      }
      break;
    case gradeEnum.CADETTE:
      for (var i in globals.cadetteListBadge) {
        returnList.add(new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new BadgeCard(grade: i.grade,
                  name: i.name,
                  description: i.description,
                  requirements: i.requirements,
                  quantity: i.quantity,
                  photoLocation: i.photoLocation),
            ]));
      }
      break;
    case gradeEnum.SENIOR:
      for (var i in globals.seniorListBadge) {
        returnList.add(new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new BadgeCard(grade: i.grade,
                  name: i.name,
                  description: i.description,
                  requirements: i.requirements,
                  quantity: i.quantity,
                  photoLocation: i.photoLocation),
            ]));
      }
      break;
    case gradeEnum.AMBASSADOR:
      for (var i in globals.ambassadorListBadge) {
        returnList.add(new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new BadgeCard(grade: i.grade,
                  name: i.name,
                  description: i.description,
                  requirements: i.requirements,
                  quantity: i.quantity,
                  photoLocation: i.photoLocation),
            ]));
      }
      break;
    case gradeEnum.ALL:
      for (var i in globals.allListBadge) {
        returnList.add(new Row(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new BadgeCard(grade: i.grade,
                  name: i.name,
                  description: i.description,
                  requirements: i.requirements,
                  quantity: i.quantity,
                  photoLocation: i.photoLocation),
            ]));
      }
      break;
  }
  return returnList;
}
