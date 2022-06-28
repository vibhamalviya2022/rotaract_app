import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/all_text_data_const/profile_drop_down_const.dart';
import 'package:rotaract_app/Screen/all_text_data_const/profile_text_form_field_const.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:select_form_field/select_form_field.dart';

import '../../../../../../provider/providerNotifier.dart';

class MemberPersonalTabScreen extends StatefulWidget {
  var index;
   MemberPersonalTabScreen({this.index});

  @override
  State<MemberPersonalTabScreen> createState() =>
      _MemberPersonalTabScreenState();
}

class _MemberPersonalTabScreenState extends State<MemberPersonalTabScreen> {
  int groupselected = 4;
  var bloodGroop;
  bool isLoading = true;
  Timer? timer;

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController anniversaryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController instaController = TextEditingController();
  TextEditingController fbController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    providerNotifier.getAllManageMemberListDataNotifier().whenComplete(() {
      nameController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.name!;
      mobileController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.phoneNumber!;
      dateController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.dob!;
      cardController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.adharCard!;
      addressController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.address!;
      anniversaryController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.anniversary!;
      sizeController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.tshirtSize!;
      instaController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.instagramId!;
      fbController.text = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.facebookId!;
      groupselected = int.parse(providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.gender!);
      bloodGroop = providerNotifier
          .allManageMemberList.data![widget.index].managemember!.first.bloodGroup!;
    });
    timer = Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        timer?.cancel();
      });

    });

  }

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Select your gender',
    },
    {
      'value': 'male',
      'label': 'Male',
      'icon': Icon(Icons.male_outlined),
    },
    {
      'value': 'female',
      'label': 'Female',
      'icon': Icon(Icons.female_outlined),
    },
  ];

  final List<Map<String, dynamic>> _bloodgroup = [
    {
      'value': 'Select your blood group',
    },
    {
      'value': 'a-',
      'label': 'A-',
    },
    {
      'value': 'a+',
      'label': 'A+',
    },
    {
      'value': 'b-',
      'label': 'B-',
    },
    {
      'value': 'b+',
      'label': 'B+',
    },
    {
      'value': 'ab-',
      'label': 'AB-',
    },
    {
      'value': 'ab+',
      'label': 'AB+',
    },
    {
      'value': 'o+',
      'label': 'O+',
    },
    {
      'value': 'o-',
      'label': 'O-',
    },
  ];

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
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/man.png'),
                    maxRadius: 50,
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    elevation: 4,
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
                            labelName: "Name",
                            hintText: "Enter Your name",
                            controller: nameController,
                          ),
                          ProfileTextFormFieldConst(
                            labelName: "Date",
                            hintText: "Enter date",
                            controller: dateController,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "   Gender : ",
                                style: TextStyle(
                                  color: ColorsConstData.appBaseColor,
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Radio(
                                          value: 1,
                                          groupValue: groupselected,
                                          activeColor:
                                              ColorsConstData.appBaseColor,
                                          onChanged: (index) {
                                            setState(() {
                                              groupselected = index as int;
                                            });
                                          }),
                                      Text('Male'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 2,
                                          groupValue: groupselected,
                                          activeColor:
                                              ColorsConstData.appBaseColor,
                                          onChanged: (index) {
                                            setState(() {
                                              groupselected = index as int;
                                            });
                                          }),
                                      Text('Female'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 3,
                                          groupValue: groupselected,
                                          activeColor:
                                              ColorsConstData.appBaseColor,
                                          onChanged: (index) {
                                            setState(() {
                                              groupselected = index as int;
                                            });
                                          }),
                                      Text('Other'),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          ProfileDropDownConst(
                            intialValue: bloodGroop == null
                                ? "Select your blood"
                                : bloodGroop,
                            labelName: "blood Group",
                            hintText: bloodGroop == null
                                ? "Select your blood"
                                : bloodGroop,
                            itemsData: _bloodgroup,
                            onChanged: (data) {
                              setState(() {
                                bloodGroop = data.toString().toUpperCase();
                                // print("change city name "+data.toString());
                              });
                            },
                          ),

                          ///old code by susmita mam
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 10, vertical: 8),
                          //   child: SelectFormField(
                          //     initialValue: 'Select your blood group',
                          //     type: SelectFormFieldType.dropdown,
                          //     decoration: InputDecoration(
                          //       border: UnderlineInputBorder(),
                          //       labelText: 'Blood Group:',
                          //       hintText: 'Select your blood group',
                          //       suffixIcon: Align(
                          //         widthFactor: 1.0,
                          //         heightFactor: 1.0,
                          //         child: Icon(
                          //           Icons.keyboard_arrow_down_sharp,
                          //           color: ColorsConstData.appBaseColor,
                          //         ),
                          //       ),
                          //       labelStyle: TextStyle(
                          //         color: ColorsConstData.appBaseColor,
                          //       ),
                          //       focusedBorder: UnderlineInputBorder(
                          //         borderSide: BorderSide(
                          //           color: ColorsConstData.appBaseColor,
                          //         ),
                          //       ),
                          //     ),
                          //     items: _bloodgroup,
                          //     onChanged: (val) => print(val),
                          //     onSaved: (val) => print(val),
                          //   ),
                          // ),
                          ProfileTextFormFieldConst(
                            labelName: "Anniversary",
                            hintText: "Enter Anniversary date",
                            controller: anniversaryController,
                          ),
                          ProfileTextFormFieldConst(
                            labelName: "Address",
                            hintText: "Enter Your address",
                            controller: addressController,
                          ),
                          ProfileTextFormFieldConst(
                            labelName: "Adhaar Card",
                            hintText: "Enter Your adhaar no.",
                            controller: cardController,
                          ),
                          ProfileTextFormFieldConst(
                            labelName: "T-shirt Size",
                            hintText: "Enter Your t-shirt size",
                            controller: sizeController,
                          ),
                          ProfileTextFormFieldConst(
                            labelName: "Instagram ID",
                            hintText: "Enter Your instagram id",
                            controller: instaController,
                          ),
                          ProfileTextFormFieldConst(
                            labelName: "Facebook ID",
                            hintText: "Enter Your facebook id",
                            controller: fbController,
                          ),
                          ProfileTextFormFieldConst(
                            labelName: "Phone No.",
                            hintText: "Enter Your mobile no.",
                            controller: mobileController,
                          ),
                          SizedBox(
                            height: 10,
                          )
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 90, vertical: 30),
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

                          /// this is old code made by susmita
                          //                  Padding(
                          //                    padding: const EdgeInsets.symmetric(
                          //                        horizontal: 10, vertical: 8),
                          //                    child: TextFormField(
                          //                      controller: controller,
                          //                      decoration: InputDecoration(
                          //                        floatingLabelBehavior: FloatingLabelBehavior.always,
                          //                        border: UnderlineInputBorder(),
                          //                        labelText: 'Name:',
                          //                        hintText: 'Enter your name',
                          //                        labelStyle: TextStyle(
                          //                          color: ColorsConstData.appBaseColor,
                          //                        ),
                          //                        focusedBorder: UnderlineInputBorder(
                          //                          borderSide: BorderSide(
                          //                            color: ColorsConstData.appBaseColor,
                          //                          ),
                          //                        ),
                          //                      ),
                          //                    ),
                          //                  ),
                          //                  Padding(
                          //                    padding: const EdgeInsets.symmetric(
                          //                        horizontal: 10, vertical: 8),
                          //                    child: TextFormField(
                          //                      decoration: InputDecoration(
                          //                        border: UnderlineInputBorder(),
                          //                        labelText: 'Date:',
                          //                        hintText: 'Enter date',
                          //                        labelStyle: TextStyle(
                          //                          color: ColorsConstData.appBaseColor,
                          //                        ),
                          //                        focusedBorder: UnderlineInputBorder(
                          //                          borderSide: BorderSide(
                          //                            color: ColorsConstData.appBaseColor,
                          //                          ),
                          //                        ),
                          //                      ),
                          //                    ),
                          //                  ),
                          //                  Padding(
                          //                    padding: const EdgeInsets.symmetric(
                          //                        horizontal: 10, vertical: 8),
                          //                    child: SelectFormField(
                          //                      initialValue: 'Select your gender',
                          //                      type: SelectFormFieldType.dropdown,
                          //                      decoration: InputDecoration(
                          //                        border: UnderlineInputBorder(),
                          //                        labelText: 'Gender:',
                          //                        hintText: 'Select your gender',
                          //                        suffixIcon: Align(
                          //                          widthFactor: 1.0,
                          //                          heightFactor: 1.0,
                          //                          child: Icon(
                          //                            Icons.keyboard_arrow_down_sharp,
                          //                            color: ColorsConstData.appBaseColor,
                          //                          ),
                          //                        ),
                          //                        labelStyle: TextStyle(
                          //                          color: ColorsConstData.appBaseColor,
                          //                        ),
                          //                        focusedBorder: UnderlineInputBorder(
                          //                          borderSide: BorderSide(
                          //                              color:
                          //                              ColorsConstData.appBaseColor),
                          //                        ),
                          //                      ),
                          //                      items: _items,
                          //                      onChanged: (val) => print(val),
                          //                      onSaved: (val) => print(val),
                          //                    ),
                          //                  ),
                          //                  Padding(
                          //                    padding: const EdgeInsets.symmetric(
                          //                        horizontal: 10, vertical: 8),
                          //                    child: TextFormField(
                          //                      decoration: InputDecoration(
                          //                        border: UnderlineInputBorder(),
                          //                        labelText: 'Anniversary:',
                          //                        hintText: 'Enter anniversary date',
                          //                        labelStyle: TextStyle(
                          //                          color: ColorsConstData.appBaseColor,
                          //                        ),
                          //                        focusedBorder: UnderlineInputBorder(
                          //                          borderSide: BorderSide(
                          //                            color: ColorsConstData.appBaseColor,
                          //                          ),
                          //                        ),
                          //                      ),
                          //                    ),
                          //                  ),
                          //                  Padding(
                          //                    padding: const EdgeInsets.symmetric(
                          //                        horizontal: 10, vertical: 8),
                          //                    child: TextFormField(
                          //                      decoration: InputDecoration(
                          //                        border: UnderlineInputBorder(),
                          //                        labelText: 'Address:',
                          //                        hintText: 'Enter your address',
                          //                        labelStyle: TextStyle(
                          //                          color: ColorsConstData.appBaseColor,
                          //                        ),
                          //                        focusedBorder: UnderlineInputBorder(
                          //                          borderSide: BorderSide(
                          //                            color: ColorsConstData.appBaseColor,
                          //                          ),
                          //                        ),
                          //                      ),
                          //                    ),
                          //                  ),
                          //                  Padding(
                          //                    padding: const EdgeInsets.symmetric(
                          //                        horizontal: 10, vertical: 8),
                          //                    child: TextFormField(
                          //                      decoration: InputDecoration(
                          //                        border: UnderlineInputBorder(),
                          //                        labelText: 'Adhaar Card:',
                          //                        hintText: 'Enter your adhaar no.',
                          //                        labelStyle: TextStyle(
                          //                          color: ColorsConstData.appBaseColor,
                          //                        ),
                          //                        focusedBorder: UnderlineInputBorder(
                          //                          borderSide: BorderSide(
                          //                            color: ColorsConstData.appBaseColor,
                          //                          ),
                          //                        ),
                          //                      ),
                          //                    ),
                          //                  ),
                          //                  Padding(
                          //                    padding: const EdgeInsets.symmetric(
                          //                        horizontal: 10, vertical: 8),
                          //                    child: TextFormField(
                          //                      decoration: InputDecoration(
                          //                        border: UnderlineInputBorder(),
                          //                        labelText: 'T-Shirt Size:',
                          //                        hintText: 'Enter your t-shirt size',
                          //                        labelStyle: TextStyle(
                          //                          color: ColorsConstData.appBaseColor,
                          //                        ),
                          //                        focusedBorder: UnderlineInputBorder(
                          //                          borderSide: BorderSide(
                          //                            color: ColorsConstData.appBaseColor,
                          //                          ),
                          //                        ),
                          //                      ),
                          //                    ),
                          //                  ),
                          //                  Padding(
                          //                    padding: const EdgeInsets.symmetric(
                          //                        horizontal: 10, vertical: 8),
                          //                    child: TextFormField(
                          //                      decoration: InputDecoration(
                          //                        border: UnderlineInputBorder(),
                          //                        labelText: 'Instagram ID:',
                          //                        hintText: 'Enter your ID',
                          //                        labelStyle: TextStyle(
                          //                          color: ColorsConstData.appBaseColor,
                          //                        ),
                          //                        focusedBorder: UnderlineInputBorder(
                          //                          borderSide: BorderSide(
                          //                            color: ColorsConstData.appBaseColor,
                          //                          ),
                          //                        ),
                          //                      ),
                          //                    ),
                          //                  ),
                          //                  Padding(
                          //                    padding: const EdgeInsets.symmetric(
                          //                        horizontal: 10, vertical: 8),
                          //                    child: TextFormField(
                          //                      decoration: InputDecoration(
                          //                        border: UnderlineInputBorder(),
                          //                        labelText: 'Facebook ID:',
                          //                        hintText: 'Enter your ID',
                          //                        labelStyle: TextStyle(
                          //                          color: ColorsConstData.appBaseColor,
                          //                        ),
                          //                        focusedBorder: UnderlineInputBorder(
                          //                          borderSide: BorderSide(
                          //                            color: ColorsConstData.appBaseColor,
                          //                          ),
                          //                        ),
                          //                      ),
                          //                    ),
                          //                  ),
                          //                  Padding(
                          //                    padding: const EdgeInsets.symmetric(
                          //                        horizontal: 10, vertical: 8),
                          //                    child: TextFormField(
                          //                      decoration: InputDecoration(
                          //                        border: UnderlineInputBorder(),
                          //                        labelText: 'Phone No.:',
                          //                        hintText: 'Enter your mobile no.',
                          //                        labelStyle: TextStyle(
                          //                          color: ColorsConstData.appBaseColor,
                          //                        ),
                          //                        focusedBorder: UnderlineInputBorder(
                          //                          borderSide: BorderSide(
                          //                            color: ColorsConstData.appBaseColor,
                          //                          ),
                          //                        ),
                          //                      ),
                          //                    ),
                          //                  ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
