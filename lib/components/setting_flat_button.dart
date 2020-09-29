import 'package:flutter/material.dart';

class SettingFlatButton extends StatelessWidget {

  SettingFlatButton({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: (){
        //TODO: include necessary functionality
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
