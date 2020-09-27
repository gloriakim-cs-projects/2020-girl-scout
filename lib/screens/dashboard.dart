import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';

class Dashboard extends StatefulWidget {
  static String id = '/Dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        backgroundColor: kWhiteColor,
      ),
      backgroundColor: kLightGreyBackgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(child: Container(
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
          ),),
          Expanded(child: Container(
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
          ),),
          Expanded(child: Container(
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
          ),),
          SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}


/*
child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Undistributed',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 10.0),
                  Text('18 items',
                    style: Theme.of(context).textTheme.bodyText2,),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      Icon(Icons.attachment),
                      SizedBox(width: 10.0),
                      Text('Digital Game Design I', style: Theme.of(context).textTheme.bodyText1,),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attachment),
                      SizedBox(width: 10.0),
                      Text('Digital Game Design II', style: Theme.of(context).textTheme.bodyText1,),
                    ],
                  ),
                ],
              ),
            ),
 */
