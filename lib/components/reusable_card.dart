import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.title, this.subtitle, @required this.cardChild});
  final String title;
  final String subtitle;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            ),
            //show only if subtitle is not null ('')
            subtitle == '' ? SizedBox(height: 0.0) : SizedBox(height: 10.0),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            //show only if subtitle is not null ('')
            subtitle == '' ? SizedBox(height: 0.0) : SizedBox(height: 15.0),
            cardChild,
          ],
        ),
      ),
    );
  }
}