import 'package:flutter/material.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';

import '../../app_bar/app_bar_data.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarData(
            appBarTitle: "Projects",
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
        //       title: Row(children: [
        //         Text('Projects'),
        //       ]),
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
        body: SafeArea(
          child: ListView.builder(
              // physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Card(
                      
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 0.50, color: ColorsConstData.appBaseColor),
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: Container(
          
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(7),
                                              topLeft: Radius.circular(7)),
                                          color: ColorsConstData.appBaseColor,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '27',
                                              //'${widget.notification["Date"].toString().substring(8, 10)}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 7,
                                            bottom: 7,
                                            left: 5,
                                            right: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorsConstData.appBaseColor,
                                                width: 0.5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(6),
                                                bottomRight:
                                                    Radius.circular(6)),
                                            color: Colors.white),
                                        // color: Colors.black,
                                        //height: 40,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '2022',
                                              //'${new DateFormat.MMM().format(DateTime.parse(DateFormat("yyyy-MM-dd").parse(widget.notification["Date"].toString().substring(0,10)).toString()))},${widget.notification["Date"].substring(0, 4)}',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: ColorsConstData.appBaseColor,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'summi',
                                        //'${widget.notification["Title"]}',
                                        style: TextStyle(
                                            color: ColorsConstData.appBaseColor,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'hhjfdsdfgh',
                                        // '${widget.notification["Description"]}',
                                        style: TextStyle(
                                            color: ColorsConstData.appBaseColor,
                                            fontSize: 14),
                                      ),
                    //                    GestureDetector(
                    // onTap: () {
                    //   // Navigator.push(context,
                    //   //     MaterialPageRoute(builder: (context) => EventDatePage()));
                    // },
                    //               )
                    ],
                                  ),
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
