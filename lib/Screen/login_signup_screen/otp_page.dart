import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/home_page.dart';
import 'package:rotaract_app/shared_pfrefs_data/shared_prefs_data.dart';
import 'package:rotaract_app/shared_pfrefs_data/shared_prefs_key.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

enum Status {Waiting, Error}

class OTPPage extends StatefulWidget {
  var mobileNumber;
  var countryCode;

  OTPPage({this.mobileNumber, this.countryCode});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  GlobalKey<FormState> _otpKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  final CountdownController _controller =  CountdownController(autoStart: true);

  bool isResendActive = false;

  var phoneNumber;
  var _verificationId;

  FirebaseAuth _auth = FirebaseAuth.instance;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneNumber = widget.countryCode + widget.mobileNumber;
    print("print Country Code${widget.countryCode}");
    print("print Mobile Number Code${widget.mobileNumber}");
    _verifyPhoneNumber();
  }

  Future _verifyPhoneNumber() async {
   setState(() {
     isResendActive = true;
   });
    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phonesAuthCredentials) async {
          controller.text = phonesAuthCredentials.smsCode.toString();
          timer = Timer.periodic(Duration(seconds: 2), (t) {
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => HomePage()),
                (route) => false);
            SharedPrefsData.setBoolData(SharedPrefsKey.isLoginUser, true);
            timer!.cancel();
          });
          print("Otp Valid");
        },
        verificationFailed: (verificationFailed) async {
          Fluttertoast.showToast(msg: "Otp is invalid");
        },
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            this._verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) async {});
  }

  Future _sendCodeToFirebase({String? code}) async {
    if (this._verificationId != null) {
      var credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: code!);
      await _auth
          .signInWithCredential(credential)
          .then((value) {
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => HomePage()),
                (route) => false);
            SharedPrefsData.setBoolData(SharedPrefsKey.isLoginUser, true);
          })
          .whenComplete(() {})
          .onError((error, stackTrace) {
            Fluttertoast.showToast(msg: "Otp is invalid");

          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsConstData.appBaseColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _otpKey,
          autovalidateMode: AutovalidateMode.always,
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorsConstData.appBaseColor,
                    ColorsConstData.appBaseColor,
                    Colors.pinkAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(

                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: ColorsConstData.appBaseColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Verification",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Enter the code we sent to your Mobile Number",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.22),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.white,
                      border: Border.all(
                          color: ColorsConstData.appBaseColor, width: 2)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: PinInputTextField(
                          pinLength: 6,
                          //decoration: _pinDecoration,
                          controller: controller,
                          autoFocus: true,
                          onSubmit: (pin) {
                            if (pin.length == 6) {
                              _verifyPhoneNumber();
                            } else {
                              Fluttertoast.showToast(msg: "Invalid OTP");
                            }
                          },
                          autofillHints: [AutofillHints.oneTimeCode],
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 55,
                            onPressed: () {
                              _sendCodeToFirebase(code: controller.text);
                            },
                            color: ColorsConstData.appBaseColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              " Verify",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isResendActive == false ? Container() :Countdown(
                            controller: _controller,
                            seconds: 60,
                            build: (_, time) {
                              int mins = Duration(
                                  seconds: int.parse(
                                      time.toString().split(".")[0]))
                                  .inMinutes;
                              int seconds = Duration(
                                  seconds: int.parse(
                                      time.toString().split(".")[0]))
                                  .inSeconds;
                              return Text(
                                "${mins.toString().padLeft(2, "0")} : ${(seconds - (mins * 60)).toString().padLeft(2, "0")}",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black45,
                                ),
                              );
                            },
                            interval: Duration(seconds: 1),
                            onFinished: () {
                              setState(() {
                                isResendActive = false;
                              });
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Text("Didn't get Code? ",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade600)),
                          InkWell(
                            onTap: isResendActive == true ? () {
                              Fluttertoast.showToast(msg: "Please wait till the timer is off !!");
                            } :() {
                              Fluttertoast.showToast(
                                  msg: "OTP Sending",
                                  textColor: Colors.white,
                                  backgroundColor: Colors.green);
                              _verifyPhoneNumber();
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text("RESEND CODE",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: isResendActive == true ? Colors.grey : ColorsConstData.appBaseColor,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
            // onSubmit: (pin) {
            //   if (pin.length == 6) {
            //     _onFormSubmitted();
            //   } else {
            //     Fluttertoast.showToast(msg: "Invalid OTP");
            //   }
            // },
          ]),
        ),
      ),
    );
  }
}
