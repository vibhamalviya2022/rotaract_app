import 'package:flutter/material.dart';
import 'package:rotaract_app/constant/constant.dart';

class BorderTextFieldConst extends StatelessWidget {
  String? hintText;
  int? maxLine;
  TextEditingController? controller;
  BorderTextFieldConst({this.hintText,this.controller,this.maxLine});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: ColorsConstData.appBaseColor,
          ),
        ),
        child: Container(
          width: size.width*0.9,
          height: 54,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 10),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextField(
                controller: controller,
                maxLines: maxLine,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
