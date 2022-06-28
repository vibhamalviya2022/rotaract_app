import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/all_text_data_const/profile_text_form_field_const.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/shared_pfrefs_data/shared_prefs_data.dart';

import '../../../provider/providerNotifier.dart';
import '../../../shared_pfrefs_data/shared_prefs_key.dart';

class BusinessTabScreen extends StatefulWidget {
  const BusinessTabScreen({Key? key}) : super(key: key);

  @override
  State<BusinessTabScreen> createState() => _BusinessTabScreenState();
}

class _BusinessTabScreenState extends State<BusinessTabScreen> {


  TextEditingController companyController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController businessaddController = TextEditingController();
  TextEditingController aboutbusinessController = TextEditingController();
  TextEditingController occupationController = TextEditingController();

  Timer? timer;
  bool isLoading = false;
  bool isUpdate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
    Provider.of<ProviderNotifier>(context, listen: false);
    providerNotifier.getMemberProfileNotifier().whenComplete(() {
      companyController.text = providerNotifier.memberList.first!.companyName!;
      categoryController.text = providerNotifier.memberList.first!.businessCategory!;
      businessaddController.text = providerNotifier.memberList.first!.businessAddress!;
      aboutbusinessController.text = providerNotifier.memberList.first!.aboutBusiness!;
      occupationController.text =providerNotifier.memberList.first!.occupation!;
    });
    timer = Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = true;
        timer!.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    Size size = MediaQuery.of(context).size;
    return isLoading == false?Center(child: CircularProgressIndicator(color: ColorsConstData.appBaseColor,),) :  SingleChildScrollView(
      child: Container(
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
                            controller: occupationController,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 90,vertical: 40),
                            child: isUpdate == true?Center(child: CircularProgressIndicator(color: ColorsConstData.appBaseColor,),) : Container(
                              decoration: BoxDecoration(),
                              child: MaterialButton(
                                minWidth: size.width*0.50,
                                height: 40,
                                onPressed: () async{
                                  setState(() {
                                    isUpdate = true;
                                  });
                                  var memberId = await SharedPrefsData.getStringData(
                                      SharedPrefsKey.memberId);
                                  var bodyData = json.encode({
                                    "memberId": memberId,
                                    "companyName": companyController.text,
                                    "businessCategory": categoryController.text,
                                    "businessAddress": businessaddController.text,
                                    "aboutBusiness": aboutbusinessController.text
                                   });
                                  setState(() {
                                    providerNotifier
                                        .getUpdateMemberProfileNotifier(bodyData)
                                        .whenComplete(() {
                                      Fluttertoast.showToast(
                                          msg: providerNotifier
                                              .updatememberProfile!.message!
                                              .toString());
                                      setState(() {
                                        isUpdate = false;
                                      });
                                    });
                                  });
                                },
                                color: ColorsConstData.appBaseColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Text(
                                  "Update",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),



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
