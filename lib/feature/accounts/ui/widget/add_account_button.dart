import 'package:flutter/material.dart';

class AddAccountButton extends StatelessWidget {

  final String name;
  final Function onPressed;
  final  double width;
  final double fontSize;
  AddAccountButton({this.onPressed,this.name,this.width,this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        minWidth: width,
        height: 45.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        color: Colors.indigo,
        onPressed:onPressed,
        child: Text(
          name,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}