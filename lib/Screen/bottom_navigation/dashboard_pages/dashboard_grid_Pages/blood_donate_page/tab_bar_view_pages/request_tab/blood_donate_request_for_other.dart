import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';

import '../../../../../../../provider/providerNotifier.dart';

class BloodDonateRequestForOther extends StatefulWidget {
  const BloodDonateRequestForOther({Key? key}) : super(key: key);

  @override
  _BloodDonateRequestForOtherState createState() =>
      _BloodDonateRequestForOtherState();
}

class _BloodDonateRequestForOtherState
    extends State<BloodDonateRequestForOther> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtWeight = TextEditingController();
  TextEditingController txtAge = TextEditingController();
  TextEditingController txtRelation = TextEditingController();

  int groupselected = 4;

  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    Size size = MediaQuery.of(context).size;
    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: TextStyle(fontSize: 15),
          ),
        );
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarData(
          appBarTitle: "Request For Other",
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      ///this is old code by susmita
      //     PreferredSize(
      //         preferredSize: Size.fromHeight(60),
      //         child: ClipRRect(
      //         borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(40),
      //     bottomRight: Radius.circular(40)),
      // child: AppBar(
      // centerTitle: true,title: Text('Blood donate',
      //     style: TextStyle(
      //         fontSize: 20, fontWeight: FontWeight.bold)),
      //   elevation: 0,
      //   backgroundColor: ColorsConstData.appBaseColor,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back_ios,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      //         )),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 5),
        child: ElevatedButton(
          onPressed: () {
            if (txtname.text == "") {
              Fluttertoast.showToast(msg: "Enter Name");
            }else if (txtPhone.text == "") {
              Fluttertoast.showToast(msg: "Enter Phone Number");
            }else if (txtWeight.text == "") {
              Fluttertoast.showToast(msg: "Enter Weight");
            }else if (txtAge.text == "") {
              Fluttertoast.showToast(msg: "Enter Age");
            }else if (txtRelation.text == "") {
              Fluttertoast.showToast(msg: "Enter Relation");
            } else {
              providerNotifier
                  .addOtherRequestBloodListDataNotifier(
                  txtname.text,
                  txtPhone.text,
                  txtWeight.text,
                  txtAge.text,
                  txtRelation.text,groupselected.toString())
                  .whenComplete(() {
                Fluttertoast.showToast(
                    msg: providerNotifier
                        .addOtherRequestList!.message!);
                Navigator.pop(context);
              });
            }
          },
          child: Text(
            'Registration',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                ColorsConstData.appBaseColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 8.0,left: 13),
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:  BorderSide(
                            color: ColorsConstData.appBaseColor,
                          ),
                        ),
                        child: Container(
                          width: size.width * 0.9,
                          height: size.height * 0.06,
                          child: Padding(
                            padding: EdgeInsets.only(top: 18,left: 10),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: TextFormField(
                                controller: txtname,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Description',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: ColorsConstData.appBaseColor,
                          ),
                        ),
                        child: Container(
                          width: size.width * 0.9,
                          height: size.height * 0.06,
                          child: Padding(
                            padding: EdgeInsets.only(top: 18, left: 10),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: TextFormField(
                                controller: txtPhone,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Phone Number',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: ColorsConstData.appBaseColor,
                          ),
                        ),
                        child: Container(
                          width: size.width * 0.9,
                          // height: size.height*0.11,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 17, left: 10),
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Radio(
                                            value: 1,
                                            groupValue: groupselected,
                                            activeColor: ColorsConstData.appBaseColor,
                                            onChanged: (index) {
                                              setState(() {
                                                groupselected = index as int;
                                                print("selected Male value 1 : $groupselected");
                                              });
                                            }),
                                        Text('Male'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                            value: 2,
                                            groupValue: groupselected,
                                            activeColor: ColorsConstData.appBaseColor,
                                            onChanged: (index) {
                                              setState(() {
                                                groupselected = index as int;
                                                print("selected Female value 2 : $groupselected");
                                              });
                                            }),
                                        Text('Female'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                            value: 3,
                                            groupValue: groupselected,
                                            activeColor: ColorsConstData.appBaseColor,
                                            onChanged: (index) {
                                              setState(() {
                                                groupselected = index as int;
                                                print("selected Other value 3 : $groupselected");
                                              });
                                            }),
                                        Text('Other'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: ColorsConstData.appBaseColor,
                          ),
                        ),
                        child: Container(
                          width: size.width * 0.9,
                          height: size.height * 0.06,
                          child: Padding(
                            padding: EdgeInsets.only(top: 18, left: 10),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: TextFormField(
                                controller: txtWeight,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Weight',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: ColorsConstData.appBaseColor,
                          ),
                        ),
                        child: Container(
                          width: size.width * 0.9,
                          height: size.height * 0.06,
                          child: Padding(
                            padding: EdgeInsets.only(top: 18, left: 10),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: TextFormField(
                                controller: txtAge,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Age',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: ColorsConstData.appBaseColor,
                          ),
                        ),
                        child: Container(
                          width: size.width * 0.9,
                          height: size.height * 0.06,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18, left: 10),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: TextFormField(
                                controller: txtRelation,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Relation',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: ColorsConstData.appBaseColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),

    );
  }


}
