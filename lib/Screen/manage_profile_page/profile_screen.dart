import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/directory_pages/directory_tab_page/member_personal_tab_screen.dart';
import 'package:rotaract_app/Screen/manage_profile_page/profile_tab_pages/address_tab_screen.dart';
import 'package:rotaract_app/Screen/manage_profile_page/profile_tab_pages/business_tab_screen.dart';
import 'package:rotaract_app/Screen/manage_profile_page/profile_tab_pages/jobs_tab_screen.dart';
import 'package:rotaract_app/Screen/manage_profile_page/profile_tab_pages/personal_tab_screen.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:select_form_field/select_form_field.dart';

import '../../../provider/providerNotifier.dart';
import '../../model/all_manage_members_model/get_all_manage_members_model.dart';

class ProfileScreen extends StatefulWidget {
  GetAllManageMembersModel? directoryData;
  var screenname;
  ProfileScreen({this.screenname,this.directoryData ,Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
     Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context,listen: false);
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsConstData.appBaseColor,
            centerTitle: true,
            title:Text("My Profile", style: TextStyle(color: Colors.white)),
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
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
            bottom: const TabBar(
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
              PersonalTabScreen(),
              AddressTabScreen(),
              BusinessTabScreen(),
              JobsTabScreen(),
            ],
          ),
        ),
    );
  }
}
