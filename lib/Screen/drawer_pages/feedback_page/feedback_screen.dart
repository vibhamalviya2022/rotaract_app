import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarData(
          appBarTitle: "Feedback",
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      ///this is old code by susmita
      // AppBar(
      //   centerTitle: true,
      //   title:
      //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      //     Text('Feedback'),
      //   ]),
      //   elevation: 0,
      //   backgroundColor: ColorsConstData.appBaseColor,
      //    leading: IconButton(
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //             icon: const Icon(
      //               Icons.arrow_back_ios,
      //               size: 30,
      //               color: Colors.white,
      //             ),
      //           ),
      // ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: ColorsConstData.appBaseColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      'Send us Your Feedback !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 25, right: 25),
                    child: Text(
                      "Do you Have Any Suggestion or Found Some Bug?\nlet us know in the Below",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
                // height: MediaQuery.of(context).size.height * 0.45,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.27),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.white,
                    border: Border.all(
                        color: ColorsConstData.appBaseColor, width: 1)),
                padding: EdgeInsets.all(40),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          'How was your Experience?',
                          style: TextStyle(
                              color: ColorsConstData.appBaseColor,
                              fontSize: 20),
                        ),
                        Text('(Select a star amount)'),
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RatingStars(
                                value: value,
                                onValueChanged: (v) {
                                  //
                                  setState(() {
                                    value = v;
                                  });
                                },
                                starBuilder: (index, color) => Icon(
                                  Icons.star_border,
                                  color: color,
                                ),
                                starCount: 5,
                                starSize: 30,
                                valueLabelColor: const Color(0xff9b9b9b),
                                valueLabelTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                valueLabelRadius: 10,
                                maxValue: 5,
                                starSpacing: 2,
                                maxValueVisibility: true,
                                valueLabelVisibility: true,
                                animationDuration: Duration(milliseconds: 1000),
                                valueLabelPadding: const EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 8),
                                valueLabelMargin:
                                    const EdgeInsets.only(right: 8),
                                starOffColor: const Color(0xffe7e8ea),
                                starColor: ColorsConstData.appBaseColor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 2,
                      shadowColor: Colors.grey.withOpacity(0.8),
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                            hintText: 'Describe Your Exprience here',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: new BorderSide(
                                    color: ColorsConstData.appBaseColor))),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 55,
                          onPressed: () {

                          },
                          color: ColorsConstData.appBaseColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text(
                            "Submit Feedback",
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
    );
  }
}
