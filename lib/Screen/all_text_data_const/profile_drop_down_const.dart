import 'package:flutter/material.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:select_form_field/select_form_field.dart';

class ProfileDropDownConst extends StatelessWidget {
  String? intialValue;
  String? labelName;
  String? hintText;
  List<Map<String,dynamic>>? itemsData;
  Function(String)? onChanged;
   ProfileDropDownConst({this.intialValue,this.labelName,this.hintText,this.itemsData,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 8),
      child: SelectFormField(
        initialValue: intialValue,
        type: SelectFormFieldType.dropdown,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: const UnderlineInputBorder(),
          labelText: labelName,
          hintText: hintText,
          suffixIcon: const Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Icon(
              Icons
                  .keyboard_arrow_down_sharp,
              color:
              ColorsConstData.appBaseColor,
            ),
          ),
          labelStyle: const TextStyle(
            color: ColorsConstData.appBaseColor,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color:
              ColorsConstData.appBaseColor,
            ),
          ),
        ),
        items: itemsData,
        onChanged:onChanged!,
      ),
    );
  }
}
