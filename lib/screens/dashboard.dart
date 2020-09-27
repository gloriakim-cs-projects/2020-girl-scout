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

class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.title, this.subtitle, @required this.cardChild});
  String title;
  String subtitle;
  Widget cardChild;
  //List<String> list;

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
            SizedBox(height: 10.0),
            //TODO: show only if subtitle is not null ('')
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            //TODO: show only if subtitle is not null ('')
            SizedBox(height: 15.0),
            cardChild,
          ],
        ),
      ),
    );
  }
}