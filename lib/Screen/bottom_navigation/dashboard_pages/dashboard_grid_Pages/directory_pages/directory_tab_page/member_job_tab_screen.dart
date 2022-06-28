
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/all_text_data_const/profile_text_form_field_const.dart';
import 'package:rotaract_app/constant/constant.dart';

import '../../../../../../provider/providerNotifier.dart';

class MemberJobTabScreen extends StatefulWidget {
  var index;
   MemberJobTabScreen({this.index});

  @override
  State<MemberJobTabScreen> createState() => _MemberJobTabScreenState();
}

class _MemberJobTabScreenState extends State<MemberJobTabScreen> {
  TextEditingController companyController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController experianceController = TextEditingController();

  Timer? timer;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
    Provider.of<ProviderNotifier>(context, listen: false);

    providerNotifier.getAllManageMemberListDataNotifier().whenComplete(() {
      companyController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.companyName!;

      experianceController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.experience!;
      postController.text = providerNotifier.allManageMemberList.data![widget.index].managemember!.first.post!;
      // occupationController.text =  providerNotifier.allManageMemberList!.data!.first.managemember!.first.!;
      // country = providerNotifier.memberList.first!.countryId!;
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
      child: isLoading == true
          ? Container(
        child:  Padding(
          padding: const EdgeInsets.only(top: 300.0),
          child: Center(
            child: CircularProgressIndicator(
              color: ColorsConstData.appBaseColor,
            ),
          ),
        ),
      ) : Container(
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
                        labelName: "Post",
                        hintText: "Enter Your present post",
                        controller: postController,
                      ),
                      ProfileTextFormFieldConst(
                        labelName: "Experiance",
                        hintText: "Enter Your experiance",
                        controller: experianceController,
                      ),
                      SizedBox(
                        height: 10,
                      )
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 90,vertical: 40),
                      //   child: Container(
                      //     decoration: BoxDecoration(),
                      //     child: MaterialButton(
                      //       minWidth: size.width*0.50,
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
                      //           color: ColorsConstData.appBaseColor,
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
                      //       labelText: 'Post:',
                      //       hintText: 'Enter your present post',
                      //       labelStyle: TextStyle(
                      //         color: ColorsConstData.appBaseColor,
                      //       ),
                      //       focusedBorder: UnderlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: ColorsConstData.appBaseColor,
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
                      //       labelText: 'Experience:',
                      //       hintText: 'Enter experience',
                      //       labelStyle: TextStyle(
                      //         color: ColorsConstData.appBaseColor,
                      //       ),
                      //       focusedBorder: UnderlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: ColorsConstData.appBaseColor,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
