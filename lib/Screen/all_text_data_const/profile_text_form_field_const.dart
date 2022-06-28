import 'package:flutter/material.dart';
import 'package:rotaract_app/constant/constant.dart';

class ProfileTextFormFieldConst extends StatelessWidget {
  TextEditingController? controller;
  String? labelName;
  String? hintText;
  ProfileTextFormFieldConst({this.controller,this.labelName,this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: UnderlineInputBorder(),
          labelText: labelName,
          hintText: hintText,
          labelStyle: TextStyle(
            color: ColorsConstData.appBaseColor,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorsConstData.appBaseColor,
            ),
          ),
        ),
      ),
    );
  }
}
