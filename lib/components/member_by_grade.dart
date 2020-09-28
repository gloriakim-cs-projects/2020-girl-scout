import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/reusable_card.dart';

class MemberByGrade extends StatelessWidget {

  MemberByGrade({@required this.grade, this.members});
  final String grade;
  final List<String> members;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //TODO: Generate more rows & Image widgets as adding more images
                //TODO: If images are not found, replace the space with a grey circle with a member's name
                //TODO: To make photos evently spaced, all I can think of is to create a transparent circle to replace a photo
                //TODO: Resize the uploaded photos into a same-sized circle
                ReusableCard(title: 'Team YAY!', subtitle: '18 members', addIcon: true,
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
