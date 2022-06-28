import 'package:flutter/material.dart';


import '../../../../drawer_pages/drawer_navigation_screen.dart';

class MatrimonyProfileScreen extends StatefulWidget {
  const MatrimonyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MatrimonyProfileScreen> createState() => _MatrimonyProfileScreenState();
}

class _MatrimonyProfileScreenState extends State<MatrimonyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('profile'),
          ]),
          elevation: 0,
          backgroundColor: Color(0xffE5097F),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xffE5097F),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.white,
                      border: Border.all(color: Color(0xffE5097F), width: 1)),
                  padding: EdgeInsets.all(40),
                  child: Column(
                    children: [
                     Container(child:Text('hii'),),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 55,
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => DashboardPage()));
                            },
                            color: Color(0xffE5097F),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              "Request",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
