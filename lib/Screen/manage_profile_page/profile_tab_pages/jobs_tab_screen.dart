import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/all_text_data_const/profile_text_form_field_const.dart';
import 'package:rotaract_app/Screen/manage_profile_page/profile_tab_pages/add_job.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/shared_pfrefs_data/shared_prefs_key.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../provider/providerNotifier.dart';
import '../../../shared_pfrefs_data/shared_prefs_data.dart';

class JobsTabScreen extends StatefulWidget {
  const JobsTabScreen({Key? key}) : super(key: key);

  @override
  State<JobsTabScreen> createState() => _JobsTabScreenState();
}

class _JobsTabScreenState extends State<JobsTabScreen> {
  TextEditingController companyController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController experianceController = TextEditingController();
  ScrollController controller = ScrollController();
  TextEditingController seacrhController = TextEditingController();

  var getAlljobData;
  Timer? timer;
  bool isLoading = false;
  bool isUpdate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    providerNotifier.getAllJobNotifier().whenComplete(() {
      timer = Timer(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
          timer!.cancel();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    getAlljobData = providerNotifier.getallJobDataList.reversed.toList();
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: isLoading == true ? Container(
        child: Center(
          child: CircularProgressIndicator(
            color: ColorsConstData.appBaseColor,
          ),
        ),
      ) : Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.058,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border:
                Border.all(color: ColorsConstData.appBaseColor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                controller: seacrhController,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () {
                    },
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        seacrhController.clear();
                      });
                    },
                    child: Icon(Icons.close),
                  ),
                  hintText: "Search contacts",
                  border: InputBorder.none,
                ),
                onChanged: (value){
                  setState(() {
                    // onItemChanged(value);
                  });
                },
                onTap: (){
                  setState(() {
                    seacrhController.clear();
                  });
                },
                onSubmitted: (value) {
                  setState(() {});
                },
              ),
            ),
            Container(
              height: size.height -210,
              child:providerNotifier.getallJobDataList.isEmpty
                  ? Center(
                child: Text("No Data",style: TextStyle(fontSize: 18)),
              ) : ListView.builder(
                  controller:controller,
                  padding: EdgeInsets.all(10),
                  itemCount:getAlljobData.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                          color: ColorsConstData.appBaseColor,
                          width: .5),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                            Text("Job Title",style: TextStyle(fontWeight: FontWeight.w600),),
                             Text("No Of Positions",style: TextStyle(fontWeight: FontWeight.w600),),
                            Text("Job Type",style: TextStyle(fontWeight: FontWeight.w600),),
                            Text("Discription",style: TextStyle(fontWeight: FontWeight.w600),),
                            Text("Salary",style: TextStyle(fontWeight: FontWeight.w600),),
                            Text("Remark",style: TextStyle(fontWeight: FontWeight.w600),),
                           ],
                         ),
                          SizedBox(width: 40,),
                         Column(
                           children: [
                             Text(":"),
                             Text(":"),
                             Text(":"),
                             Text(":"),
                             Text(":"),
                             Text(":"),
                           ],
                         ),
                          SizedBox(width: 50,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(getAlljobData[index]!.jobTitle!,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(getAlljobData[index]!.noOfPost!,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                width: size.width * 0.33,
                                child: Text(getAlljobData[index]!.jobType!,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(getAlljobData[index]!.jobDescription!,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(getAlljobData[index]!.salary!,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(getAlljobData[index]!.remark!,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                                ],
                          )
                        ],
                      ),
                    )

                  )),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
         Navigator.push(context,MaterialPageRoute(builder: (context) => AddJob(),));
        },
        label: const Text('Add Job'),
        icon: const Icon(Icons.add),
        backgroundColor: ColorsConstData.appBaseColor,
      ),
    );
  }
}
