import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/all_text_data_const/all_text_data_const.dart';
import 'package:rotaract_app/Screen/all_text_data_const/border_text_field_const.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/provider/providerNotifier.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  bool _isContactUs = false;

  Future addContactUsApiCall() async {
    ProviderNotifier notifierProvider =
        Provider.of<ProviderNotifier>(context, listen: false);
    Map body = {
      "title": nameController.text,
      "email": emailController.text,
      "description": messageController.text
    };
    notifierProvider.addContactUsDataNotifier(body).whenComplete(() {
      Fluttertoast.showToast(msg: notifierProvider.contactusData!.message!);
      setState(() {
        _isContactUs = false;
      });
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarData(
            appBarTitle: "Contact Us",
            onTap: () {
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
        //         "Contact us",
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
        //     ),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                AllTextDataConst(
                  textData: "Get in touch!",
                  fontSize: 25,
                  mainAxisAlignment: MainAxisAlignment.center,
                  color: ColorsConstData.appBaseColor,
                ),
                AllTextDataConst(
                  textData: "Contact us for quote, help to join the team",
                  fontSize: 13,
                  mainAxisAlignment: MainAxisAlignment.center,
                  color: Colors.grey,
                ),

                ///this is old code by susmita
                // Container(
                //   padding: EdgeInsets.only(top: 40, bottom: 20),
                //   alignment: Alignment.center,
                //   child: Text(
                //     "Get in touch!",
                //     style: TextStyle(
                //         color: ColorsConstData.appBaseColor, fontSize: 30),
                //   ),
                // ),
                // Container(
                //   padding: EdgeInsets.only(
                //     right: 10,
                //     left: 10,
                //   ),
                //   alignment: Alignment.center,
                //   child: Text(
                //     "Contact us for qoute,help to join the team",
                //     style: TextStyle(color: Colors.grey, fontSize: 15),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.only(right: 70, left: 70, bottom: 15),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            launch(
                                'https://www.google.com/maps/dir/?api=1&origin=43.7967876,-79.5331616&destination=43.5184049,-79.8473993&waypoints=43.1941283,-79.59179|43.7991083,-79.5339667|43.8387033,-79.3453417|43.836424,-79.3024487&travelmode=driving&dir_action=navigate');
                          });
                        },
                        child: Image.asset(
                          'assets/images/placeholder.png',
                          height: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            launch(
                                'mailto:rajatrrpalankar@gmail.com?subject=This is Subject Title&body=This is Body of Email');
                          });
                        },
                        child: Image.asset(
                          'assets/images/gmail.png',
                          height: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            launch("whatsapp://send?text=Hello World!");
                          });
                        },
                        child: Image.asset(
                          'assets/images/whatsapp.png',
                          height: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            launch("tel:3456789");
                          });
                        },
                        child: Image.asset(
                          'assets/images/phone-call.png',
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      side: BorderSide(
                          color: ColorsConstData.appBaseColor, width: 1.0),
                    ),
                    child: Container(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          children: [
                            BorderTextFieldConst(
                              hintText: "Your name",
                              controller: nameController,
                            ),
                            BorderTextFieldConst(
                              hintText: "Your email",
                              controller: emailController,
                            ),
                            BorderTextFieldConst(
                              hintText: "Message",
                              controller: messageController,
                              maxLine: 5,
                            ),
                            SizedBox(height: size.height * 0.02),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              //todo
                              child: Container(
                                decoration: BoxDecoration(),
                                //todo material button'
                                //todo
                                child: _isContactUs == true
                                    ?  Center(
                                        child: CircularProgressIndicator(
                                          color: ColorsConstData.appBaseColor,
                                        ),
                                      )
                                    : MaterialButton(
                                        minWidth: size.width * 0.5,
                                        height: size.height * 0.05,
                                        onPressed: () {
                                          if (nameController.text == "") {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content:
                                                        Text("Enter name")));
                                          } else if (emailController.text ==
                                              "") {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content:
                                                        Text("Enter Email")));
                                          } else if (messageController.text ==
                                              "") {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Enter Description")));
                                          } else {
                                            setState(() {
                                              _isContactUs = true;
                                            });
                                            addContactUsApiCall();
                                          }
                                        },
                                        color: ColorsConstData.appBaseColor,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: const Text(
                                          "Send",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                              ),
                            ),

                            ///this is old code by susmita
                            // Material(
                            //   borderRadius: BorderRadius.circular(20),
                            //   elevation: 5,
                            //   shadowColor: Colors.grey.withOpacity(0.8),
                            //   child: TextField(
                            //     decoration: InputDecoration(
                            //         hintText: 'Your Name',
                            //         border: OutlineInputBorder(
                            //             borderRadius: BorderRadius.circular(20),
                            //             borderSide: new BorderSide(
                            //                 color:
                            //                     ColorsConstData.appBaseColor))),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: size.height*0.10,
                            // ),
                            // Material(
                            //   borderRadius: BorderRadius.circular(20),
                            //   elevation: 5,
                            //   shadowColor: Colors.grey.withOpacity(0.8),
                            //   child: TextField(
                            //     decoration: InputDecoration(
                            //         hintText: 'Your Email',
                            //         border: OutlineInputBorder(
                            //             borderRadius: BorderRadius.circular(20),
                            //             borderSide: new BorderSide(
                            //                 color:
                            //                     ColorsConstData.appBaseColor))),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Container(
                            //   height: 100,
                            //   child: Material(
                            //     borderRadius: BorderRadius.circular(20),
                            //     elevation: 5,
                            //     shadowColor: Colors.grey.withOpacity(0.8),
                            //     child: TextField(
                            //       maxLines: 5,
                            //       decoration: InputDecoration(
                            //           hintText: 'Message',
                            //           border: OutlineInputBorder(
                            //               borderRadius: BorderRadius.circular(20),
                            //               borderSide: new BorderSide(
                            //                   color:
                            //                       ColorsConstData.appBaseColor))),
                            //     ),
                            //   ),
                            // ),
                          ],
                        )),
                    elevation: 5,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
