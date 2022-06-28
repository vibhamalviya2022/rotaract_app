import 'package:flutter/material.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/Board_of_director_page.dart/dashboar_boardofdirector_screen.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/aarogyam_pages/dashboard_aarogyam_screen.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/blood_donate_page/dashboard_blood_donations_screen.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/blood_donate_page/tab_bar_view_pages/request_tab/blood_donate_other_requested_list.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/blood_donate_page/tab_bar_view_pages/request_tab/blood_donate_request_for_other.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/blood_donate_page/tab_bar_view_pages/request_tab/blood_donate_request_for_self.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/blood_donate_page/tab_bar_view_pages/request_tab/blood_donate_self_requested_list.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/directory_pages/dashboard_directory_screen.dart';

class BloodDonateRequestGridData extends StatefulWidget {
  const BloodDonateRequestGridData({Key? key}) : super(key: key);

  @override
  State<BloodDonateRequestGridData> createState() => _BloodDonateRequestGridDataState();
}
class _BloodDonateRequestGridDataState extends State<BloodDonateRequestGridData> {

  List<String> gridTextTitle = [
    "Request For Self",
    "Request For Other",
    "Self Requested List",
    "Other Requested List",
  ];

  List<String> gridimages = [
    "assets/images/Grid/director-chair.png",
    "assets/images/Grid/directory.png",
    "assets/images/Grid/businessman.png",
    "assets/images/Grid/diamond-ring.png",
  ];

  List<Widget> pagesNavigator = [
    BloodDonateRequestForSelf(),
    BloodDonateRequestForOther(),
    BloodDonateSelfRequestedList(),
    BloodDonateOtherRequestedList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
            itemCount: gridTextTitle.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
            ), itemBuilder: (context,index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => pagesNavigator[index]));
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 2.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(gridimages[index],
                      // image: AssetImage("assets/images/Grid/doctor.png"),
                      width: 70,
                      height: 70,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      gridTextTitle[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
