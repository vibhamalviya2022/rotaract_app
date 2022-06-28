import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/all_text_data_const/all_text_data_const.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:intl/intl.dart';

import '../../../model/homepage_model/get_current_date_event_model.dart';
import '../../../provider/providerNotifier.dart';

class EventDateScreen extends StatefulWidget {
  GetCurrentDateEventModel? eventDate;

  EventDateScreen({this.eventDate});

  @override
  State<EventDateScreen> createState() => _EventDateScreenState();
}

class _EventDateScreenState extends State<EventDateScreen> {
  // final phone = '';
  // final number = '+919328978062';
  // static const double lat = 2.813812, long = 101.503413;
  static const String map_api = "API_KEY";
 bool isLoading = true;
 Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    providerNotifier.getAllDateEventShowinNotifier((DateFormat('dd/MM/yyyy').format(DateTime.now()).toString())).whenComplete(() {
      timer = Timer(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
          timer!.cancel();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarData(
          appBarTitle: "Event",
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      /// old code by susmita
      //   AppBar(
      //     backgroundColor: ColorsConstData.appBaseColor,
      //     centerTitle: true,
      //     title: Text(
      //       "Event",
      //         style: TextStyle(color: Colors.white),
      //       ),
      //       leading: IconButton(
      //         icon:  const Icon(
      //               Icons.arrow_back_ios,
      //               size: 30,
      //               color: Colors.white,
      //             ),
      //         iconSize: 36,
      //         onPressed: (){
      //           Navigator.pop(context);
      //         },
      //       ),
      //       shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(40),
      //     ),
      //   ),
      // ),
      body: isLoading == true ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ): providerNotifier
          .getAllDateEventCurrentDateNP!.isEmpty?
          Container(
            child: Center(
              child: Text("No Data",style: TextStyle(fontSize: 18)),
            ),
          )
          : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height*0.01,
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: ColorsConstData.appBaseColor,
                    ),
                  ),
                  child: Container(
                    ///old code by susmita
                    width: size.width * 0.90, //340,
                    height: size.height * 0.12, //150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('dd-MM-yy').format(DateTime.now()),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            height: 80,
                            child: VerticalDivider(
                              color: Colors.red,
                              thickness: 2,
                              indent: 5,
                              endIndent: 0,
                              width: 20,
                            ),
                          ),
                        ),
                        Text(
                          'Events',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: providerNotifier
                      .getAllDateEventCurrentDateNP?.length,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: ColorsConstData.appBaseColor,
                        ),
                      ),
                      child:Container(

                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              AllTextDataConst(
                                textData: providerNotifier
                                    .getAllDateEventCurrentDateNP?[index].title,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              AllTextDataConst(
                                textData: providerNotifier
                                    .getAllDateEventCurrentDateNP?[index].time,
                                fontSize: 16,
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              AllTextDataConst(
                                textData: providerNotifier
                                    .getAllDateEventCurrentDateNP?[index].address,
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
                                  width: size.width *0.85,
                                  child: Center(child: Text("${providerNotifier.getAllDateEventCurrentDateNP![index].description!}",textAlign: TextAlign.justify,))),
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
                                        child:
                                        Image.asset('assets/images/Event.jpg')),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Row(
                                  //mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon:
                                      Image.asset("assets/images/phone-call.png"),
                                      iconSize: 30,
                                      onPressed: () {
                                        launchUrlString(
                                            'tel:${providerNotifier.getAllDateEventCurrentDateNP?[index].phone}');
                                      },
                                    ),
                                    IconButton(
                                      icon: Image.asset("assets/images/whatsapp.png"),
                                      iconSize: 30,
                                      onPressed: () {
                                        launchUrlString(
                                            "whatsapp://send?${providerNotifier.getAllDateEventCurrentDateNP?[index].phone}="
                                                "&text=Hello, I am Niik!");
                                      },
                                    ),
                                    IconButton(
                                      icon: Image.asset("assets/images/gmail.png"),
                                      iconSize: 30,
                                      onPressed: () {
                                        launchUrlString(
                                            "mailto:${providerNotifier.getAllDateEventCurrentDateNP?[index].email}?subject=Greetings&body=Hello%20World");
                                      },
                                    ),
                                    IconButton(
                                      icon: Image.asset(
                                          "assets/images/placeholder.png"),
                                      iconSize: 30,
                                      onPressed: () {
                                        launchUrlString(
                                            "https://maps.google.com/maps/search/?api=$map_api&query=${ providerNotifier.getAllDateEventCurrentDateNP?[index].lat},${ providerNotifier.getAllDateEventCurrentDateNP?[index].long}");
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },)
              ],
            ),
          ),
    );
  }
}
