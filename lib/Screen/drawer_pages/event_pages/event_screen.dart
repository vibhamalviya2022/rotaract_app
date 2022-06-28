import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../provider/providerNotifier.dart';
import '../../all_text_data_const/all_text_data_const.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  static const String map_api = "API_KEY";
  bool isLoading = true;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    providerNotifier.getAllEventShowinCalanderNotifier().whenComplete(() {
      timer = Timer(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
        timer!.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    return SafeArea(
      child: Scaffold(
        ///this is old code by susmita
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarData(
            appBarTitle: "All Event",
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: isLoading == true
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(
                      color: ColorsConstData.appBaseColor),
                ),
              )
            : providerNotifier.getAllEventDataEventList.isEmpty ?
            Container(
              child: Center(
                child: Text("No Data"),
              ),
            )
            :AnimationLimiter(
              child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),

                  shrinkWrap: true,
                  itemCount: providerNotifier.getAllEventDataEventList.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration:  Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 100,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              // side: BorderSide(
                              //   color: ColorsConstData.appBaseColor,
                              // ),
                            ),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    AllTextDataConst(
                                      textData: providerNotifier
                                          .getAllEventDataEventList[index].date,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                    ),

                                    AllTextDataConst(
                                      textData: providerNotifier
                                          .getAllEventDataEventList[index].title,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                    ),
                                    AllTextDataConst(
                                      textData: providerNotifier
                                          .getAllEventDataEventList[index].time,
                                      fontSize: 16,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                    ),
                                    AllTextDataConst(
                                      textData: providerNotifier
                                          .getAllEventDataEventList[index].address,
                                      fontSize: 16,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      height: 10,
                                      thickness: 1,
                                      indent: 33,
                                      endIndent: 33,
                                    ),
                                    Container(
                                        width: size.width * 0.85,
                                        child: Center(
                                            child: Text(
                                          "${providerNotifier.getAllEventDataEventList[index].description!}",
                                          textAlign: TextAlign.justify,
                                        ))),

                                    /// old code by susmita
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //     Text('Cricket League',
                                    //     style: TextStyle(
                                    //       fontSize: 32,
                                    //     ),
                                    //     textAlign: TextAlign.center,
                                    //     ),
                                    //   ],
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //     Padding(
                                    //       padding: const EdgeInsets.only(top: 14),
                                    //       child: Text('Timing 10:00 pm to 7:00',
                                    //         style: TextStyle(
                                    //           fontSize: 16,
                                    //         ),
                                    //         textAlign: TextAlign.center,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //     Padding(
                                    //       padding: const EdgeInsets.only(top: 14),
                                    //       child: Text('Modi Ground',
                                    //         style: TextStyle(
                                    //           fontSize: 16,
                                    //         ),
                                    //         textAlign: TextAlign.center,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),

                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //     Padding(
                                    //       padding: const EdgeInsets.only(top: 15),
                                    //       child: Text('Description About Event',
                                    //         style: TextStyle(
                                    //           fontSize: 20,
                                    //         ),
                                    //         textAlign: TextAlign.center,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Center(
                                              child: Image.asset(
                                            'assets/images/Event.jpg',
                                            height: 160,
                                          )),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25),
                                      child: Row(
                                        //mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            icon: Image.asset(
                                                "assets/images/phone-call.png",
                                                width: 25),
                                            // iconSize: 30,
                                            onPressed: () {
                                              launchUrlString(
                                                  'tel:${providerNotifier.getAllEventDataEventList[index].phone}');
                                            },
                                          ),
                                          IconButton(
                                            icon: Image.asset(
                                                "assets/images/whatsapp.png",
                                                width: 25),
                                            // iconSize: 30,
                                            onPressed: () {
                                              launchUrlString(
                                                  "whatsapp://send?${providerNotifier.getAllEventDataEventList[index].phone}="
                                                  "&text=Hello, I am Niik!");
                                            },
                                          ),
                                          IconButton(
                                            icon: Image.asset(
                                                "assets/images/gmail.png",
                                                width: 25),
                                            // iconSize: 30,
                                            onPressed: () {
                                              launchUrlString(
                                                  "mailto:${providerNotifier.getAllEventDataEventList[index].email}?subject=Greetings&body=Hello%20World");
                                            },
                                          ),
                                          IconButton(
                                            icon: Image.asset(
                                                "assets/images/placeholder.png",
                                                width: 25),
                                            onPressed: () {
                                              launchUrlString(
                                                  "https://maps.google.com/maps/search/?api=$map_api&query=${providerNotifier.getAllEventDataEventList[index].lat},${providerNotifier.getAllEventDataEventList[index].long}");
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        "${index + 1}/${providerNotifier.getAllEventDataEventList.length}"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ),

        ///this is old code susmita
        // PreferredSize(
        //   preferredSize: Size.fromHeight(60),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(40),
        //         bottomRight: Radius.circular(40)),
        //     child: AppBar(
        //       centerTitle: true,
        //       title: Text(
        //         "Event",
        //         style: TextStyle(color: Colors.white),
        //       ),
        //       elevation: 0,
        //       backgroundColor: ColorsConstData.appBaseColor,
        //       leading: IconButton(
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //         icon:Icon(
        //           Icons.arrow_back_ios,
        //           size: 30,
        //           color: Colors.white,
        //         ),
        //       ),
        //       systemOverlayStyle: SystemUiOverlayStyle.dark,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
