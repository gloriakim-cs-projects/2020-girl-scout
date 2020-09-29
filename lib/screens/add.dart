import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';

class Add extends StatefulWidget {

  Add({@required this.title});
  String title; //(ex) Add Member

  static String id = '/Add';
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Member",
          style: TextStyle(
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        backgroundColor: kDartGreyColor,),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("57 Collections", style: Theme.of(context).textTheme.bodyText1,),
          ],
        ),
      ),
    );
  }
}
