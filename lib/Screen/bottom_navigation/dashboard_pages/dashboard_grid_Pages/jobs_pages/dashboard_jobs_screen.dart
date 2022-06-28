import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/jobs_pages/jobs_tab_page/hiring_tab_screen.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/jobs_pages/jobs_tab_page/hunting_tab_screen.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'jobs_details_screen.dart';

class DashboardJobsScreen extends StatefulWidget {
  const DashboardJobsScreen({Key? key}) : super(key: key);

  @override
  State<DashboardJobsScreen> createState() => _DashboardJobsScreenState();
}

class _DashboardJobsScreenState extends State<DashboardJobsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,

      child: Scaffold(
        ///old code by susmita
        // resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar:




          PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              child: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                bottom: TabBar(
                  // isScrollable: true,
                  indicatorWeight: 3,
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Text(
                        'Hiring',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text('Hunting',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                title: Text(
                  "Jobs",
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 0,
                backgroundColor: ColorsConstData.appBaseColor,
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
                systemOverlayStyle: SystemUiOverlayStyle.dark,
              ),
            ),
          ),
          body: TabBarView(children: [
            HiringTabScreen(),
            HuntingTabScreen(),
          ],
        ),
      ),
    );
  }
}
