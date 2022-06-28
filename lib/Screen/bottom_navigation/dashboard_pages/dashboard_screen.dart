import 'package:flutter/material.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/jobs_pages/jobs_details_screen.dart';
import 'package:rotaract_app/Screen/drawer_pages/post_ask_pages/post_ask_screen.dart';
import 'package:rotaract_app/Screen/manage_profile_page/profile_tab_pages/jobs_tab_screen.dart';
import 'dashboard_grid_Pages/Board_of_director_page.dart/dashboar_boardofdirector_screen.dart';
import 'dashboard_grid_Pages/aarogyam_pages/dashboard_aarogyam_screen.dart';
import 'dashboard_grid_Pages/blood_donate_page/dashboard_blood_donations_screen.dart';
import 'dashboard_grid_Pages/directory_pages/dashboard_directory_screen.dart';
import 'dashboard_grid_Pages/jobs_pages/dashboard_jobs_screen.dart';
import 'dashboard_grid_Pages/matrimony_pages/dashboard_matrimony_screen.dart';
import 'dashboard_grid_Pages/sponors_pages/dashboard_sponsors_screen.dart';
import 'dashboard_grid_Pages/upcoming_pages/dashboard_upcoming_screen.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  List<String> gridTextTitle = [
    "Aarogyam",
    "Blood Donate",
    // "Calendar",
    "Board of Director",
    "Directory",
    // "Jobs",
    //"Matrimony",
    "Post Ask",
    "Sponsors",
    "Upcoming Project"
  ];

  List<String> gridimages = [
    "assets/images/Grid/doctor.png",
    "assets/images/Grid/blood-donation.png",
    // "assets/images/Grid/calendar.png",
    "assets/images/Grid/director-chair.png",
    "assets/images/Grid/directory.png",
    // "assets/images/Grid/businessman.png",
    "assets/images/Grid/postask-removebg-preview.png",
    "assets/images/Grid/deal.png",
    "assets/images/Grid/lifestyle.png",
  ];

  List<Widget> pagesNavigator = [
    DashboardAarogyamScreen(),
    DashBoardBloodDonationsScreen(),
    BoardOfDirectorScreen(),
    DirectoryScreen(),

    //JobsDetailsScreen(),
    //MatrimonyScreen(),
    PostAskScreen(),
    SponsorsScreen(),
    UpcomingProjectScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding:  EdgeInsets.only(top:10.0,right: 10,left: 10),
        child: GridView.builder(
          itemCount: gridTextTitle.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5
            ), itemBuilder: (BuildContext context,int index) {
              return Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                      // side: BorderSide(color: Colors.pink)
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => pagesNavigator[index]));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(gridimages[index],
                        // image: AssetImage("assets/images/Grid/doctor.png"),
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        gridTextTitle[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              );
        }),
      )
