import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/all_text_data_const/profile_text_form_field_const.dart';
import 'package:rotaract_app/constant/constant.dart';

import '../../../../../../provider/providerNotifier.dart';

class MemberBusinessTabScreen extends StatefulWidget {
  var index;
   MemberBusinessTabScreen({this.index});

  @override
  State<MemberBusinessTabScreen> createState() =>
      _MemberBusinessTabScreenState();
}

class _MemberBusinessTabScreenState extends State<MemberBusinessTabScreen> {
  TextEditingController companyController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController businessaddController = TextEditingController();
  TextEditingController aboutbusinessController = TextEditingController();
  TextEditingController occupationController = TextEditingController();

  Timer? timer;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context, listen: false);

    providerNotifier.getAllManageMemberListDataNotifier().whenComplete(() {
      companyController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.address!;

      categoryController.text = providerNotifier.allManageMemberList.data![widget.index].managemember!.first.businessCategory!;
      businessaddController.text = providerNotifier.allManageMemberList.data![widget.index].managemember!.first.businessAddress!;
      aboutbusinessController.text = providerNotifier.allManageMemberList.data![widget.index].managemember!.first.aboutBusiness!;
    });
    timer = Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        timer!.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:isLoading == true
          ? Container(
        child: const Padding(
          padding: EdgeInsets.only(top: 300.0),
          child: Center(
            child: CircularProgressIndicator(
              color: ColorsConstData.appBaseColor,
            ),
          ),
        ),
      )
          :  Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: ColorsConstData.appBaseColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProfileTextFormFieldConst(
                                  labelName: "Company",
                                  hintText: "Enter Your company name",
                                  controller: companyController,
                                ),
                                ProfileTextFormFieldConst(
                                  labelName: "Business Category",
                                  hintText: "Enter category",
                                  controller: categoryController,
                                ),
                                ProfileTextFormFieldConst(
                                  labelName: "Business Address",
                                  hintText: "Enter your business address",
                                  controller: businessaddController,
                                ),
                                ProfileTextFormFieldConst(
                                  labelName: "About Business",
                                  hintText: "About your business",
                                  controller: aboutbusinessController,
                                ),
                                ProfileTextFormFieldConst(
                                  labelName: "Occupation",
                                  hintText: "Enter your occupation",
                                  controller: aboutbusinessController,
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 90, vertical: 40),
                                //   child: Container(
                                //     decoration: BoxDecoration(),
                                //     child: MaterialButton(
                                //       minWidth: size.width * 0.50,
                                //       height: 40,
                                //       onPressed: () {
                                //         // Navigator.push(
                                //         //     context,
                                //         //     MaterialPageRoute(
                                //         //         builder: (context) => HomePage()));
                                //       },
                                //       color: ColorsConstData.appBaseColor,
                                //       shape: RoundedRectangleBorder(
                                //         side: BorderSide(color: Colors.white),
                                //         borderRadius: BorderRadius.circular(50),
                                //       ),
                                //       child: const Text(
                                //         "Update",
                                //         style: TextStyle(
                                //           fontWeight: FontWeight.w600,
                                //           fontSize: 15,
                                //           color: Colors.white,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                ///old code by susmita
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10, vertical: 8),
                                //   child: TextFormField(
                                //     decoration: InputDecoration(
                                //       border: UnderlineInputBorder(),
                                //       labelText: 'Company:',
                                //       hintText: 'Enter company name',
                                //       labelStyle: TextStyle(
                                //         color: ColorsConstData.appBaseColor,
                                //       ),
                                //       focusedBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color:
                                //           ColorsConstData.appBaseColor,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10, vertical: 8),
                                //   child: TextFormField(
                                //     decoration: InputDecoration(
                                //       border: UnderlineInputBorder(),
                                //       labelText: 'Business Category:',
                                //       hintText: 'Enter category',
                                //       labelStyle: TextStyle(
                                //         color: ColorsConstData.appBaseColor,
                                //       ),
                                //       focusedBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color:
                                //           ColorsConstData.appBaseColor,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10, vertical: 8),
                                //   child: TextFormField(
                                //     decoration: InputDecoration(
                                //       border: UnderlineInputBorder(),
                                //       labelText: 'Address:',
                                //       hintText: 'Enter address',
                                //       labelStyle: TextStyle(
                                //         color: ColorsConstData.appBaseColor,
                                //       ),
                                //       focusedBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color:
                                //           ColorsConstData.appBaseColor,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10, vertical: 8),
                                //   child: TextFormField(
                                //     decoration: InputDecoration(
                                //       border: UnderlineInputBorder(),
                                //       labelText: 'About Business:',
                                //       hintText: 'About your business',
                                //       labelStyle: TextStyle(
                                //         color: ColorsConstData.appBaseColor,
                                //       ),
                                //       focusedBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color:
                                //           ColorsConstData.appBaseColor,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10, vertical: 8),
                                //   child: TextFormField(
                                //     decoration: InputDecoration(
                                //       border: UnderlineInputBorder(),
                                //       labelText: 'Occupation:',
                                //       hintText: 'Enter occupation',
                                //       labelStyle: TextStyle(
                                //         color: ColorsConstData.appBaseColor,
                                //       ),
                                //       focusedBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color:
                                //           ColorsConstData.appBaseColor,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ]),
                        )),
                  )
                ],
              ),
            ),
    );
  }
}
