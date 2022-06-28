import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';

import '../../../../../../../provider/providerNotifier.dart';

class DonorRegistrationScreen extends StatefulWidget {
  const DonorRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<DonorRegistrationScreen> createState() =>
      _DonorRegistrationScreenState();
}

class _DonorRegistrationScreenState extends State<DonorRegistrationScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhoneNumber = TextEditingController();
  TextEditingController txtWeight = TextEditingController();
  TextEditingController txtAge = TextEditingController();

  List<String> items = ['O-', 'O+', 'A-', 'A+', 'B-', 'B+', 'AB-', 'AB+'];
  String? value;
  String? selectedValue;
  int groupvalue = 4;
  var dropdownname;


  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarData(
          appBarTitle: "Donor Registration",
          onTap: () {
            providerNotifier.getAllBloodDonarListDataNotifier();
            Navigator.of(context).pop();
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(top: 30,right: 10,left: 10,bottom: 5),
        child: ElevatedButton(
          onPressed: () {
            if (txtName.text == "") {
              Fluttertoast.showToast(msg: "Enter Name");
            } else if (txtPhoneNumber.text == "") {
              Fluttertoast.showToast(msg: "Enter Mobile Number");
            } else if (txtWeight.text == "") {
              Fluttertoast.showToast(msg: "Enter Weight");
            } else if (txtAge.text == "") {
              Fluttertoast.showToast(msg: "Enter Age");
            } else {
              providerNotifier
                  .addBloodDonarListDataNotifier(
                  txtName.text,
                  txtPhoneNumber.text,
                  txtWeight.text,
                  txtAge.text,
                  groupvalue.toString(),
                  dropdownname.toString())
                  .whenComplete(() {
                Fluttertoast.showToast(
                    msg: providerNotifier.addBloodDonar!.message!);
                providerNotifier.getAllBloodDonarListDataNotifier();
                Navigator.pop(context);
              });
            }
          },
          child: Padding(
            padding:  EdgeInsets.only(left: 90.0,right: 90),
            child:  Text(
              'Registration',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
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
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: txtName,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Your Name',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
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
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.number,
                        controller: txtPhoneNumber,
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
              padding: const EdgeInsets.only(top: 10,left: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: ColorsConstData.appBaseColor,
                  ),
                ),
                child: Container(
                  width: size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(top: 17, left: 10),
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
                            radioButttonData(0, 'Male'),
                            radioButttonData(1, 'Female'),
                            radioButttonData(2, 'Others'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
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
                      padding: const EdgeInsets.only(bottom: 8),
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
              padding: const EdgeInsets.only(top: 10,left: 10),
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
                      padding: const EdgeInsets.only(bottom: 8),
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
            Material(
              borderRadius: BorderRadius.circular(10),
              shadowColor: ColorsConstData.appBaseColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Container(
                  height: size.height * 0.08,
                  width: size.width * 0.9,
                  padding: EdgeInsets.only(left: 10, right: 40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Color(0xffE5097F))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<dynamic>(
                      value: value,
                      hint: Padding(
                        padding:  EdgeInsets.only(bottom: 2),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Blood Group',
                          ),
                        ),
                      ),
                      iconSize: 40,
                      icon: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: ColorsConstData.appBaseColor,
                      ),
                      isDense: true,
                      isExpanded: true,
                      items: items.map((e) {
                        return DropdownMenuItem(
                            onTap: () {
                              dropdownname = e.toString();
                              print("blood Gruop name$dropdownname");
                            },
                            value: e.toString(),
                            child: Text(e));
                      }).toList(),
                      onChanged: (value) => setState(
                            () => this.value = value,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  radioButttonData(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: ColorsConstData.appBaseColor,
          value: btnValue,
          groupValue: groupvalue,
          onChanged: (Value) {
            setState(() {
              groupvalue = btnValue;
            });
          },
        ),
        Text(title)
      ],
    );
  }
}
