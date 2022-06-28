import 'package:flutter/material.dart';
import 'package:rotaract_app/constant/constant.dart' as cnst;
import 'package:rotaract_app/constant/constant.dart';
import 'login_page.dart';
import 'signup_screen.dart';

class LoginSignUPScreen extends StatefulWidget {
  const LoginSignUPScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUPScreen> createState() => _LoginSignUPScreenState();
}

class _LoginSignUPScreenState extends State<LoginSignUPScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left:15),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Container(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset("assets/images/ROTARACT LOGO.png",
                    width: MediaQuery.of(context).size.width * 0.80),
              ),
              Container(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset("assets/images/Team spirit.gif"),
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: ColorsConstData.appBaseColor,
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.pink)),
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
            )));
  }
}