//// this is old code  by susmita

      // GridView.count(
      //     padding: const EdgeInsets.all(20),
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //     crossAxisCount: 3,
      //     children: <Widget>[
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => DashboardAarogyamScreen()));
      //         },
      //         child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               border: Border.all(color: Colors.black),
      //               color: Colors.white,
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.grey,
      //                   offset: Offset(0.0, 2.0), //(x,y)
      //                   blurRadius: 6.0,
      //                 ),
      //               ],
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Image(
      //                   image: AssetImage("assets/images/Grid/doctor.png"),
      //                   width: 50,
      //                   height: 50,
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   "Aarogyam",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(color: Colors.black, fontSize: 15),
      //                 )
      //               ],
      //             )),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => DashBoardBloodDonationsScreen()));
      //         },
      //         child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               border: Border.all(color: Colors.black),
      //               color: Colors.white,
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.grey,
      //                   offset: Offset(0.0, 2.0), //(x,y)
      //                   blurRadius: 6.0,
      //                 ),
      //               ],
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Image(
      //                   image:
      //                       AssetImage("assets/images/Grid/blood-donation.png"),
      //                   width: 50,
      //                   height: 40,
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   "Blood Donate",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(color: Colors.black, fontSize: 15),
      //                 )
      //               ],
      //             )),
      //       ),
      //       // InkWell(
      //       //   onTap: () {
      //       //     Navigator.push(context,
      //       //         MaterialPageRoute(builder: (context) => CalendarPage()));
      //       //   },
      //       //   child: Container(
      //       //       decoration: BoxDecoration(
      //       //         borderRadius: BorderRadius.circular(20),
      //       //         border: Border.all(color: Colors.black),
      //       //         color: Colors.white,
      //       //         boxShadow: [
      //       //           BoxShadow(
      //       //             color: Colors.grey,
      //       //             offset: Offset(0.0, 2.0), //(x,y)
      //       //             blurRadius: 6.0,
      //       //           ),
      //       //         ],
      //       //       ),
      //       //       child: Column(
      //       //         mainAxisAlignment: MainAxisAlignment.center,
      //       //         children: [
      //       //           Image(
      //       //             image: AssetImage("assets/images/Grid/calendar.png"),
      //       //             width: 50,
      //       //             height: 50,
      //       //           ),
      //       //           SizedBox(
      //       //             height: 5,
      //       //           ),
      //       //           Text(
      //       //             "Calendar",
      //       //             textAlign: TextAlign.center,
      //       //             style: TextStyle(color: Colors.black, fontSize: 15),
      //       //           )
      //       //         ],
      //       //       )),
      //       // ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => BoardOfDirectorScreen()));
      //         },
      //         child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               border: Border.all(color: Colors.black),
      //               color: Colors.white,
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Image(
      //                   image:
      //                       AssetImage("assets/images/Grid/director-chair.png"),
      //                   width: 50,
      //                   height: 50,
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   "Board of Director",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(color: Colors.black, fontSize: 15),
      //                 )
      //               ],
      //             )),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => DirectoryScreen()));
      //         },
      //         child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               border: Border.all(color: Colors.black),
      //               color: Colors.white,
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.grey,
      //                   offset: Offset(0.0, 2.0), //(x,y)
      //                   blurRadius: 6.0,
      //                 ),
      //               ],
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Image(
      //                   image: AssetImage("assets/images/Grid/directory.png"),
      //                   width: 50,
      //                   height: 50,
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   "Directory",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(color: Colors.black, fontSize: 15),
      //                 )
      //               ],
      //             )),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => JobsDetailsScreen()));
      //         },
      //         child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               border: Border.all(color: Colors.black),
      //               color: Colors.white,
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.grey,
      //                   offset: Offset(0.0, 2.0), //(x,y)
      //                   blurRadius: 6.0,
      //                 ),
      //               ],
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Image(
      //                   image: AssetImage("assets/images/Grid/businessman.png"),
      //                   width: 50,
      //                   height: 50,
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   "Jobs",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(color: Colors.black, fontSize: 15),
      //                 )
      //               ],
      //             )),
      //       ),
      //       // InkWell(
      //       //   onTap: () {
      //       //     Navigator.push(
      //       //         context,
      //       //         MaterialPageRoute(
      //       //             builder: (context) =>  MatrimonyPage()));
      //       //   },
      //       //   child: Container(
      //       //       decoration: BoxDecoration(
      //       //         borderRadius: BorderRadius.circular(20),
      //       //         border: Border.all(color: Colors.black),
      //       //         color: Colors.white,
      //       //         boxShadow: [
      //       //           BoxShadow(
      //       //             color: Colors.grey,
      //       //             offset: Offset(0.0, 2.0), //(x,y)
      //       //             blurRadius: 6.0,
      //       //           ),
      //       //         ],
      //       //       ),
      //       //       child: Column(
      //       //         mainAxisAlignment: MainAxisAlignment.center,
      //       //         children: [
      //       //           Image(
      //       //             image:
      //       //                 AssetImage("assets/images/Grid/diamond-ring.png"),
      //       //             width: 50,
      //       //             height: 50,
      //       //           ),
      //       //           SizedBox(
      //       //             height: 5,
      //       //           ),
      //       //           Text(
      //       //             "Matrimony",
      //       //             textAlign: TextAlign.center,
      //       //             style: TextStyle(color: Colors.black, fontSize: 15),
      //       //           )
      //       //         ],
      //       //       )),
      //       // ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => SponsorsScreen()));
      //         },
      //         child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               border: Border.all(color: Colors.black),
      //               color: Colors.white,
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.grey,
      //                   offset: Offset(0.0, 2.0), //(x,y)
      //                   blurRadius: 6.0,
      //                 ),
      //               ],
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Image(
      //                   image: AssetImage("assets/images/Grid/deal.png"),
      //                   width: 50,
      //                   height: 50,
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   "Sponsors",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(color: Colors.black, fontSize: 15),
      //                 )
      //               ],
      //             )),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => UpcomingProjectScreen()));
      //         },
      //         child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               border: Border.all(color: Colors.black),
      //               color: Colors.white,
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.grey,
      //                   offset: Offset(0.0, 2.0), //(x,y)
      //                   blurRadius: 6.0,
      //                 ),
      //               ],
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Image(
      //                   image: AssetImage("assets/images/Grid/lifestyle.png"),
      //                   width: 50,
      //                   height: 40,
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   "Upcoming Project",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(color: Colors.black, fontSize: 15),
      //                 )
      //               ],
      //             )),
      //       ),
      //     ]),
    );
  }
}
