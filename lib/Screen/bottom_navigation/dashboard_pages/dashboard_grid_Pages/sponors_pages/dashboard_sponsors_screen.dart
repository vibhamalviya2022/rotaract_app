import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';

import '../../../../../provider/providerNotifier.dart';


class SponsorsScreen extends StatefulWidget {
  const SponsorsScreen({Key? key}) : super(key: key);

  @override
  State<SponsorsScreen> createState() => _SponsorsScreenState();
}

class _SponsorsScreenState extends State<SponsorsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarData(
          appBarTitle: "Sponsers",
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
      //       title: Text(
      //         "Sponsors",
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
        padding: EdgeInsets.all(10),
        itemCount: 15,
        // physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: ColorsConstData.appBaseColor, width: .5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 40, left: 10, right: 10),
                  child: ListTile(
                    title: Text(
                      "Banner",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Sponsors details"),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
