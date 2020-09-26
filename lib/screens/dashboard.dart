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
          ),
        ),
        backgroundColor: kWhiteColor,
      ),
      backgroundColor: kLightGreyBackgroundColor,
      body: Container(
        margin: const EdgeInsets.all(15.0),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'title',
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
