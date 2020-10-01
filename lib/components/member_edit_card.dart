import 'package:flutter/material.dart';
import 'package:girl_scout_simple/components/constants.dart';
import 'package:girl_scout_simple/screens/add.dart';

class AnimatedEditCard extends StatefulWidget {

  final bool expanded;

  const AnimatedEditCard({Key key, @required this.expanded}): super(key: key);

  @override
  _AnimatedEditCard createState() => _AnimatedEditCard();
}

class _AnimatedEditCard extends State<AnimatedEditCard> {

  bool canEdit = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: widget.expanded ? 0 : MediaQuery
          .of(context)
          .size
          .width * 0.19,


      duration: Duration(milliseconds: 100),

      child: Padding(
        padding: widget.expanded ? const EdgeInsets.all(0.0) : const EdgeInsets
            .all(15.0),

        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Visibility(
                visible: !widget.expanded,
                child: GestureDetector(onTap: () {
                  print("Move!");
                  //TODO: Figure out why this is not working >>>>>> Navigator.pushNamed(context, Add.id);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => Add(title: title)));
                }, child: Icon(Icons.redo),
                ),

              ),
              SizedBox(height: 30),
              Visibility(
                visible: !widget.expanded,
                child: GestureDetector(onTap: () {
                  //TODO: Figure out why this is not working >>>>>> Navigator.pushNamed(context, Add.id);
                  print("Delete!");
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => Add(title: title)));
                }, child: Icon(Icons.delete_forever),
                ),
              ),
              //SizedBox(height:20),
            ]
        ),
      ),
    );
  }
}



