import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotaract_app/Screen/bottom_navigation/calendar_pages/event_date_screen.dart';
import 'package:rotaract_app/Screen/drawer_pages/contact_us_page/contact_us_screen.dart';
import 'package:rotaract_app/Screen/drawer_pages/event_pages/event_screen.dart';
import 'package:rotaract_app/Screen/drawer_pages/project_management_page/project_mangement_screen.dart';
import 'package:rotaract_app/Screen/login_signup_screen/login_page.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/shared_pfrefs_data/shared_prefs_key.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feedback_page/feedback_screen.dart';
import '../bottom_navigation/activity_screen.dart';
import 'about_us_pages/about_us_screen.dart';
import 'attendance_pages/attendance_screen.dart';
import 'download_page.dart/download_screen.dart';
import 'members_page/member_screen.dart';
import 'post_ask_pages/post_ask_screen.dart';
import 'projects_page/project_page.dart';

class DrawerNavigationScreen extends StatefulWidget {
  const DrawerNavigationScreen({Key? key}) : super(key: key);

  @override
  State<DrawerNavigationScreen> createState() => _DrawerNavigationScreenState();
}

class _DrawerNavigationScreenState extends State<DrawerNavigationScreen> {
  void _popupDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Logout'),
            content: Text('Are you sure want to exit!'),
            actions: <Widget>[
              InkWell(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove(SharedPrefsKey.isLoginUser);
                  prefs.remove(SharedPrefsKey.memberId);
                  prefs.clear();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => LoginPage()));
                },
                child: Text(
                  'YES',
                  style: TextStyle(
                    color: ColorsConstData.appBaseColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'NO',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Material(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            // buildMenuItem(
            //   text: 'Member',
            //   icon: Icons.people,
            //   onClicked: () => selectedItem(context, 0),
            // ),
            // Divider(
            //   color: Colors.black,
            // ),
            buildMenuItem(
              text: 'Attendance',
              icon: Icons.assignment_turned_in,
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AttendanceScreen(),

                ));

              },
            ),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
              text: 'Post ask',
              icon: Icons.question_answer_outlined,
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PostAskScreen(),
                ));
              },
            ),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
              text: 'All Event',
              icon: Icons.event,
              onClicked: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EventScreen(),
                ));
              },
            ),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
              text: 'Project Management',
              icon: Icons.manage_accounts_sharp,
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProjectManagementScreen(),
                ));
              },
            ),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
              text: 'Contact us',
              icon: Icons.phone,
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContactUsScreen(),
                ));
              },
            ),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
              text: 'Projects',
              icon: Icons.post_add_rounded,
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProjectPage(),
                ));
              },
            ),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
              text: 'About us',
              icon: Icons.people,
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AboutUsScreen(),
                ));
              },
            ),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
              text: 'Feedback',
              icon: Icons.feedback_sharp,
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FeedbackScreen(),
                ));
              },
            ),
            Divider(
              color: Colors.black,
            ),
            buildMenuItem(
              text: 'Download',
              icon: Icons.file_download_outlined,
              onClicked: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DownloadScreen(),
                ));
              },
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(height: 12),
            buildMenuItem(
              text: 'Logout',
              icon: Icons.logout,
              onClicked: () => _popupDialog(context),
            ),
          ],
        ),
      )),
    );
  }

  // buildHeader(
  //         {required String name,
  //         required String email,
  //         required String Image,
  //         VoidCallback? onClicked}) =>
  //     InkWell(
  //       onTap: onClicked,
  //       child: Container(
  //         padding: EdgeInsets.symmetric(vertical: 40),
  //         child: Row(children: [
  //           CircleAvatar(
  //             radius: 30,
  //             backgroundImage: AssetImage(Image),
  //           ),
  //           SizedBox(
  //             width: 20,
  //           ),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 name,
  //                 style: TextStyle(
  //                     fontSize: 20, color: ColorsConstData.appBaseColor),
  //               ),
  //               SizedBox(
  //                 height: 4,
  //               ),
  //               Text(
  //                 email,
  //                 style: TextStyle(
  //                     fontSize: 20, color: ColorsConstData.appBaseColor),
  //               )
  //             ],
  //           )
  //         ]),
  //       ),
  //     );

  buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    final color = ColorsConstData.appBaseColor;
    final hoverColor = Colors.blue[100];
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
// tnhis is code by susmita
// selectedItem(BuildContext context, int i) {
//   //Navigator.of(context).pop();
//   switch (i) {
//     case 0:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => MemberScreen(),
//       ));
//
//       break;
//     case 1:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => AttendanceScreen(),
//       ));
//       break;
//     case 2:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => ActivityScreen(),
//       ));
//       break;
//     case 3:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => PostAskScreen(),
//       ));
//       break;
//     case 4:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => EventDateScreen(),
//       ));
//       break;
//     case 5:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => ProjectManagementScreen(),
//       ));
//       break;
//     case 6:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => ContactUsScreen(),
//       ));
//       break;
//     case 7:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => const ProjectPage(),
//       ));
//       break;
//     case 8:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => AboutUsScreen(),
//       ));
//       break;
//     case 9:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => FeedbackScreen(),
//       ));
//       break;
//     case 10:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => DownloadScreen(),
//       ));
//       break;
//
//     case 11:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => LogoutPage(),
//       ));
//       break;
//   }
// }
}
