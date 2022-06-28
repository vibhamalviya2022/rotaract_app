import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({ Key? key }) : super(key: key);

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarData(
            appBarTitle: "Member",
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
        //         "Members",
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
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: 8,
                      // physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: ColorsConstData.appBaseColor, width: .5),
                            ),
                            child: ListTile(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             DirectoryDetailsPage()));
                              },
                              title: Text("Joey Tribbiani"),
                              subtitle: Text("Actor"),
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/images/image.png"), // no matter how big it is, it won't overflow
                              ),
                              trailing: Container(
                                width: MediaQuery.of(context).size.width * 0.28,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          launch(
                                              "whatsapp://send?text=Hello World!");
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/images/whatsapp.png',
                                        height: 28,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          launch('tel: 9020884322');
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/images/phone-call.png',
                                        height: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            elevation: 4,
                          )),
                ),
              ],
            ),
          ),
        ));
  }
}