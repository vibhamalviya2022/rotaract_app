import 'package:flutter/material.dart';
import 'package:rotaract_app/home_page.dart';
import 'package:rotaract_app/shared_pfrefs_data/shared_prefs_data.dart';
import 'package:rotaract_app/shared_pfrefs_data/shared_prefs_key.dart';

import 'login_signup.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _navigatetohome();
    checkUserLoginOrNot();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 4), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                isLogin == true ? HomePage() : LoginSignUPScreen()));
  }

  checkUserLoginOrNot() async {
    isLogin = await SharedPrefsData.getBoolData(SharedPrefsKey.isLoginUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body:
            // Container(
            // width: double.infinity,
            // height: MediaQuery.of(context).size.height,
            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 180),
            // child:
            SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top:50.0),
                  child: Image.asset("assets/images/ROTARACT LOGO.png",
                      width: MediaQuery.of(context).size.width * 0.80),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Team spirit.gif"))),
                ),
                const SizedBox(
                  height: 50,
                )
              ]),
        )
        // )
        );
  }
}
