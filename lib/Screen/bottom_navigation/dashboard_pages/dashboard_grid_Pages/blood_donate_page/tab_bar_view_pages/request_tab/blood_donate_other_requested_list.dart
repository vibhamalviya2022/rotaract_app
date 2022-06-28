import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/provider/providerNotifier.dart';
import 'package:url_launcher/url_launcher.dart';

class BloodDonateOtherRequestedList extends StatefulWidget {
  const BloodDonateOtherRequestedList({Key? key}) : super(key: key);

  @override
  State<BloodDonateOtherRequestedList> createState() =>
      _BloodDonateOtherRequestedListState();
}

class _BloodDonateOtherRequestedListState
    extends State<BloodDonateOtherRequestedList> {
  bool isLoading = true;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    providerNotifier.getAllOtherRequestBloodListDataNotifier().whenComplete(() {
      timer = Timer(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
          timer?.cancel();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarData(
          appBarTitle: "Other Requested List",
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: isLoading == true
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(
                      color: ColorsConstData.appBaseColor),
                ),
              )
            :  providerNotifier.getOtherRequestList!.data!.isEmpty
            ? Center(
          child: Text("No Data", style: TextStyle(fontSize: 18)),
        )
            :Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount:
                            providerNotifier.getOtherRequestList?.data!.length,
                        // physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                                color: ColorsConstData.appBaseColor, width: .5),
                          ),
                          child: ExpansionTile(
                            // : () {
                            //   // Navigator.push(
                            //   //     context,
                            //   //     MaterialPageRoute(
                            //   //         builder: (context) =>
                            //   //             DirectoryDetailsPage()));
                            // },
                            title: Text(providerNotifier.getOtherRequestList!.data![index].name!),
                             subtitle: providerNotifier.getOtherRequestList!.data![index].bloodgroupDetails!.isEmpty ? Text(""):Text(providerNotifier.getOtherRequestList!.data![index].bloodgroupDetails!.first.group!),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/images/image.png"), // no matter how big it is, it won't overflow
                            ),
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:17.0,bottom: 10),
                                    child: Row(
                                      children: [
                                        Text("Gender : ",style: TextStyle(fontWeight: FontWeight.w600),),
                                        Text(providerNotifier.getOtherRequestList!.data![index].gender!)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:17.0,bottom: 10),
                                    child: Row(
                                      children: [
                                        Text("Relation : ",style: TextStyle(fontWeight: FontWeight.w600),),
                                        Text(providerNotifier.getOtherRequestList!.data![index].relation!)
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                            trailing: Container(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        launch(
                                            "https://wa.me/${providerNotifier.getOtherRequestList?.data![index].phone}?text=#msg");
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/images/whatsapp.png',
                                      height: 28,
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.02),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        launch('tel:${providerNotifier.getOtherRequestList?.data![index].phone}');
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/images/phone-call.png',
                                      height: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          elevation: 4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
