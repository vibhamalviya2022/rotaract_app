import 'package:flutter/material.dart';
import 'package:rotaract_app/Screen/all_text_data_const/border_text_field_const.dart';
import 'package:rotaract_app/constant/constant.dart';

class HuntingTabScreen extends StatefulWidget {
  const HuntingTabScreen({Key? key}) : super(key: key);

  @override
  State<HuntingTabScreen> createState() => _HuntingTabScreenState();
}

class _HuntingTabScreenState extends State<HuntingTabScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController experianceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BorderTextFieldConst(
                  hintText: "Full name",
                  controller: nameController,
                ),
                BorderTextFieldConst(
                  hintText: "Phone number",
                  controller: mobileController,
                ),
                BorderTextFieldConst(
                  hintText: "Qualification",
                  controller: qualificationController,
                ),
                BorderTextFieldConst(
                  hintText: "Experiance",
                  controller: experianceController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        shape:
                        MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(
                            ColorsConstData.appBaseColor),
                      ),
                    ),
                  ),
                ),



///old code by susmita
                // Padding(
                //   padding: const EdgeInsets.only(top: 10),
                //   child: Card(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       side: BorderSide(
                //         color: ColorsConstData.appBaseColor,
                //       ),
                //     ),
                //     child: Container(
                //       width: size.width*0.9,
                //       height: 54,
                //       child: Padding(
                //         padding:
                //         const EdgeInsets.only(top: 18, left: 30),
                //         child: Padding(
                //           padding: const EdgeInsets.only(bottom: 8),
                //           child: TextField(
                //             decoration: InputDecoration(
                //               border: InputBorder.none,
                //               hintText: 'Full name',
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10),
                //   child: Card(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       side: BorderSide(
                //         color: ColorsConstData.appBaseColor,
                //       ),
                //     ),
                //     child: Container(
                //       width: size.width*0.9,
                //       height: 54,
                //       child: Padding(
                //         padding:
                //         const EdgeInsets.only(top: 18, left: 30),
                //         child: Padding(
                //           padding: const EdgeInsets.only(bottom: 8),
                //           child: TextField(
                //             decoration: InputDecoration(
                //               border: InputBorder.none,
                //               hintText: 'Phone number',
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10),
                //   child: Card(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       side: BorderSide(
                //         color: ColorsConstData.appBaseColor,
                //       ),
                //     ),
                //     child: Container(
                //       width: size.width*0.9,
                //       height: 54,
                //       child: Padding(
                //         padding:
                //         const EdgeInsets.only(top: 18, left: 30),
                //         child: Padding(
                //           padding: const EdgeInsets.only(bottom: 8),
                //           child: TextField(
                //             decoration: InputDecoration(
                //               border: InputBorder.none,
                //               hintText: 'Qualification',
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10),
                //   child: Card(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       side: BorderSide(
                //         color: ColorsConstData.appBaseColor,
                //       ),
                //     ),
                //     child: Container(
                //       width: size.width*0.9,
                //       height: 54,
                //       child: Padding(
                //         padding:
                //         const EdgeInsets.only(top: 18, left: 30),
                //         child: Padding(
                //           padding: const EdgeInsets.only(bottom: 8),
                //           child: TextField(
                //             decoration: InputDecoration(
                //               border: InputBorder.none,
                //               hintText: 'Experiences',
                //             ),
                //           ),
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
    );
  }
}
