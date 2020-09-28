import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/default_theme.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/components/reusable_card.dart';

class Settings extends StatefulWidget {
  static String id = '/Settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DefaultTheme().theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Setting',
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
              ReusableCard(parentPage: 'Setting', title: '', subtitle: '', addIcon: false,
                  cardChild: Column(
                    children: [
                      //TODO: modify the subtitle to reflect actual name
                      SettingFlatButton(title: "Theme",),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(height: 1, color: kLightGreyColor,),
                      ),
                      SettingFlatButton(title: "Notification"),
                    ],
                  ),
              ),
              ReusableCard(parentPage: 'Setting', title: '', subtitle: '', addIcon: false,
                cardChild: Column(
                  children: [
                    //TODO: modify the subtitle to reflect actual name
                    SettingFlatButton(title: "iCloud Backup",),
                  ],
                ),
              ),
              ReusableCard(parentPage: 'Setting', title: '', subtitle: '', addIcon: false,
                cardChild: Column(
                  children: [
                    //TODO: modify the subtitle to reflect actual name
                    SettingFlatButton(title: "Report Errors",),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(height: 1, color: kLightGreyColor,),
                    ),
                    SettingFlatButton(title: "Give Feedback"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(height: 1, color: kLightGreyColor,),
                    ),
                    SettingFlatButton(title: "Review on App Store"),
                  ],
                ),
              ),
              ReusableCard(parentPage: 'Setting', title: '', subtitle: '', addIcon: false,
                  cardChild: Column(
                    children: [
                      SettingFlatButton(title: "About Us"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(height: 1, color: kLightGreyColor,),
                      ),
                      SettingFlatButton(title: "Privacy Policy"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(height: 1, color: kLightGreyColor,),
                      ),
                      SettingFlatButton(title: "Terms of Use"),
                    ],
                  ),
              ),
              ReusableCard(parentPage: 'Setting', title: '', subtitle: '', addIcon: false,
                cardChild: SettingFlatButton(title: "Delete All Data"),
              ),
              SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}


class SettingFlatButton extends StatelessWidget {

  SettingFlatButton({@required this.title, @required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: (){
        //move to a new page to edit name
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title == 'Delete All Data' ? Text(title, style: TextStyle(fontSize: 17, color: Colors.red),) :
          Text(title, style: TextStyle(fontSize: 17, color: Colors.black),),
          Icon(Icons.arrow_forward_ios, color: Colors.black12,),
        ],
      ),
    );
  }
}
