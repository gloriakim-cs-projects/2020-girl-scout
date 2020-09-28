import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/reusable_card.dart';

class ImagesByGrade extends StatelessWidget {

  ImagesByGrade({@required this.grade, this.members, @required this.title, @required this.subtitle, @required this.numBox});
  final String grade;
  final List<String> members;
  final String title; //Team YAY! or Badge
  final String subtitle; //18 members or ''
  final int numBox;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //TODO: Generate more rows & Image widgets as adding more images
                //TODO: If images are not found, replace the space with a grey circle with a member's name
                //TODO: To make photos evently spaced, all I can think of is to create a transparent circle to replace a photo
                //TODO: Resize the uploaded photos into a same-sized circle(member)/square(badge)
                //TODO: Create the ReusableCard for the "numBox" times
                //TODO: include a checkbox for each badge (probably in reusable_card.art)
                ReusableCard(title: title, subtitle: subtitle, addIcon: true,
                  cardChild: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image(image: AssetImage('images/example_photo.png')),
                          Image(image: AssetImage('images/example_photo.png')),
                          Image(image: AssetImage('images/example_photo.png')),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image(image: AssetImage('images/example_photo.png')),
                          Image(image: AssetImage('images/example_image.png')),
                          Image(image: AssetImage('images/example_photo.png')),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image(image: AssetImage('images/example_photo.png')),
                          Image(image: AssetImage('images/example_photo.png')),
                          Image(image: AssetImage('images/example_photo.png')),
                        ],
                      ),
                    ],
                  ),),
              ],
            ),
          );
  }
}
