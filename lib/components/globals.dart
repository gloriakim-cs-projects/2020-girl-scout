
//I might also enumerate the months of the year, but idk.
import 'package:flutter/widgets.dart';

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

  Map<String, dynamic> toMap()
  {
    return{
      'name' : name,
      'team' : team,
      'birthMonth' : birthMonth,
      'birthDay' : birthDay,
      'birthYear' : birthYear,
      'photoPath' : photoLocation,
    };
  }
}

class BadgeData {
  gradeEnum grade;
  String name;
  String description;
  List<String> requirements;
  int quantity;
  String photoLocation; //idk if we need this

  BadgeData(
      {this.grade, this.name, this.description, this.requirements, this.quantity, this.photoLocation});

  Map<String, dynamic> toMap()
  {
    return{
      'name' : name,
      'description' : description,
      'requirements' : requirements,
      'quantity' : quantity,
      'photoPath' : photoLocation,
    };
  }
}

int count = 0;
var allList = new List<Data>();
var daisyList = new List<Data>();
var brownieList = new List<Data>();
var juniorList = new List<Data>();
var cadetteList = new List<Data>();
var seniorList = new List<Data>();
var ambassadorList = new List<Data>();

var allListBadge = new List<BadgeData>();
var daisyListBadge = new List<BadgeData>();
var brownieListBadge = new List<BadgeData>();
var juniorListBadge = new List<BadgeData>();
var cadetteListBadge = new List<BadgeData>();
var seniorListBadge = new List<BadgeData>();
var ambassadorListBadge = new List<BadgeData>();

var allListPatch = new List<BadgeData>();
var daisyListPatch = new List<BadgeData>();
var brownieListPatch = new List<BadgeData>();
var juniorListPatch = new List<BadgeData>();
var cadetteListPatch = new List<BadgeData>();
var seniorListPatch = new List<BadgeData>();
var ambassadorListPatch = new List<BadgeData>();