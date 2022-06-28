import 'package:flutter/material.dart';

class AllTextDataConst extends StatelessWidget {
  String? textData;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  MainAxisAlignment? mainAxisAlignment;
  AllTextDataConst({this.textData,this.fontSize,this.fontWeight,this.color,this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: mainAxisAlignment!,
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(textData!,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

