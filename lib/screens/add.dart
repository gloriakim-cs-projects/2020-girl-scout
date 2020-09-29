import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Add extends StatefulWidget {
  //TODO: complete parameters
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
        iconTheme: IconThemeData(
          color: kWhiteColor, //change your color here
        ),
        title: Text(
          "Add Member",
          style: TextStyle(
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        backgroundColor: kDarkGreyColor,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Title", style: Theme.of(context).textTheme.headline2,),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter a search term'
                ),
              ),
              SizedBox(height: 10),
              Text("Category", style: Theme.of(context).textTheme.headline2,),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter a search term'
                ),
              ),
              SizedBox(height: 10),
              Text("Sub-Category", style: Theme.of(context).textTheme.headline2,),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter a search term'
                ),
              ),
              SizedBox(height: 10),
              Text("Grade", style: Theme.of(context).textTheme.headline2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GradeButton(grade: "Daisy"),
                  GradeButton(grade: "Brownie"),
                  GradeButton(grade: "Junior"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GradeButton(grade: "Cadette"),
                  GradeButton(grade: "Senior"),
                  GradeButton(grade: "Ambassador"),
                ],
              ),
              SizedBox(height: 10),
              Text("Photo", style: Theme.of(context).textTheme.headline2,),
              SizedBox(height: 10),
              Row(
                children: [
                  //TODO: Add functionality when clicked
                  PhotoButton(icon: 58055, name: "Gallery"),
                  SizedBox(width: 10),
                  PhotoButton(icon: 58386, name: "Camera"),
                ],
              ),
              SizedBox(height: 10),
              Text("Checklist", style: Theme.of(context).textTheme.headline2,),
              //TODO: add checklist
            CheckboxListTile(
              title: const Text('Animate Slowly'),
              value: timeDilation != 1.0,
              onChanged: (bool value) {
                setState(() {
                  //timeDilation = value ? 10.0 : 1.0;
                });
              },
              secondary: const Icon(Icons.hourglass_empty),
            ),
//              new CheckboxListTile(
//                title: Text("Add"),
//                activeColor: kDarkGreyColor,
//                checkColor: kWhiteColor,
//                controlAffinity:
//                  ListTileControlAffinity.leading,
//                value: _checked,
//                onChanged: (bool value) {
//                setState(() {
//                timeDilation = value ? 10.0 : 1.0;
//                }),
//              ),
              //TODO: add save button
              SizedBox(height: 10),
              //TODO: save button
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Save", style: TextStyle(fontSize: 25.0),),
                    ),
                    textColor: kWhiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                    color: kDarkGreyColor,
                    //TODO: save the material and pop the page (i.e., go back to previous page)
                    onPressed: () => {},
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class GradeButton extends StatefulWidget {

  GradeButton({@required this.grade});
  final String grade;

  @override
  _GradeButtonState createState() => _GradeButtonState();
}

class _GradeButtonState extends State<GradeButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(widget.grade),
      //TODO: using minWidth will overflow for some phones... use proportional size of screen.
      minWidth: 120,
      textColor: pressed? kDarkGreyColor : kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(8.0),
          side: BorderSide(color: pressed? kDarkGreyColor : kDarkGreyColor, width: 2.0),
      ),
      color: pressed ? kWhiteColor : kDarkGreyColor,
      onPressed: () => setState(() => pressed = !pressed),
    );
  }
}

class PhotoButton extends StatelessWidget {

  PhotoButton({@required this.icon, @required this.name});
  final int icon; //Icons.folder
  final String name;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      //TODO: include onPressed functionality
      onPressed: () => {},
      color: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(20.0),
      child: Column( // Replace with a Row for horizontal icon + text
        children: <Widget>[
          Icon(IconData(icon, fontFamily: 'MaterialIcons'), size: 60.0,),
          Text(name, style: TextStyle(color: Colors.black),),
        ],
      ),
    );
  }
}
