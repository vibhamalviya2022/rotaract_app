import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/APIs/api.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/provider/providerNotifier.dart';
import 'aarogyam_details_page_screen.dart';
import 'dart:math';

class DashboardAarogyamScreen extends StatefulWidget {
  const DashboardAarogyamScreen({Key? key}) : super(key: key);

  @override
  State<DashboardAarogyamScreen> createState() => _DashboardAarogyamScreenState();

}

class _DashboardAarogyamScreenState extends State<DashboardAarogyamScreen> {

  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context,listen: false);
    providerNotifier.getAllDoctorListDataNotifier().whenComplete(() {
      isLoading = false;
    });
  }
  TextEditingController seacrhController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);

    return  Scaffold(
          // resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBarData(
              appBarTitle: "Aarogyam",
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ),


///this is old code by susmita
          // PreferredSize(
          //   preferredSize: Size.fromHeight(60),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(40),
          //         bottomRight: Radius.circular(40)),
          //     child: AppBar(
          //       centerTitle: true,
          //       title: Text(
          //         "Aarogyam",
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       elevation: 2,
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
          //     ),
          //   ),
          // ),
          body:isLoading == true ? Container(
            child: Center(
              child: CircularProgressIndicator(color: ColorsConstData.appBaseColor),
            )
          ): Container(
            padding: EdgeInsets.only(top:10),
            child: Column(
              children: [
                 Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.055,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsConstData.appBaseColor),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextFormField(
                    onChanged: (value){},
                    controller: seacrhController,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                        ),
                        onPressed: () {

                        },
                      ),
                      suffixIcon: GestureDetector(onTap: (){
                        setState(() {
                          seacrhController.clear();
                        });
                      },child: Icon(Icons.close),
                      ),
                      hintText: "Search Doctor",
                      border: InputBorder.none,
                    ),
                  ),
                ),

                providerNotifier.allDoctorListNp!.data! != null ? Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    // physics: BouncingScrollPhysics(),
                    itemCount: providerNotifier.allDoctorListNp!.data!.length,
                    itemBuilder: (context, index) => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AarogyanDetailsScreen(dataDoctor: providerNotifier.allDoctorListNp!.data![index],)));
                              },
                              child:ListTile(
                                  title: Text(providerNotifier.allDoctorListNp!.data![index].name == null ? "":providerNotifier.allDoctorListNp!.data![index].name!),
                                  subtitle: Text(providerNotifier.allDoctorListNp!.data![index].skill == null ? "":providerNotifier.allDoctorListNp!.data![index].skill!),
                                  // leading: CircleAvatar(
                                  //   backgroundImage: AssetImage( Api.baseUrl + providerNotifier.allDoctorListNp!.data![index].image!.first), // no matter how big it is, it won't overflow
                                  // ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorsConstData.appBaseColor,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      elevation: 4,
                    ),
                  ),
                // ignore: prefer_const_constructors
                ) : Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            ),
          ),
    );
  }
}
