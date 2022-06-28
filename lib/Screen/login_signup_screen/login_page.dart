// ignore_for_file: deprecated_member_use


import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/login_signup_screen/signup_screen.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/provider/providerNotifier.dart';

import '../../home_page.dart';
import '../../shared_pfrefs_data/shared_prefs_data.dart';
import '../../shared_pfrefs_data/shared_prefs_key.dart';
import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtmobilenumber = TextEditingController();
  var countrycode = "+91";

/*  bool _obscureText = true;
  late String _password;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context, listen: false);
  }



  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset("assets/images/ROTARACT LOGO.png",
                  width: MediaQuery.of(context).size.width * 0.70),
            ),
            Container(
              padding: const EdgeInsets.only(right: 25, left: 25, top: 100),
              child: Column(
                children: [
                  TextFormField(
                    controller: txtmobilenumber,
                    // scrollPadding: EdgeInsets.all(0),
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CountryCodePicker(
                            onChanged: (val) {
                              setState(() {
                                countrycode = val.dialCode.toString();
                              });
                            },
                            favorite: const ['+91', 'IN'],
                            initialSelection: 'IN',
                          ),
                        ),
                        hintText: "Mobile No"),
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                color: ColorsConstData.appBaseColor,
                onPressed: () {
                    providerNotifier.getLoginNotifier(txtmobilenumber.text).whenComplete(() async {
                       SharedPrefsData.setStringData(SharedPrefsKey.memberId,providerNotifier.logindata.first!.sId!);
                       SharedPrefsData.setStringData(SharedPrefsKey.memberName,providerNotifier.logindata.first!.name!);
                       SharedPrefsData.setStringData(SharedPrefsKey.memberEmail,providerNotifier.logindata.first!.email!);
                       SharedPrefsData.setStringData(SharedPrefsKey.memberPhoneNo,providerNotifier.logindata.first!.phoneNumber!);
                       Navigator.push(context, MaterialPageRoute(builder:(context) => OTPPage(mobileNumber: txtmobilenumber.text,countryCode: countrycode),));
                    });
                },
                child: const Text(
                  "Login",
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
                const Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: const Text(
                    " Sign up",
                    style: TextStyle(
                      color: Color(0xffE5097F),
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),

            // Text(
            //   "Login",
            //   style: TextStyle(
            //       color: cnst.appPrimaryMaterialColor,
            //       fontSize: 30,
            //       fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Text(
            //   "Login to your account",
            //   style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            // ),
            // const SizedBox(
            //   height: 30,
            // ),

            ///this is old code
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
            //           color: cnst.appPrimaryMaterialColor,
            //         ),
            //         hintText: 'Password',
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(50),
            //             borderSide: BorderSide(
            //                 color: cnst.appPrimaryMaterialColor))),
            //     // validator: (val) =>
            //     //     val!.length < 6 ? 'Password too short.' : null,
            //     // onSaved: (val) => _password = val!,
            //     obscureText: _obscureText,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 90,
            //     top: 10,
            //   ),
            //   child: RichText(
            //     text: TextSpan(
            //       text: 'Forget password?',
            //       style: const TextStyle(
            //         color: Colors.grey,
            //       ),
            //       recognizer: TapGestureRecognizer()
            //         ..onTap = () => {
            //           // Navigator.push(
            //           //   context,
            //           //   MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
            //           // ),
            //         },
            //     ),
            //   ),
            // )

            // const SizedBox(
            //   height: 50,
            // ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Container(
            //     decoration: const BoxDecoration(),
            //     child: MaterialButton(
            //       minWidth: double.infinity,
            //       height: 55,
            //       onPressed: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const HomePage()));
            //       },
            //       color: cnst.appPrimaryMaterialColor,
            //       shape: RoundedRectangleBorder(
            //         side: const BorderSide(color: Colors.white),
            //         borderRadius: BorderRadius.circular(50),
            //       ),
            //       child: const Text(
            //         "Login",
            //         style: TextStyle(
            //           fontWeight: FontWeight.w600,
            //           fontSize: 25,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            //  Container(
            // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 175),
            // height: MediaQuery.of(context).size.height -80,
            // width: double.infinity,
            // child:
          ],
        )
        // )
        );
  }
}
