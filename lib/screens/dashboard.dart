import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/components/reusable_card.dart';

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
      //Note: ListView makes the page vertically scrollable.
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //TODO: Include list that reflects the undistributed badges/patches
            ReusableCard(title: 'Undistributed', subtitle: '18 items', addIcon: false,
              cardChild: Column(
                children: [
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
              ),),
            //TODO: Replace with graph (probably line for every member?)
            //list of chart: https://google.github.io/charts/flutter/gallery.html
            //library: https://pub.dev/packages/charts_flutter
            ReusableCard(title: 'This Week', subtitle: '', addIcon: false,
              cardChild: Column(
                children: [
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
              ),),
            //TODO: Replace with graph (probably line for every member?)
            ReusableCard(title: 'This Month', subtitle: '', addIcon: false,
              cardChild: Column(
                children: [
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
              ),),
            SizedBox(height: 10.0,),
          ],
        ),
      ),
    );
  }
}

