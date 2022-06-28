import 'package:flutter/material.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../constant/constant.dart';

class AfterEventPage extends StatefulWidget {
  const AfterEventPage({ Key? key }) : super(key: key);

  @override
  State<AfterEventPage> createState() => _AfterEventPageState();
}

class _AfterEventPageState extends State<AfterEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorsConstData.appBaseColor,
          centerTitle: true,
          title: Text(
            "Event",
              style: TextStyle(color: Colors.white),
            ),
            leading: IconButton(
              icon:  const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.white,
                  ),
              iconSize: 36,
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: ColorsConstData.appBaseColor,
                  ),
                ),
                child: Container(
                  width: 340,
                  height: 152.59,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('28',
                        style: TextStyle(
                          fontSize: 40,
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
                      Text('May,',
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: ColorsConstData.appBaseColor,
                    ),
                  ),
                  child: Container(
                    width: 365,
                    height: 540,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 46),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Cricket League',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                              textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: Text('Timing 10:00 pm to 7:00',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: Text('Modi Ground',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 25,
                            thickness: 1,
                            indent: 33,
                            endIndent: 33,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text('Description About Event',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  height: 165,
                                  width: 290,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: ColorsConstData.appBaseColor)
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Banner',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 45),
                              child: Row(
                                //mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: Image.asset("assets/images/phone-call.png"),
                                    iconSize: 40,
                                    onPressed: (){
                                      launchUrlString('tel:345678');
                                    },
                                  ),
                                  IconButton(
                                    icon: Image.asset("assets/images/whatsapp.png"),
                                    iconSize: 40,
                                    onPressed: () {
                                      launchUrlString("whatsapp://send?3456789=""&text=Hello, I am Niik!");
                                    },
                                  ),
                                  IconButton(
                                    icon: Image.asset("assets/images/gmail.png"),
                                    iconSize: 40,
                                    onPressed: (){
                                      launchUrlString("mailto:test@example.org?subject=Greetings&body=Hello%20World");
                                    },
                                  ),
                                  IconButton(
                                    icon: Image.asset("assets/images/placeholder.png"),
                                    iconSize: 40,
                                    onPressed: (){
                                      // launchUrlString("https://maps.google.com/maps/search/?api=$map_api&query=$lat,$long");
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}