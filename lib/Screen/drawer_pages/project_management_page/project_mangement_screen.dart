import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotaract_app/Screen/all_text_data_const/all_text_data_const.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';
class ProjectManagementScreen extends StatefulWidget {
  const ProjectManagementScreen({Key? key}) : super(key: key);

  @override
  _ProjectManagementScreenState createState() => _ProjectManagementScreenState();
}

class _ProjectManagementScreenState extends State<ProjectManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarData(
          appBarTitle: "Project Management",
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
      //         "Project Management",
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
      body: Padding(
        padding: const EdgeInsets.only(top: 8,left: 10,right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: ColorsConstData.appBaseColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AllTextDataConst(textData: "Project name",
                  fontSize: 25,
                  mainAxisAlignment: MainAxisAlignment.center,
                  fontWeight: FontWeight.bold,
                  color: ColorsConstData.appBaseColor,
                ),
                AllTextDataConst(textData: "Project chairman",
                  fontSize: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  color: Colors.black,
                ),
                AllTextDataConst(textData: "Project co-chairman",
                  fontSize: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  color: Colors.black,
                ),
                AllTextDataConst(textData: "Intention",
                  fontSize: 25,
                  mainAxisAlignment: MainAxisAlignment.center,
                  fontWeight: FontWeight.bold,
                  color: ColorsConstData.appBaseColor,
                ),
                AllTextDataConst(textData: "Avenue",
                  fontSize: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  color: Colors.black,
                ),
                AllTextDataConst(textData: "Timing 10:00 to 4:00",
                  fontSize: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  color: Colors.black,
                ),
                AllTextDataConst(textData: "Day and Date",
                  fontSize: 19,
                  mainAxisAlignment: MainAxisAlignment.center,
                  color: Colors.black,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      'Banner upload',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(ColorsConstData.appBaseColor,),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      'Guest list',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(ColorsConstData.appBaseColor,),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      'Agenda/Schedule',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(ColorsConstData.appBaseColor,),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      'Resources',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(ColorsConstData.appBaseColor,),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      'Event confirmation',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(ColorsConstData.appBaseColor,),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      'Income',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(ColorsConstData.appBaseColor,),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      'Outcome',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(ColorsConstData.appBaseColor,),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      'Event overview',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(ColorsConstData.appBaseColor,),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: IconButton(
                    onPressed: (){},
                    icon: Image.asset('assets/images/pdf.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
