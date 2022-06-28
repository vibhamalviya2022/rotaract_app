import 'package:flutter/material.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';
class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({ Key? key }) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  //List giveData = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
         preferredSize: Size.fromHeight(60),
         child: AppBarData(
           appBarTitle: "About Us",
           onTap: (){
             Navigator.of(context).pop();
           },
         ),
       ),


///this is old code by susmita
      //  AppBar(
      //   backgroundColor: ColorsConstData.appBaseColor,
      //   centerTitle: true,
      //   title: Text(
      //     "About us",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //    leading: IconButton(
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //           icon: const Icon(
      //             Icons.arrow_back_ios,
      //             size: 30,
      //             color: Colors.white,
      //           ),
      //         ),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(40),
      //     ),
      //   ),
      // ),
      body:  Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey[200],
        child:Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text('About Rotaract : ',
                  // giveData[index]["Title"],
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,color: ColorsConstData.appBaseColor
                  ),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('  ROTARACT CLUB OF SURAT EAST Is One of the Largest Rotaract Club In Asia.We’re Building A Pipeline Of Leaders Who Understand What It Takes To Create Change In Our Complex, Interconnected World. Our Fellows Program Is A One-Year Leadership Development Program Designed To Connect And Cultivate A Pipeline Of Social Changemakers Who Are Committed To Tackling Poverty And Injustice In Their Communities.Everyone celebrates all the festivals with joy and enthusiasm, but there are some workers and their families with whom this is not possible, but our club has been celebrating the festivals by giving such families something like clothes, sweets, etc through the event for many years.',style: TextStyle(
                  fontSize: 14,

                ),
                  // giveData[index]["Description"],
                  textAlign: TextAlign.justify,
                ),
              ),
            ))




   /// this is old code by susmita

        // ListView.builder(
        //   itemCount: 1,
        //   // itemCount: giveData.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //         padding: EdgeInsets.all(5),
        //         margin: EdgeInsets.only(bottom: 10),
        //         color: Colors.white,
        //         child: ListTile(
        //           title: Padding(
        //             padding: const EdgeInsets.only(top: 5),
        //             child: Text('About Rotaract',
        //               // giveData[index]["Title"],
        //               textAlign: TextAlign.justify,
        //               style: TextStyle(
        //                 fontSize: 30,
        //                 fontWeight: FontWeight.w600,color: ColorsConstData.appBaseColor
        //               ),
        //             ),
        //           ),
        //           subtitle: Padding(
        //             padding: const EdgeInsets.only(top: 10),
        //             child: Text('ROTARACT CLUB OF SURAT EAST Is One of the Largest Rotaract Club In Asia.We’re Building A Pipeline Of Leaders Who Understand What It Takes To Create Change In Our Complex, Interconnected World. Our Fellows Program Is A One-Year Leadership Development Program Designed To Connect And Cultivate A Pipeline Of Social Changemakers Who Are Committed To Tackling Poverty And Injustice In Their Communities.Everyone celebrates all the festivals with joy and enthusiasm, but there are some workers and their families with whom this is not possible, but our club has been celebrating the festivals by giving such families something like clothes, sweets, etc through the event for many years.',style: TextStyle(
        //                 fontSize: 20,
        //
        //             ),
        //               // giveData[index]["Description"],
        //               textAlign: TextAlign.justify,
        //             ),
        //           ),
        //         ));
        //   },
        // ),
      ));
  }
}