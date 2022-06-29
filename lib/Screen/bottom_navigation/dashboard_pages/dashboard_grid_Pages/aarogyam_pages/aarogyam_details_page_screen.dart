import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/APIs/api.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/aarogyam_pages/aarogyam_details_about_screen.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/model/get_all_doctor_model.dart';

import 'package:url_launcher/url_launcher.dart';

class AarogyanDetailsScreen extends StatefulWidget {
  GetAllDoctorData dataDoctor;

  AarogyanDetailsScreen({
    required this.dataDoctor,
  });

  @override
  State<AarogyanDetailsScreen> createState() => _AarogyanDetailsScreenState();
}

class _AarogyanDetailsScreenState extends State<AarogyanDetailsScreen> {
  late String url;

  launchURL(String url) async {
    print(url);
    print("print Url regeister");

    if (await canLaunch(url)) {
      await launch(url,);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar:PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarData(
            appBarTitle: "Doctors Details",
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
            height: 20,
            ),
            CircleAvatar(
              child: ClipOval(
                child: Container(
                  child: widget.dataDoctor.image!.first.isEmpty
                      ? Image.asset('assets/images/man.png',width: 100,height: 100,fit: BoxFit.cover,)
                 : Image.network(widget.dataDoctor.image!.first.toString(),fit: BoxFit.cover,height: 100,width: 100,)
                ),
              ),
              maxRadius: 60,
              backgroundColor: Colors.white,
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                widget.dataDoctor.name! == null ? "": widget.dataDoctor.name!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
                height: 20,
                thickness: 2,
                indent: 25,
                endIndent: 25,
                color: Colors.grey),
            SizedBox(height: 20,),
            // Text("About me",
            //     style: TextStyle(
            //         fontSize: 25,
            //         fontWeight: FontWeight.w500,
            //         color: ColorsConstData.appBaseColor)),

            AarogyamDetailsAboutScreen(
              icons: Icons.person,
              dataName: "${widget.dataDoctor.name == null ? "":widget.dataDoctor.name!} ${widget.dataDoctor.lastName == null ? "" : widget.dataDoctor.lastName!}",
            ),
            // AarogyamDetailsAboutScreen(
            //   icons: Icons.person,
            // ),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon( Icons.person),
                const SizedBox(
                  width: 5,
                ),
                Expanded(child: Text("${widget.dataDoctor.subSkill == null ? "":widget.dataDoctor.subSkill!}")),
              ]),
            ),
            const Divider(
              thickness: 1.0,
              color: Colors.black26,
              endIndent: 10,
              indent: 20,
            ),
            AarogyamDetailsAboutScreen(
              icons: Icons.phone,
              dataName: widget.dataDoctor.phone == null ? "" :  widget.dataDoctor.phone!,
            ),
            AarogyamDetailsAboutScreen(
              icons: Icons.mail,
              dataName: widget.dataDoctor.email == null ? "" :widget.dataDoctor.email!,
            ),
            AarogyamDetailsAboutScreen(
              icons: Icons.arrow_forward,
              dataName: widget.dataDoctor.category == null ? "" : widget.dataDoctor.category!,
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon( Icons.arrow_forward),
                const SizedBox(
                  width: 5,
                ),
                Expanded(child: Text("${widget.dataDoctor.description == null ? "" : widget.dataDoctor.description!}")),
              ]),
            ),
             Divider(
              thickness: 1.0,
              color: Colors.black26,
              endIndent: 10,
              indent: 20,
            ),
            AarogyamDetailsAboutScreen(
              icons: Icons.arrow_forward,
              dataName: widget.dataDoctor.experience == null ? "" :widget.dataDoctor.experience!,
            ),
            AarogyamDetailsAboutScreen(
              icons: Icons.arrow_forward,
              dataName: widget.dataDoctor.category == null ? "":widget.dataDoctor.category!,
            ),


            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon( Icons.home),
                const SizedBox(
                  width: 5,
                ),
                Expanded(child: Text("${widget.dataDoctor.address == null ? "": widget.dataDoctor.address!}")),
              ]),
            ),
            const Divider(
              thickness: 1.0,
              color: Colors.black26,
              endIndent: 10,
              indent: 20,
            ),
            AarogyamDetailsAboutScreen(
              icons: Icons.location_city,
              dataName: widget.dataDoctor.country == null ? "" :widget.dataDoctor.country!,
            ),
            AarogyamDetailsAboutScreen(
              icons: Icons.location_city,
              dataName: widget.dataDoctor.state == null ? "" :widget.dataDoctor.state!,
            ),AarogyamDetailsAboutScreen(
              icons: Icons.place,
              dataName:widget.dataDoctor.state == null ? "": widget.dataDoctor.city!,
            ),
            SizedBox(height: 30,),
          ]),
        ),
        bottomNavigationBar:
        Container(
          height:MediaQuery.of(context).size.height * 0.06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    launchURL("tel:${widget.dataDoctor.phone == " "? "" : widget.dataDoctor.phone!}");
                  });
                },
                child: Image.asset(
                  'assets/images/phone-call.png',
                  height: 30,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    launch(
                        'https://www.google.com/maps/dir/?api=1&origin=43.7967876,-79.5331616&destination=43.5184049,-79.8473993&waypoints=43.1941283,-79.59179|43.7991083,-79.5339667|43.8387033,-79.3453417|43.836424,-79.3024487&travelmode=driving&dir_action=navigate');
                  });
                },
                child: Image.asset(
                  'assets/images/placeholder.png',
                  height: 30,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    launch(
                        'mailto:${widget.dataDoctor.email == null ? "" :widget.dataDoctor.email!}?subject=This is Subject Title&body=This is Body of Email');
                  });
                },
                child: Image.asset(
                  'assets/images/gmail.png',
                  height: 30,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    launch("https://wa.me/${widget.dataDoctor.phone == null ? "":widget.dataDoctor.phone!}?text=#msg");
                  });
                },
                child: Image.asset(
                  'assets/images/whatsapp.png',
                  height: 30,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
