import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/all_text_data_const/profile_drop_down_const.dart';
import 'package:rotaract_app/Screen/all_text_data_const/profile_text_form_field_const.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/shared_pfrefs_data/shared_prefs_key.dart';

import '../../../provider/providerNotifier.dart';
import '../../../shared_pfrefs_data/shared_prefs_data.dart';

class AddressTabScreen extends StatefulWidget {
  const AddressTabScreen({Key? key}) : super(key: key);

  @override
  State<AddressTabScreen> createState() => _AddressTabScreenState();
}

class _AddressTabScreenState extends State<AddressTabScreen> {


  TextEditingController addressController = TextEditingController();
  TextEditingController talukaController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  var country;
  var stateId;
  var cityId;

  var selectCountry = "Select Country";
  var selectState = "Select State";
  var selectCity = "Select city";
  var countryId;

  Timer? timer;
  bool isLoading = false;
  bool isUpdate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
    Provider.of<ProviderNotifier>(context, listen: false);
    providerNotifier.getAllCountryNotifier();
    providerNotifier.getMemberProfileNotifier().whenComplete(() {
      addressController.text = providerNotifier.memberList.first!.address!;
      selectCountry = providerNotifier.memberList.first!.countries!.first.countryName!;
      talukaController.text = providerNotifier.memberList.first!.taluka!;
      villageController.text = providerNotifier.memberList.first!.village!;
      selectCountry = providerNotifier.memberList.first!.countries!.first.countryName.toString();
      selectState =  providerNotifier.memberList.first!.states!.first.stateName.toString();
      selectCity = providerNotifier.memberList.first!.cities!.first.cityName.toString();
    });
    timer = Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = true;
        timer!.cancel();
      });
    });
  }

  //
  // final List<Map<String, dynamic>> _district = [
  //   {
  //     'value': 'Select your district',
  //   },
  //   {
  //     'value': 'chandrapur',
  //     'label': 'Chandrapur',
  //   },
  //   {
  //     'value': 'alwar',
  //     'label': 'Alwar',
  //   },
  //   {
  //     'value': 'baran',
  //     'label': 'Baran',
  //   },
  //   {
  //     'value': 'jalgaon',
  //     'label': 'Jalgaon',
  //   },
  //   {
  //     'value': 'surat',
  //     'label': 'Surat',
  //   },
  // ];

  // final List<Map<String, dynamic>> _city = [
  //   {
  //     'value': 'Select your city',
  //   },
  //   {
  //     'value': 'pune',
  //     'label': 'Pune',
  //   },
  //   {
  //     'value': 'jaipur',
  //     'label': 'Jaipur',
  //   },
  //   {
  //     'value': 'surat',
  //     'label': 'Surat',
  //   },
  // ];

  // final List<Map<String, dynamic>> _state = [
  //   {
  //     'value': 'Select your state',
  //   },
  //   {
  //     'value': 'maharastra',
  //     'label': 'Maharastra',
  //   },
  //   {
  //     'value': 'rajasthan',
  //     'label': 'Rajasthan',
  //   },
  //   {
  //     'value': 'gujarat',
  //     'label': 'Gujarat',
  //   },
  // ];
  //
  // final List<Map<String, dynamic>> _country = [
  //   {
  //     'value': 'Select your country',
  //   },
  //   {
  //     'value': 'india',
  //     'label': 'India',
  //   },
  // ];
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
                    side: const BorderSide(
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
                          // ProfileDropDownConst(
                          //   intialValue: "Select your country",
                          //   labelName: country == null ?"Select your country" : country.toString(),
                          //   hintText: country == null ?"Select your country" : country.toString(),
                          //   itemsData: _country,
                          //   onChanged: (data) {
                          //     setState((){
                          //       country= data.toString();
                          //        print("change country name "+data.toString());
                          //     });
                          //   },
                          // ),
                          // ProfileDropDownConst(
                          //   intialValue: "Select your state",
                          //   labelName: "State",
                          //   hintText: "Select your state",
                          //   itemsData: _state,
                          //   onChanged: (data) {
                          //     setState((){
                          //       // print("change state name "+data.toString());
                          //     });
                          //   },
                          // ),
                          // ProfileDropDownConst(
                          //   intialValue: "Select your district",
                          //   labelName: "District",
                          //   hintText: "Select your district",
                          //   itemsData: _district,
                          //   onChanged: (data) {
                          //     setState((){
                          //       // print("change district name "+data.toString());
                          //     });
                          //   },
                          // ),
                          // ProfileDropDownConst(
                          //   intialValue: "Select your city",
                          //   labelName: "City",
                          //   hintText: "Select your city",
                          //   itemsData: _city,
                          //   onChanged: (data) {
                          //     setState((){
                          //       // print("change city name "+data.toString());
                          //     });
                          //   },
                          // ),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 90,vertical: 40),
                            child: isUpdate == true ? Center(child: CircularProgressIndicator(color: ColorsConstData.appBaseColor,),) : Container(
                              decoration: BoxDecoration(),
                              child: MaterialButton(
                                minWidth: size.width*0.50,
                                height: 40,
                                onPressed: () async {
                                  setState(() {
                                    isUpdate = true;
                                  });
                                  var memberId = await SharedPrefsData.getStringData(
                                      SharedPrefsKey.memberId);
                                  var bodyData = json.encode({
                                    "memberId": memberId,
                                    "village": villageController.text,
                                    "taluka": talukaController.text,
                                    "cityId": countryId,
                                    "stateId": stateId,
                                    "countryId": countryId,
                                    "address":addressController.text
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
