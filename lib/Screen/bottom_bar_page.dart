import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'bottom_navigation/activity_screen.dart';
import 'bottom_navigation/calendar_pages/calendar_screen.dart';
import 'bottom_navigation/dashboard_pages/dashboard_screen.dart';
import 'bottom_navigation/notification_screen.dart';


class BottomBarPage extends StatefulWidget {
  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int currentIndex = 0;
  final screens = [
    CalendarScreen(),
    DashboardScreen(),
    ActivityScreen(),
    NotificationScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BubbleBottomBar(
          opacity: 0.5,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index!),
          hasInk: true,
          inkColor: ColorsConstData.appBaseColor,
          hasNotch: true,
          //fabLocation: BubbleBottomBarFabLocation.end,
          items: const <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: ColorsConstData.appBaseColor,
              icon: Icon(
                Icons.home,
                color: ColorsConstData.appBaseColor,
              ),
              activeIcon: Icon(Icons.home, color: Colors.white),
              title: Text("Home",style: TextStyle(color: Colors.white),),
            ),
            BubbleBottomBarItem(
              backgroundColor: ColorsConstData.appBaseColor,
              icon: Icon(
                Icons.dashboard,
                color: ColorsConstData.appBaseColor,
              ),
              activeIcon:
                  Icon(Icons.dashboard, color: Colors.white),
              title: Text("Dashboard",style: TextStyle(color: Colors.white),),
            ),
            BubbleBottomBarItem(
              backgroundColor: ColorsConstData.appBaseColor,
              icon: Icon(
                Icons.local_activity,
                color: ColorsConstData.appBaseColor,
              ),
              activeIcon: Icon(Icons.local_activity,
                  color: Colors.white),
              title: Text("Activity",style: TextStyle(color: Colors.white),),
            ),
            BubbleBottomBarItem(
              backgroundColor: ColorsConstData.appBaseColor,
              icon: Icon(
                Icons.notifications_active,
                color: ColorsConstData.appBaseColor,
              ),
              activeIcon: Icon(Icons.notifications_active,
                  color: Colors.white),
              title: Text("Notification",style: TextStyle(color: Colors.white),),
            ),
          ],
        ));
  }
}
