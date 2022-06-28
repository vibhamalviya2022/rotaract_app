import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/all_text_data_const/profile_drop_down_const.dart';
import 'package:rotaract_app/Screen/all_text_data_const/profile_text_form_field_const.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/provider/providerNotifier.dart';
import 'package:select_form_field/select_form_field.dart';

class MemberAddressTabScreen extends StatefulWidget {
  var index;
   MemberAddressTabScreen({this.index});

  @override
  State<MemberAddressTabScreen> createState() => _MemberAddressTabScreenState();
}

class _MemberAddressTabScreenState extends State<MemberAddressTabScreen> {
  bool isLoading = true;
  Timer? timer;
  TextEditingController addressController = TextEditingController();
  TextEditingController talukaController = TextEditingController();
  TextEditingController villageController = TextEditingController();


  var selectCountry = "Select Country";
  var selectState = "Select State";
  var selectCity = "Select city";

  var stateId;
  var cityId;
  var countryId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    providerNotifier.getAllManageMemberListDataNotifier().whenComplete(() {
      addressController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.address!;
      talukaController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.taluka!;
      villageController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.village!;
      selectCountry = providerNotifier.allManageMemberList.data![widget.index].countries!.first.countryName!;
      selectState =  providerNotifier.allManageMemberList.data![widget.index].states!.first.stateName!;
      selectCity = providerNotifier.allManageMemberList.data![widget.index].cities!.first.cityName!;
    });
    timer = Timer(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
        timer?.cancel();
      });

    });

  }

  final List<Map<String, dynamic>> _district = [
    {
      'value': 'Select your district',
    },
    {
      'value': 'chandrapur',
      'label': 'Chandrapur',
    },
    {
      'value': 'alwar',
      'label': 'Alwar',
    },
    {
      'value': 'baran',
      'label': 'Baran',
    },
    {
      'value': 'jalgaon',
      'label': 'Jalgaon',
    },
    {
      'value': 'surat',
      'label': 'Surat',
    },
  ];

  final List<Map<String, dynamic>> _city = [
    {
      'value': 'Select your city',
    },
    {
      'value': 'pune',
      'label': 'Pune',
    },
    {
      'value': 'jaipur',
      'label': 'Jaipur',
    },
    {
      'value': 'surat',
      'label': 'Surat',
    },
  ];

  final List<Map<String, dynamic>> _state = [
    {
      'value': 'Select your state',
    },
    {
      'value': 'maharastra',
      'label': 'Maharastra',
    },
    {
      'value': 'rajasthan',
      'label': 'Rajasthan',
    },
    {
      'value': 'gujarat',
      'label': 'Gujarat',
    },
  ];

  final List<Map<String, dynamic>> _country = [
    {
      'value': 'Select your country',
    },
    {
      'value': 'india',
      'label': 'India',
    },
  ];

  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: isLoading == true
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
          : Container(
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
                                  labelName: "Address",
                                  hintText: "Enter Your address",
                                  controller: addressController,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                  child: DropdownButton<dynamic>(
                                    isExpanded: true,
                                    hint: Text(selectCountry == null ? "select Country":selectCountry,
                                        style:
                                        const TextStyle(color: Colors.black)),
                                    onChanged: (val) {
                                      setState(() {
                                        selectCountry = val!.toString();
                                        selectState = "Select State";
                                        selectCity = "Select City";
                                      });
                                    },
                                    items:
                                    providerNotifier.countryList.map((var e) {
                                      return DropdownMenuItem<String>(
                                        onTap: () {
                                          setState(() {
                                            countryId = e.sId;
                                            providerNotifier
                                                .getAllStateNotifier(e.sId);
                                            providerNotifier.stateList.clear();
                                            providerNotifier.cityList.clear();
                                          });
                                        },
                                        value: e.countryName!.toString(),
                                        child: Text(
                                          e.countryName!,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0,right: 10),
                                  child: DropdownButton<dynamic>(
                                    isExpanded: true,
                                    hint: Text(selectState == null ? "Select State" : selectState,
                                        style:
                                        const TextStyle(color: Colors.black)),
                                    onChanged:
                                        (val) {
                                      setState(() {
                                        selectState = val!;
                                        selectCity = "Select City";
                                      });
                                    },
                                    items:
                                    providerNotifier.stateList.map((var s) {
                                      return DropdownMenuItem<String>(
                                        onTap:
                                            () {
                                          setState(() {
                                            stateId = s.sId;
                                            print(
                                                "print State Id${stateId}");
                                            providerNotifier
                                                .getAllCityNotifier(s.sId);
                                            providerNotifier.cityList.clear();
                                          });
                                        },
                                        value: s.stateName,
                                        child: Text(
                                          s.stateName!,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:10.0,right: 10.0),
                                  child: DropdownButton<dynamic>(
                                    isExpanded: true,
                                    hint: Text(selectCity== null ? "Select City " : selectCity,
                                        style: TextStyle(color: Colors.black)),
                                    onChanged: (val) {
                                      setState(() {
                                        selectCity = val!;
                                      });
                                    },
                                    items: providerNotifier.cityList.map((var c) {
                                      return DropdownMenuItem<String>(
                                        onTap: () {
                                          setState(() {
                                            cityId = c.sId;
                                          });
                                          print("city Id$cityId");
                                        },
                                        value: c.cityName,
                                        child: Text(
                                          c.cityName!,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                ProfileTextFormFieldConst(
                                  labelName: "Taluka",
                                  hintText: "Enter Your taluka name",
                                  controller: talukaController,
                                ),
                                ProfileTextFormFieldConst(
                                  labelName: "Village",
                                  hintText: "Enter Your village name",
                                  controller: villageController,
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

                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10, vertical: 8),
                                //   child: SelectFormField(
                                //     initialValue: 'Select your country',
                                //     type: SelectFormFieldType.dropdown,
                                //     decoration: InputDecoration(
                                //       border: UnderlineInputBorder(),
                                //       labelText: 'Country:',
                                //       hintText: 'Select your country',
                                //       suffixIcon: Align(
                                //         widthFactor: 1.0,
                                //         heightFactor: 1.0,
                                //         child: Icon(
                                //           Icons
                                //               .keyboard_arrow_down_sharp,
                                //           color:
                                //           ColorsConstData.appBaseColor,
                                //         ),
                                //       ),
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
                                //     items: _country,
                                //     onChanged: (val) => print(val),
                                //     onSaved: (val) => print(val),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10, vertical: 8),
                                //   child: SelectFormField(
                                //     initialValue: 'Select your state',
                                //     type: SelectFormFieldType.dropdown,
                                //     decoration: InputDecoration(
                                //       border: UnderlineInputBorder(),
                                //       labelText: 'State:',
                                //       hintText: 'Select your state',
                                //       suffixIcon: Align(
                                //         widthFactor: 1.0,
                                //         heightFactor: 1.0,
                                //         child: Icon(
                                //           Icons
                                //               .keyboard_arrow_down_sharp,
                                //           color:
                                //           ColorsConstData.appBaseColor,
                                //         ),
                                //       ),
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
                                //     items: _state,
                                //     onChanged: (val) => print(val),
                                //     onSaved: (val) => print(val),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10, vertical: 8),
                                //   child: SelectFormField(
                                //     initialValue: 'Select your district',
                                //     type: SelectFormFieldType.dropdown,
                                //     decoration: InputDecoration(
                                //       border: UnderlineInputBorder(),
                                //       labelText: 'District:',
                                //       hintText: 'Select your district',
                                //       suffixIcon: Align(
                                //         widthFactor: 1.0,
                                //         heightFactor: 1.0,
                                //         child: Icon(
                                //           Icons
                                //               .keyboard_arrow_down_sharp,
                                //           color:
                                //           ColorsConstData.appBaseColor,
                                //         ),
                                //       ),
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
                                //     items: _district,
                                //     onChanged: (val) => print(val),
                                //     onSaved: (val) => print(val),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10, vertical: 8),
                                //   child: SelectFormField(
                                //     initialValue: 'Select your city',
                                //     type: SelectFormFieldType.dropdown,
                                //     decoration: InputDecoration(
                                //       border: UnderlineInputBorder(),
                                //       labelText: 'City:',
                                //       hintText: 'Select your city',
                                //       suffixIcon: Align(
                                //         widthFactor: 1.0,
                                //         heightFactor: 1.0,
                                //         child: Icon(
                                //           Icons
                                //               .keyboard_arrow_down_sharp,
                                //           color:
                                //           ColorsConstData.appBaseColor,
                                //         ),
                                //       ),
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
                                //     items: _city,
                                //     onChanged: (val) => print(val),
                                //     onSaved: (val) => print(val),
                                //   ),
                                // ),

                                ///old code by susmita
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10, vertical: 8),
                                //   child: TextFormField(
                                //     decoration: InputDecoration(
                                //       border: UnderlineInputBorder(),
                                //       labelText: 'Address:',
                                //       hintText: 'Enter your address',
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
                                //       labelText: 'Village:',
                                //       hintText: 'Enter your village',
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
                                //       labelText: 'Taluka:',
                                //       hintText: 'Enter your taluka',
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
                                //       labelText: 'Adhaar Card:',
                                //       hintText: 'Enter your adhaar no.',
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
                                //       labelText: 'Business Address:',
                                //       hintText:
                                //       'Enter your business address',
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
