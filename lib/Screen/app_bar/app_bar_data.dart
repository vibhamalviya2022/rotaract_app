import 'package:flutter/material.dart';
import 'package:rotaract_app/constant/constant.dart';

class AppBarData extends StatelessWidget {
  String? appBarTitle;
  Function()? onTap;
   AppBarData({this.onTap,this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsConstData.appBaseColor,
              ColorsConstData.appBaseColor,
              Colors.pinkAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AppBar(
          centerTitle: true,
          title: Text(appBarTitle!,
            // "Aarogyam",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
            backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.white,
            ),
          ),
          // backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
