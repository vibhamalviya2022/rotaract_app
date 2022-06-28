import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'matrimony_profile_screen.dart';
class MatrimonyScreen extends StatefulWidget {
  const MatrimonyScreen({Key? key}) : super(key: key);

  @override
  State<MatrimonyScreen> createState() => _MatrimonyScreenState();
}

class _MatrimonyScreenState extends State<MatrimonyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarData(
            appBarTitle: "Matrimony",
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
        //         "Matrimony",
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
            child: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: 5,
            // physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: ColorsConstData.appBaseColor, width: .5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MatrimonyProfileScreen()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 20, left: 10),
                      child: ListTile(
                        title: Text(
                          "Jonh green",
                          style: TextStyle(color: ColorsConstData.appBaseColor),
                        ),
                        subtitle: Text("Software Enginner",
                            style: TextStyle(color: Colors.black)),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/woman.png"), // no matter how big it is, it won't overflow
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorsConstData.appBaseColor,
                          
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.thumb_up_alt_outlined,
                              color: ColorsConstData.appBaseColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.chat_outlined,
                              color: ColorsConstData.appBaseColor,
                            )
                          ],
                        ),
                        MaterialButton(
                          minWidth: 150,
                          // height: 10,
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => DashboardPage()));
                          },
                          color: Color(0xffE5097F),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text(
                            "Request",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              elevation: 4,
            ),
          ),
        )));
  }
}
