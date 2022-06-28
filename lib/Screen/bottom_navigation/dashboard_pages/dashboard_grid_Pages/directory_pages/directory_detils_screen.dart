

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/directory_pages/directory_tab_page/member_address_tab_screen.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/directory_pages/directory_tab_page/member_business_tab_screen.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/directory_pages/directory_tab_page/member_job_tab_screen.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/directory_pages/directory_tab_page/member_personal_tab_screen.dart';
import 'package:rotaract_app/constant/constant.dart';

class DirectoryDetailsScreen extends StatefulWidget {
  var index;
  DirectoryDetailsScreen({this.index});
  @override
  State<DirectoryDetailsScreen> createState() => _DirectoryDetailsScreenState();
}

class _DirectoryDetailsScreenState extends State<DirectoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
        initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsConstData.appBaseColor,
            centerTitle: true,
            title: Text("Member", style: TextStyle(color: Colors.white)),
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
            bottom: TabBar(
              //isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Text(
                    'Personal',
                  ),
                ),
                Tab(
                  child: Text(
                    'Address',
                  ),
                ),
                Tab(
                  child: Text(
                    'Business',
                  ),
                ),
                Tab(
                  child: Text(
                    'Jobs',
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
                MemberPersonalTabScreen(index: widget.index),
                MemberAddressTabScreen(index: widget.index),
                MemberBusinessTabScreen(index: widget.index),
                MemberJobTabScreen(index: widget.index),
              ]
            ),
          ),
        );


  }
}
