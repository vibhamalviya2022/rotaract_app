import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../provider/providerNotifier.dart';
import '../../app_bar/app_bar_data.dart';

class AddJob extends StatefulWidget {
  const AddJob({Key? key}) : super(key: key);

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  TextEditingController txtjobTitle = TextEditingController();
  TextEditingController txtNoOfPosition = TextEditingController();
  TextEditingController txtJobDiscription = TextEditingController();
  TextEditingController txtjobType = TextEditingController();
  TextEditingController txtSalary = TextEditingController();
  TextEditingController txtRemark = TextEditingController();

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
          appBarTitle: "Add Job",
          onTap: () {
            // providerNotifier.getAllBloodDonarListDataNotifier();
            Navigator.of(context).pop();
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 5),
        child: ElevatedButton(
          onPressed: () {
            if (txtjobTitle.text == "") {
              Fluttertoast.showToast(msg: "Enter Job Title");
            } else if (txtNoOfPosition.text == "") {
              Fluttertoast.showToast(msg: "Enter No Of Position");
            } else if (txtJobDiscription.text == "") {
              Fluttertoast.showToast(msg: "Enter Description");
            } else if (txtjobType.text == "") {
              Fluttertoast.showToast(msg: "Enter Job Type");
            } else if (txtSalary.text == "") {
              Fluttertoast.showToast(msg: "Enter Salary");
            } else if (txtRemark.text == "") {
              Fluttertoast.showToast(msg: "Enter Remark");
            } else {
              providerNotifier
                  .addJobNotifier(
                      txtjobTitle.text,
                      txtNoOfPosition.text,
                      txtJobDiscription.text,
                      txtjobType.text,
                      txtSalary.text,
                      txtRemark.text)
                  .whenComplete(() {
                Fluttertoast.showToast(
                    msg: providerNotifier.addJobDataList!.message!);
                // providerNotifier.getAllBloodDonarListDataNotifier();
                Navigator.pop(context);
              });
            }
          },
          child:  Padding(
            padding: EdgeInsets.only(left: 90.0, right: 90),
            child: Text(
              'Add Job',
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
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorsConstData.appBaseColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 13),
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
                        controller: txtjobTitle,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Job Title',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
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
                          LengthLimitingTextInputFormatter(100),
                        ],
                        keyboardType: TextInputType.number,
                        controller: txtNoOfPosition,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'No Of Positions',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
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
                        controller: txtJobDiscription,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Discription',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
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
                        controller: txtjobType,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Job Type',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
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
                        controller: txtSalary,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Salary',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
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
                        controller: txtRemark,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Remark',
                        ),
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
}
