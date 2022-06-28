import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../provider/providerNotifier.dart';

class BloodDonateSelfRequestedList extends StatefulWidget {
  const BloodDonateSelfRequestedList({Key? key}) : super(key: key);

  @override
  State<BloodDonateSelfRequestedList> createState() =>
      _BloodDonateSelfRequestedListState();
}

class _BloodDonateSelfRequestedListState
    extends State<BloodDonateSelfRequestedList> {
  bool isLoading = true;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    providerNotifier.getAllSelfRequestBloodListDataNotifier().whenComplete(() {
      timer = Timer(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
          timer!.cancel();
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
          appBarTitle: "Self Requested List",
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
            : providerNotifier.getSelfRequestList!.data!.isEmpty
                ? Center(
                    child: Text("No Data", style: TextStyle(fontSize: 18)),
                  )
                : Container(
                    padding: EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(10),
                            itemCount: providerNotifier
                                .getSelfRequestList?.data!.length,
                            // physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                    color: ColorsConstData.appBaseColor,
                                    width: .5),
                              ),
                              child: ExpansionTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          providerNotifier
                                              .getSelfRequestList!
                                              .data![index]
                                              .memberDetails!
                                              .first
                                              .name
                                              .toString(),
                                        ),
                                        Row(
                                          children: [
                                            Text("Required Blood Group : "),
                                            Text(providerNotifier
                                                .getSelfRequestList!
                                                .data![index]
                                                .memberDetails!
                                                .first
                                                .bloodGroup!),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Discription  : "),
                                            Text(
                                              providerNotifier
                                                  .getSelfRequestList!
                                                  .data![index]
                                                  .description!,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Age : "),
                                            Text(providerNotifier
                                                .getSelfRequestList!
                                                .data![index]
                                                .memberDetails!
                                                .first
                                                .age!),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Gender : "),
                                          providerNotifier
                                                      .getSelfRequestList!
                                                      .data![index]
                                                      .memberDetails!
                                                      .first
                                                      .gender! ==
                                                  "1"
                                              ? Text("Male")
                                              : providerNotifier
                                                          .getSelfRequestList!
                                                          .data![index]
                                                          .memberDetails!
                                                          .first
                                                          .gender! ==
                                                      "2"
                                                  ? Text("Female")
                                                  : Text("Other"),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            launch(
                                                "whatsapp://send?${providerNotifier.getSelfRequestList!.data![index].memberDetails!.first.phoneNumber}="
                                                "&text=Hello!");
                                          });
                                        },
                                        child: Image.asset(
                                          'assets/images/whatsapp.png',
                                          height: 28,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            launch(
                                                'tel:${providerNotifier.getSelfRequestList!.data![index].memberDetails!.first.phoneNumber}');
                                          });
                                        },
                                        child: Image.asset(
                                          'assets/images/phone-call.png',
                                          height: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                              elevation: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
