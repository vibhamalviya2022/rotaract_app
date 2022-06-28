import 'package:flutter/material.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/jobs_pages/jobs_details_screen.dart';
import 'package:rotaract_app/constant/constant.dart';

class HiringTabScreen extends StatefulWidget {
  const HiringTabScreen({Key? key}) : super(key: key);

  @override
  State<HiringTabScreen> createState() => _HiringTabScreenState();
}

class _HiringTabScreenState extends State<HiringTabScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(8),
        itemCount: 5,
        // physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
                color: ColorsConstData.appBaseColor, width: .5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobsDetailsScreen()));
                },
                child: Padding(
                  padding:
                  EdgeInsets.only(top: 10, bottom: 20, left: 10),
                  child: ListTile(
                    title: Text(
                      "Company name",
                      style: TextStyle(
                          color: ColorsConstData.appBaseColor),
                    ),
                    subtitle: Text("Details",
                        style: TextStyle(color: Colors.black)),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/images/java.png"), // no matter how big it is, it won't overflow
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
                padding: EdgeInsets.only(
                    top: 5, bottom: 5, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.bookmark_border,
                      size: 25,
                      color: ColorsConstData.appBaseColor,
                    ),

                    Icon(
                      Icons.chat_outlined,
                      size: 22,
                      color: ColorsConstData.appBaseColor,
                    ),
                    MaterialButton(
                      minWidth: size.width*0.50,
                      // height: 10,
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
    );
  }
}
