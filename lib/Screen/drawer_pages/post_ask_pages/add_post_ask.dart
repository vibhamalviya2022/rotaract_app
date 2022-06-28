import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/all_text_data_const/all_text_data_const.dart';
import 'package:rotaract_app/constant/constant.dart';

import '../../../provider/providerNotifier.dart';
import '../../all_text_data_const/border_text_field_const.dart';
import '../../app_bar/app_bar_data.dart';

class AddPostAsk extends StatefulWidget {
  const AddPostAsk({Key? key}) : super(key: key);

  @override
  State<AddPostAsk> createState() => _AddPostAskState();
}

class _AddPostAskState extends State<AddPostAsk> {
  TextEditingController txtdateinput = TextEditingController();
  TextEditingController txtnameController = TextEditingController();
  TextEditingController txtaskDateController = TextEditingController();
  TextEditingController txtcloseDateController = TextEditingController();
  TextEditingController txtdescriptionController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarData(
          appBarTitle: "Add Post Ask",
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: MaterialButton(
            minWidth: size.width * 0.5,
            onPressed: () {
              if(txtnameController.text == ""){
                Fluttertoast.showToast(msg: "Enter Title Name");
              }else if(txtaskDateController.text == ""){
                Fluttertoast.showToast(msg: "Enter Ask Date");
              } else if(txtcloseDateController.text == ""){
                Fluttertoast.showToast(msg: "Enter Close Date");
              } else if(txtdescriptionController.text == ""){
                Fluttertoast.showToast(msg:"Enter Discription");
              }else{
                providerNotifier.AddPostAskDataNotifier(
                    txtnameController.text,
                    txtaskDateController.text,
                    txtcloseDateController.text,
                    txtdescriptionController.text).whenComplete((){
                      providerNotifier.getPostAskDataNotifier();
                      Fluttertoast.showToast(msg: providerNotifier.AddPostAskListData!.message!);
                });
              }
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const LoginPage()));
            },
            height: size.height * 0.05,
            color: ColorsConstData.appBaseColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(50)),
            child: Text(
              "Post Ask",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),

      // PreferredSize(
      //   preferredSize: Size.fromHeight(60),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(40),
      //         bottomRight: Radius.circular(40)),
      //     child: AppBar(
      //       centerTitle: true,
      //       title: Text(
      //         "Post Ask",
      //         style: TextStyle(color: Colors.white),
      //       ),
      //       elevation: 0,
      //       backgroundColor: ColorsConstData.appBaseColor,
      //       leading: IconButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         icon: const Icon(
      //           Icons.arrow_back_ios,
      //           size: 30,
      //           color: Colors.white,
      //         ),
      //       ),
      //       systemOverlayStyle: SystemUiOverlayStyle.dark,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: AllTextDataConst(
                textData: "Title",
                fontSize: 15,
                mainAxisAlignment: MainAxisAlignment.start,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: 10.0),
              child: BorderTextFieldConst(
                hintText: "Enter Name",
                controller: txtnameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AllTextDataConst(
                textData: "Ask Date",
                fontSize: 15,
                mainAxisAlignment: MainAxisAlignment.start,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: BorderTextFieldConst(
                hintText: "Ask Date",
                controller: txtaskDateController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AllTextDataConst(
                textData: "Close Date",
                fontSize: 15,
                mainAxisAlignment: MainAxisAlignment.start,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: BorderTextFieldConst(
                hintText: "Close Date",
                controller: txtcloseDateController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AllTextDataConst(
                textData: "Ask Description",
                fontSize: 15,
                mainAxisAlignment: MainAxisAlignment.start,
                fontWeight: FontWeight.bold,
              ),
            ),
            BorderTextFieldConst(
              hintText: "Enter Description",
              controller: txtdescriptionController,
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
