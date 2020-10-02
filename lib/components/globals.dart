
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