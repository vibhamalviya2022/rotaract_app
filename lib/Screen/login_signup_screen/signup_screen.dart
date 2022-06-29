import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/constant/constant.dart';
import '../../provider/providerNotifier.dart';
import 'package:image_picker/image_picker.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // final items = ['Surat', 'Vapi', 'Valsad', 'Daman'];
  // String? value;
  // bool _obscureText = true;
  TextEditingController txtname = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtmobileNo = TextEditingController();

  var selectCountry = "Select Country";
  var selectState = "Select State";
  var selectCity = "Select city";
  var countryId;
  var stateId;
  var cityId;

  late File _imageOffer;
  late String _password;
  bool signUp = false;
  bool isStateSelected = false;
  bool isCitySelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    providerNotifier.getAllCountryNotifier();
  }

  // Toggles the password show status
  // void _toggle() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);

    ///this is old code by susmita
    // DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    //       value: item,
    //       child: Text(
    //         item,
    //         style: const TextStyle(fontSize: 15),
    //       ),
    //     );
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 50),

            ///this is old code
            // height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Sign up to your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: txtname,
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(
                              Icons.person,
                              color: ColorsConstData.appBaseColor,
                            ),
                            hintText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      TextFormField(
                        controller: txtEmail,
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(
                              Icons.email,
                              color: ColorsConstData.appBaseColor,
                            ),
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: ColorsConstData.appBaseColor))),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      TextFormField(
                        controller: txtmobileNo,
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: ColorsConstData.appBaseColor,
                            ),
                            hintText: 'Mobile',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: ColorsConstData.appBaseColor))),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 2, top: 2),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<dynamic>(
                                  hint: Text(selectCountry,
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
                                        setState(()  {
                                          countryId = e.sId;
                                          print("print CountryId${countryId}");
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
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 2, top: 2),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<dynamic>(
                                  hint: Text(selectState,
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
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 2, top: 2),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<dynamic>(
                                  hint: Text(selectCity,
                                      style:
                                          const TextStyle(color: Colors.black)),
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
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ],
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 30),
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: signUp == true ? Center(
                    child: CircularProgressIndicator(
                      color: ColorsConstData.appBaseColor,
                    ),
                  )
                        :  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    color: ColorsConstData.appBaseColor,
                    onPressed: () {

                      if (txtname.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Enter name")));
                      } else if (txtmobileNo.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Enter Mobile Number")));
                      } else if (txtEmail.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Enter Email")));
                      } else if (selectCountry == "Select Country") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Select Country")));
                      } else if (selectState == "Select State") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Select State")));
                      } else if (selectCity == "Select city") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Select State")));
                      } else {
                        setState(() {
                          signUp = true;
                        });
                        providerNotifier.getSignUpNotifier(
                            txtname.text,
                            txtEmail.text,
                            txtmobileNo.text,
                            countryId,
                            stateId.toString(),
                            cityId.toString(),).whenComplete(() {
                          Fluttertoast.showToast(msg: providerNotifier.signUp!.message!);
                          setState(() {
                            signUp = false;
                          });
                          Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage(),));
                        });
                      }
                    },
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: Text(
                        " Login",
                        style: TextStyle(
                            color: ColorsConstData.appBaseColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    )
                  ],
                )

                ///this is old code by susmita
                /*Material(
                        borderRadius: BorderRadius.circular(50),
                        elevation: 5,
                        shadowColor: Colors.grey.withOpacity(0.8),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: ColorsConstData.appBaseColor,
                              ),
                              hintText: 'Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(50),
                        elevation: 5,
                        shadowColor: Colors.grey.withOpacity(0.8),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: ColorsConstData.appBaseColor,
                              ),
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                      color: ColorsConstData.appBaseColor))),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),*/
                /* Material(
                        borderRadius: BorderRadius.circular(50),
                        elevation: 5,
                        shadowColor: Colors.grey.withOpacity(0.8),
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(color: Colors.grey)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: value,
                                  hint: const Text('Select city'),
                                  iconSize: 40,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: ColorsConstData.appBaseColor,
                                  ),
                                  isExpanded: true,
                                  items: items.map(buildMenuItem).toList(),
                                  onChanged: (value) => setState(
                                        () => this.value = value,
                                      )),
                            )),
                      ),
                      const SizedBox(
                        height: 12,
                      ),*/

                ///this is old code by susmita
                // Material(
                //   borderRadius: BorderRadius.circular(50),
                //   elevation: 5,
                //   shadowColor: Colors.grey.withOpacity(0.8),
                //   child: TextField(
                //     decoration: InputDecoration(
                //         prefixIcon: Icon(
                //           Icons.phone_android,
                //           color: ColorsConstData.appBaseColor,
                //         ),
                //         hintText: 'Mobile',
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(50),
                //             borderSide: BorderSide(
                //                 color: ColorsConstData.appBaseColor))),
                //   ),
                // ),
                // const SizedBox(
                //   height: 12,
                // ),

                // Material(
                //   borderRadius: BorderRadius.circular(50),
                //   elevation: 5,
                //   shadowColor: Colors.grey.withOpacity(0.8),
                //   child: TextField(
                //     decoration: InputDecoration(
                //         prefixIcon: Icon(
                //           Icons.lock,
                //           color: ColorsConstData.appBaseColor,
                //         ),
                //         hintText: 'Password',
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(50),
                //             borderSide: BorderSide(
                //                 color: ColorsConstData.appBaseColor))),
                //     obscureText: _obscureText,
                //   ),
                // ),
                // const SizedBox(
                //   height: 12,
                // ),
                // Material(
                //   borderRadius: BorderRadius.circular(50),
                //   elevation: 5,
                //   shadowColor: Colors.grey.withOpacity(0.8),
                //   child: TextField(
                //     decoration: InputDecoration(
                //         prefixIcon: Icon(
                //           Icons.lock,
                //           color: ColorsConstData.appBaseColor,
                //         ),
                //         hintText: 'Confirm Password',
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(50),
                //             borderSide: BorderSide(
                //                 color: ColorsConstData.appBaseColor))),
                //     obscureText: _obscureText,
                //   ),
                // ),
                // const SizedBox(
                //   height: 12,
                // ),

                ///this is old code
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(50),
                //     ),
                //     child: MaterialButton(
                //       minWidth: double.infinity,
                //       onPressed: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const LoginPage()));
                //       },
                //       height: 60,
                //       color: ColorsConstData.appBaseColor,
                //       shape: RoundedRectangleBorder(
                //           side: const BorderSide(color: Colors.white),
                //           borderRadius: BorderRadius.circular(50)),
                //       child: const Text(
                //         "Sign up",
                //         style: TextStyle(
                //           fontWeight: FontWeight.w600,
                //           fontSize: 20,
                //           color: Colors.white,
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
