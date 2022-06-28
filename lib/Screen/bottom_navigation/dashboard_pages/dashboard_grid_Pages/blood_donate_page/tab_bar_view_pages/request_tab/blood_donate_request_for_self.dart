import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/constant/constant.dart';

import '../../../../../../../provider/providerNotifier.dart';
import '../../../../../../app_bar/app_bar_data.dart';

class BloodDonateRequestForSelf extends StatefulWidget {
  const BloodDonateRequestForSelf({Key? key}) : super(key: key);

  @override
  State<BloodDonateRequestForSelf> createState() =>
      _BloodDonateRequestForSelfState();
}

class _BloodDonateRequestForSelfState extends State<BloodDonateRequestForSelf> {
  List<String> items = ['O-', 'O+', 'A-', 'A+', 'B-', 'B+', 'AB-', 'AB+'];
  String? value = "Select Blood Gruop";
  var dropdownname;

  TextEditingController txtDescriptation = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarData(
          appBarTitle: "Request For Self",
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 5),
        child: SizedBox(
          width: size.width * 0.5,
          child: ElevatedButton(
            onPressed: () {
              if (txtDescriptation.text == "") {
                Fluttertoast.showToast(msg: "Enter Description");
              } else if (value == "Select Blood Gruop") {
                Fluttertoast.showToast(msg: "Select Blood Gruop");
              } else {
                providerNotifier
                    .addSelfRequestBloodListDataNotifier(
                    txtDescriptation.text,
                    dropdownname.toString())
                    .whenComplete(() {
                  Fluttertoast.showToast(
                      msg: providerNotifier
                          .addSelfRequestList!.message!);
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 8.0,left: 10),
          child: Column(
            children: [
              Material(
                borderRadius: BorderRadius.circular(10),
                shadowColor: ColorsConstData.appBaseColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.9,
                    padding: EdgeInsets.only(left: 30, right: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Color(0xffE5097F))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<dynamic>(
                        //value: value,
                        hint: Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: value,
                                hintStyle: TextStyle(color: Colors.black)),
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
                    height: size.height * 0.16,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 18, left: 30, right: 30, bottom: 18),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextFormField(
                          controller: txtDescriptation,
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

              // Padding(
              //   padding: const EdgeInsets.only(top: 30),
              //   child: SizedBox(
              //     width: size.width*0.5,
              //     child: ElevatedButton(
              //       onPressed: () {
              //         // Navigator.push(
              //         //     context,
              //         //     MaterialPageRoute(
              //         //         builder: (context) =>
              //         //             OtherRequestScreen()));
              //       },
              //       child: Text(
              //         'Other',
              //         style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       style: ButtonStyle(
              //         shape: MaterialStateProperty.all<
              //             OutlinedBorder>(
              //           RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(20),
              //           ),
              //         ),
              //         backgroundColor:
              //         MaterialStateProperty.all<Color>(
              //             ColorsConstData.appBaseColor),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
