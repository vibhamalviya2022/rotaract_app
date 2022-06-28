import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';


class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 /// this is old code by susmita
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarData(
          appBarTitle: "Attendance",
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
      //         "Attendance",
      //         style: TextStyle(color: Colors.white),
      //       ),
      //       elevation: 2,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: ListView.builder(
          // physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (BuildContext context,int index){
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ListTile(
                title:Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Text("Date:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(" "+getCurrentDate()),
                    ],
                  ),
                ),
                subtitle: Row(
                  children: [
                    Text("Event:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(" "+"Common Meeting",
                      style: TextStyle(
                        fontSize: 16,color: Colors.black,
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: ColorsConstData.appBaseColor),
                ),
                trailing: Text('Present',style: TextStyle(color: Colors.blue),),
              ),
            );
          },
        ),
      ),

      ///code by sushmita mam
      // body: Container(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   child: Padding(
      //     padding:
      //         const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         Row(
      //           children: <Widget>[
      //             Container(
      //                 width: MediaQuery.of(context).size.width / 4.5,
      //                 child: Row(
      //                   children: <Widget>[
      //                     Icon(
      //                       Icons.calendar_today,
      //                       size: 15,
      //                       color: ColorsConstData.appBaseColor,
      //                     ),
      //                     Text(
      //                       "Date",
      //                       style: TextStyle(
      //                           fontSize: 17,
      //                           color: ColorsConstData.appBaseColor,
      //                           fontWeight: FontWeight.w600),
      //                     ),
      //                   ],
      //                 )),
      //             Expanded(
      //               child: Container(
      //                   child: Text(
      //                 "Title",
      //                 style: TextStyle(
      //                     fontSize: 17,
      //                     color: ColorsConstData.appBaseColor,
      //                     fontWeight: FontWeight.w600),
      //               )),
      //             ),
      //           ],
      //         ),
      //         Divider(
      //           color: Colors.grey,
      //         ),
      // Expanded(
      //   child: Container(
      //     child: FutureBuilder<List>(
      //       //future: Services.getAttenddance(),
      //       builder: (BuildContext context, AsyncSnapshot snapshot) {
      //         return snapshot.connectionState == ConnectionState.done
      //             ? snapshot.hasData
      //                 ? //ListView.builder(
      //                     //padding: EdgeInsets.all(0),
      //                    // itemCount: snapshot.data.length,
      //             //         itemBuilder:
      //             //             (BuildContext context, int index) {
      //             //           return AttendanceComponents(
      //             //               snapshot.data[index]);
      //             //         },
      //             //       )
      //             //     : NoDataComponent()
      //             // : LoadinComponent();
      //       },
      //     ),
      //   ),
      // ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

String getCurrentDate() {
  var date = DateTime.now().toString();

  var dateParse = DateTime.parse(date);

  var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
  return formattedDate.toString();
}