import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:girl_scout_simple/components/member_container.dart';
import 'package:girl_scout_simple/components/globals.dart';
import 'package:girl_scout_simple/screens/members.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_image_crop/simple_image_crop.dart';
import 'package:girl_scout_simple/components/globals.dart' as globals;
import 'package:girl_scout_simple/components/database_operations.dart';
import 'package:girl_scout_simple/components/reusable_card.dart';
import 'package:girl_scout_simple/components/badge_container.dart';
import 'package:girl_scout_simple/models.dart';

class BadgeListPage extends StatefulWidget {
  //TODO: complete parameters
  BadgeListPage({@required this.type});
  final int type; //0 for badges, 1 for patches

  static String id = '/MemberInfo';
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<BadgeListPage> {

  int type;

  @override
  Widget build(BuildContext context) {

    type = widget.type;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        iconTheme: IconThemeData(
          color: kWhiteColor, //change your color here
        ),
        title: Text(
          'Select Badge',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: kDarkGreyColor,),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              //TODO this is where the badge cards will be called
              ListView(
                children: [
                  //METHOD for badges
                ],
              )
            ]
        ),
      ),
    );
  }
}
