import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotaract_app/constant/constant.dart';

import '../../../../app_bar/app_bar_data.dart';

class UpcomingProjectScreen extends StatefulWidget {
  const UpcomingProjectScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingProjectScreen> createState() => _UpcomingProjectScreenState();
}

class _UpcomingProjectScreenState extends State<UpcomingProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarData(
            appBarTitle: "Upcoming Project",
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
        ),




///this is old code by susmita
        // PreferredSize(
        //   preferredSize: Size.fromHeight(60),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(40),
        //         bottomRight: Radius.circular(40)),
        //     child: AppBar(
        //       centerTitle: true,
        //       title: const Text(
        //         "Upcoming Project",
        //         style: TextStyle(color: Colors.white),
        //       ),
        //       elevation: 0,
        //       backgroundColor: ColorsConstData.appBaseColor,
        //       leading: IconButton(
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //         icon: const Icon(
        //           Icons.arrow_back_ios,
        //           size: 30,
        //           color: Colors.white,
        //         ),
        //       ),
        //       systemOverlayStyle: SystemUiOverlayStyle.dark,
        //     ),
        //   ),
        // ),
        body: ListView.builder(
          // physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 282,
                  width: 391,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                    border: Border.all(color: ColorsConstData.appBaseColor),
                  ),
                  child: Center(
                    child: Text(
                      'Event banner image',
                    style: TextStyle(
                      fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
