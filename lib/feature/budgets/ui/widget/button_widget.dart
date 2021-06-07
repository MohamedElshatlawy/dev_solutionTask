import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  final String name;
  final Function onPressed;
  ButtonWidget({this.onPressed,this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        height: 45.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        color: Colors.indigo,
        onPressed:onPressed,
        child: Text(
          name,
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    );
  }
}
