import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/all_constants.dart';
import 'package:girl_scout_simple/components/all_reusable_card.dart';
import 'package:girl_scout_simple/components/all_default_theme.dart';

class Dashboard extends StatefulWidget {
  static String id = '/Dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DefaultTheme().theme,
      home: Scaffold(
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 15),
                  Icon(Icons.group),
                  SizedBox(width: 3),
                  //TODO: Count the actual number of members
                  Text("13 members", style: Theme.of(context).textTheme.bodyText1,),
                  SizedBox(width: 10),
                  Icon(Icons.equalizer),
                  SizedBox(width: 3),
                  //TODO: Count the actual number of collections
                  Text("57 Collections", style: Theme.of(context).textTheme.bodyText1,)
                ],
              ),
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
                ),
              ),
              SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

