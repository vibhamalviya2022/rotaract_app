import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/all_text_data_const/all_text_data_const.dart';
import 'package:rotaract_app/Screen/all_text_data_const/border_text_field_const.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/directory_pages/directory_detils_screen.dart';
import 'package:rotaract_app/Screen/drawer_pages/post_ask_pages/add_post_ask.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/provider/providerNotifier.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


class PostAskScreen extends StatefulWidget {
  const PostAskScreen({Key? key}) : super(key: key);

  @override
  State<PostAskScreen> createState() => _PostAskScreenState();
}

class _PostAskScreenState extends State<PostAskScreen> {

  ScrollController controller = ScrollController();
  TextEditingController seacrhController = TextEditingController();
  bool isLoading = true;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context,listen: false);
    providerNotifier.getPostAskDataNotifier().whenComplete(() {
      timer =  Timer(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    });
    // providerNotifier.getAllManageMemberListDataNotifier();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarData(
          appBarTitle: "Post Ask",
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
        body: isLoading == true
            ? Container(
          height: MediaQuery.of(context).size.height / 1.3,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
            : providerNotifier.askDataList.isEmpty
            ? Center(
          child: Text("No Data", style: TextStyle(fontSize: 18)),
        )
            : Container(
          // height: MediaQuery.of(context).size.height - 70,
          child: AnimationLimiter(
            child: ListView.builder(
                controller: controller,
                shrinkWrap: true,
                scrollDirection:Axis.vertical,
                padding: EdgeInsets.all(10),
                itemCount: providerNotifier.askDataList.length,
                itemBuilder: (context, index) =>
                    AnimationConfiguration.staggeredList(
                      position: index,
                      duration: Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(8.0),
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Title             : ",style: TextStyle(fontWeight: FontWeight.w600)),
                                      Text(providerNotifier
                                          .askDataList[index].title!,
                                      ),
                                    ],
                                  ),

                                  Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("AskDt          : ",style: TextStyle(fontWeight: FontWeight.w600)),
                                          Text(providerNotifier
                                              .askDataList[index].askDate!),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("CloseDt : ",style: TextStyle(fontWeight: FontWeight.w600)),
                                          Text(providerNotifier
                                              .askDataList[index].closeDate!),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("description : ",style: TextStyle(fontWeight: FontWeight.w600) ),
                                      Text(providerNotifier
                                          .askDataList[index].description!),
                                    ],
                                  ),
                                ],
                              ),
                          ),
                        )
                      ),
                    )),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push( MaterialPageRoute(builder: (_) => AddPostAsk()));
            // Add your onPressed code here!
          },
          label: Text('Add Post Ask'),
          icon: Icon(Icons.add),
          backgroundColor: ColorsConstData.appBaseColor,
        )
    );
  }
}
