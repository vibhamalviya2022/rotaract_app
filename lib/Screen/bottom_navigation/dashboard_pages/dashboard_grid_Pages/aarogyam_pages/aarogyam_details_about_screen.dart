import 'package:flutter/material.dart';

class AarogyamDetailsAboutScreen extends StatelessWidget {
  IconData? icons;
  String? dataName;

  AarogyamDetailsAboutScreen({this.dataName, this.icons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Icon(icons),
          const SizedBox(
            width: 5,
          ),
          Text(dataName!),
        ]),
        const Divider(
          thickness: 1.0,
          color: Colors.black26,
          endIndent: 10,
          indent: 10,
        )
      ]),
    );
  }
}
