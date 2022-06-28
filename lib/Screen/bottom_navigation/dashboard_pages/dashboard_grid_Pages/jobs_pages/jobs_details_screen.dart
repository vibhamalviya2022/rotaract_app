import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';

class JobsDetailsScreen extends StatefulWidget {
  const JobsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<JobsDetailsScreen> createState() => _JobsDetailsScreenState();
}

class _JobsDetailsScreenState extends State<JobsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarData(
          appBarTitle: "Company name",
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
      //       title: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             "Company name",
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           Icon(Icons.more_vert)
      //         ],
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
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/java.png',
                    height: 150,
                  ),
                  //Text('Company name'),
                ],
              )),
          Text(
            'Company name',
            style: TextStyle(color: ColorsConstData.appBaseColor, fontSize: 30),
          ),
          Container(padding: EdgeInsets.only(top:400),
            child: MaterialButton(
                        minWidth:200 ,
                        height: 50,
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DashboardPage()));
                        },
                        color: ColorsConstData.appBaseColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Apply",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
          ),
        ]),
      ),
    );
  }
}
