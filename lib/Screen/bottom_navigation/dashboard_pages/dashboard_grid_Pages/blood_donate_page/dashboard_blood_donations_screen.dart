import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/blood_donate_page/tab_bar_view_pages/blood_bank_tab_screen.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/blood_donate_page/tab_bar_view_pages/donor_tab/donor_tab_screen.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/blood_donate_page/tab_bar_view_pages/request_tab/blood_donate_request_for_self.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/blood_donate_page/tab_bar_view_pages/request_tab/blood_donate_request_grid_data.dart';
import 'package:rotaract_app/constant/constant.dart';

class DashBoardBloodDonationsScreen extends StatefulWidget {
  const DashBoardBloodDonationsScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardBloodDonationsScreen> createState() => _DashBoardBloodDonationsScreenState();
}

class _DashBoardBloodDonationsScreenState extends State<DashBoardBloodDonationsScreen> {
/// old code by susmita
  // get _handleradiobutton => null;
  

  @override
  Widget build(BuildContext context) {
    
///this is old code by susmita
    // DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    //       value: item,
    //       child: Text(
    //         item,
    //         style: TextStyle(fontSize: 15),
    //       ),
    //     );
    return DefaultTabController(
        // initialIndex: 0,
        length: 3,
        child: Scaffold(
            // resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(90),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                  ),
                  child: Container(
                    decoration:  BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorsConstData.appBaseColor,
                          ColorsConstData.appBaseColor,
                          Colors.pinkAccent,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: AppBar(
                      centerTitle: true,
                      // automaticallyImplyLeading: false,
                      bottom: TabBar(
                          indicatorWeight: 3,
                          indicatorColor: Colors.white,
                          tabs: [
                            Tab(
                              child: Text(
                                'Donar',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text('Request',
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold)),
                            ),
                            Tab(
                              child: Text('BloodBank',
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold)),
                            ),

                          ]),
                      title: Text('Blood donate',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      elevation: 0,
                       backgroundColor: Colors.transparent,
                      leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )),
            body: TabBarView(
              children: [
                DonorTabScreen(),
                BloodDonateRequestGridData(),
                BloodBankTabScreen(),
                // SingleChildScrollView()
              ],
            ),
        ),
    );
  }
}
