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
      body: Column(
        children: <Widget>[
          Expanded(child: ReusableCard(title: 'Undistributed', subtitle: '18 items',
            //TODO: Include scroll bar
            //TODO: Include list that reflects the undistributed badges/patches
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
            ),),),
          //TODO: Replace with graph (probably line for every member?)
          //list of chart: https://google.github.io/charts/flutter/gallery.html
          //library: https://pub.dev/packages/charts_flutter
          Expanded(child: ReusableCard(title: 'This Week', subtitle: '', cardChild: Row(
            children: [
              Icon(Icons.attachment),
              SizedBox(width: 10.0),
              Text('Digital Game Design I', style: Theme.of(context).textTheme.bodyText1,),
            ],
          ),),),
          //TODO: Replace wtih graph (probably line; select members on the left?)
          Expanded(child: ReusableCard(title: 'This Month', subtitle: '', cardChild: Row(
            children: [
              Icon(Icons.attachment),
              SizedBox(width: 10.0),
              Text('Digital Game Design I', style: Theme.of(context).textTheme.bodyText1,),
            ],
          ),)),
          SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}

