import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/screens/add.dart';
import 'package:girl_scout_simple/components/member_container.dart';
import 'globals.dart';

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

  final bool expanded;

  const AnimatedMemberCard({Key key, this.parentPage, this.name, this.team, this.grade, this.numBadgesCompleted, this.imageLocation, this.birthMonth, this.birthDay, this.birthYear, @required this.expanded}): super(key: key);

  @override
  _AnimatedMemberCard createState() => _AnimatedMemberCard();
}

class _AnimatedMemberCard extends State<AnimatedMemberCard> {
  @override
  Widget build(BuildContext context) {
    bool canEdit = !widget.expanded;
    return AnimatedContainer(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      width:  widget.expanded ? MediaQuery.of(context).size.width - 30 : MediaQuery.of(context).size.width * 0.7,
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
              Column(
                  children: <Widget>[
                    Image(image: AssetImage('images/example_photo.png')),

                  ]
              ),
              SizedBox(width: 10.0),
              Column(
                  children: <Widget>[
                    widget.parentPage == 'Setting' ? ExcludeTitle() : IncludeTitle(
                        title: widget.name, subtitle: widget.team, addIcon: false),
                    widget.team == '' ? SizedBox(height: 0.0) : SizedBox(height: 10.0),
                    widget.team == '' ? SizedBox() : Text(widget.team, style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1),
                    //team == '' ? SizedBox(height: 0.0) : SizedBox(height: 15.0),
                  ]
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



class ExcludeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}

class IncludeTitle extends StatelessWidget {

  IncludeTitle({@required this.title, @required this.subtitle, @required this.addIcon});
  final String title;
  final String subtitle;
  final bool addIcon;

  @override
  Widget build(BuildContext context) {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          //Note: Place empty container if add icon is not needed.
          addIcon == false ? Container() :
          GestureDetector( onTap: () {
            //move to add
            //TODO: Figure out why this is not working >>>>>> Navigator.pushNamed(context, Add.id);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Add(title: title)));
          }, child: Icon(Icons.add_circle), ),
        ],
      );
  }
}
