import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/components/reusable_card.dart';
import 'package:girl_scout_simple/components/default_theme.dart';

class Members extends StatefulWidget {
  static String id = '/Members';
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DefaultTheme().theme,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: "ALL"),
                Tab(text: "DAISY"),
                Tab(text: "BROWNIE"),
                Tab(text: "JUNIOR"),
                Tab(text: "CADETTE"),
                Tab(text: "SENIOR"),
                Tab(text: "AMBASSADOR"),
              ],
            ),
            title: const Text(
              'Members',
              style: TextStyle(
                color: kBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            actions: <Widget>[
              GestureDetector( onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.search, color: kBlackColor,), ),
              SizedBox(width: 10.0),
              GestureDetector( onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.apps, color: kBlackColor,), ),
              SizedBox(width: 10.0),
              GestureDetector( onTap: () {
                //TODO: implement functionality
              }, child: Icon(Icons.format_list_bulleted, color: kBlackColor,), ),
            ],
            backgroundColor: kWhiteColor,
            
          ),
          backgroundColor: kLightGreyBackgroundColor,
          //Note: ListView makes the page vertically scrollable.
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_car),
            ],
          ),
//          body: SingleChildScrollView(
//            child: Column(
//              children: <Widget>[
//                //TODO: Generate more rows & Image widgets as adding more images
//                //TODO: If images are not found, replace the space with a grey circle with a member's name
//                //TODO: To make photos evently spaced, all I can think of is to create a transparent circle to replace a photo
//                //TODO: Resize the uploaded photos into a same-sized circle
//                ReusableCard(title: 'Team YAY!', subtitle: '18 members', addIcon: true,
//                  cardChild: Column(
//                    children: <Widget>[
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[
//                          Image(image: AssetImage('images/example_photo.png')),
//                          Image(image: AssetImage('images/example_photo.png')),
//                          Image(image: AssetImage('images/example_photo.png')),
//                        ],
//                      ),
//                      SizedBox(height: 10.0),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[
//                          Image(image: AssetImage('images/example_photo.png')),
//                          Image(image: AssetImage('images/example_image.png')),
//                          Image(image: AssetImage('images/example_photo.png')),
//                        ],
//                      ),
//                      SizedBox(height: 10.0),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[
//                          Image(image: AssetImage('images/example_photo.png')),
//                          Image(image: AssetImage('images/example_photo.png')),
//                          Image(image: AssetImage('images/example_photo.png')),
//                        ],
//                      ),
//                    ],
//                  ),),
//              ],
//            ),
//          ),
        ),
      ),
    );
  }
}
