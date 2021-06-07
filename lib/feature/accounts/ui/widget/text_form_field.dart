import 'package:flutter/material.dart';

class AddAccountTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  final Widget suffixIcon;
  final Color filledColor;
  final TextInputType textInputType;
  final Function onChanged;
  final Function onFieldSubmitted;
  final int maxLines;
  final TextStyle labelStyle;
  final TextStyle hintStyle;
  final Icon icon;
  final Widget prefixIcon;
  final bool readOnly;

  AddAccountTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
    this.suffixIcon,
    this.filledColor,
    this.textInputType,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLines,
    this.icon,
    this.prefixIcon,
    this.labelStyle,
    this.hintStyle,
    this.textEditingController,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outLineBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide:
        BorderSide(width: 0.0, color: Colors.black54));
    return Container(
      //height:  70,
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: TextFormField(
          readOnly: readOnly?? false,
          controller: textEditingController,
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 10,
            ),
            labelStyle: labelStyle,
            hintStyle: hintStyle,
            icon: icon,
            prefixIcon: prefixIcon,
            isDense: true,
            disabledBorder: outLineBorder,
            focusedErrorBorder: outLineBorder,
            errorBorder: outLineBorder,
            enabledBorder: outLineBorder,
            focusedBorder: outLineBorder,
            suffixIcon: suffixIcon,
            hintText: hintText,
            //contentPadding: EdgeInsets.all(15.0),
            border: InputBorder.none,
            filled: true,
            fillColor: filledColor,
          ),
          obscureText: isPassword ? true : false,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          onSaved: onSaved,
          keyboardType: textInputType,
        ),
      ),
    );
  }
}