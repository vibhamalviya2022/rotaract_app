import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/provider/providerNotifier.dart';
import 'package:url_launcher/url_launcher.dart';

class BoardOfDirectorScreen extends StatefulWidget {
  const BoardOfDirectorScreen({Key? key}) : super(key: key);

  @override
  State<BoardOfDirectorScreen> createState() => _BoardOfDirectorScreenState();
}

class _BoardOfDirectorScreenState extends State<BoardOfDirectorScreen> {
  bool isLoading = true;

  ScrollController controller = ScrollController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(
        context, listen: false);
    providerNotifier.getAllBodirectorListDataNotifier().whenComplete(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context,);
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(

        // backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarData(
            appBarTitle: "Board of director",
            onTap: () {
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
        //         "Board of director",
        //         style: TextStyle(color: Colors.white),
        //       ),
        //       elevation: 0,
        //       backgroundColor: ColorsConstData.appBaseColor,
        //       leading: IconButton(
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //         icon:Icon(
        //           Icons.arrow_back_ios,
        //           size: 30,
        //           color: Colors.white,
        //         ),
        //       ),
        //       systemOverlayStyle: SystemUiOverlayStyle.dark,
        //     ),
        //   ),
        // ),
        body: SafeArea(
          child: isLoading == true ?
          Container(
            child: Center(
              child: CircularProgressIndicator(
                  color: ColorsConstData.appBaseColor),
            ),
          ):
          providerNotifier.allBodData!.data!.isEmpty ?
          Container(
            child: Center(
              child: Text("No Data"),
            ),
          )
              :Container(
            padding: EdgeInsets.only(top: 10),
            child: SingleChildScrollView(

              scrollDirection: Axis.vertical,
              controller:controller ,
              child: Column(
                children: [
                  ListView.builder(
                  controller: controller,
                    physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      itemCount: providerNotifier.allBodData!.data!.length,

                      itemBuilder: (context, index) =>
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              // side: BorderSide(
                              //     color: ColorsConstData.appBaseColor,
                              //     width: .5),
                            ),
                            child: ListTile(
                              onTap: () {

                              },
                              title:Text("${providerNotifier.allBodData!
                                  .data![index].managemember!.first.name} ${providerNotifier.allBodData!
                                  .data![index].managemember!.first.surname}"),
                               subtitle: Text("${providerNotifier.allBodData!
                                   .data![index].managemember!.first.companyName}"),
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/images/image.png"), // no matter how big it is, it won't overflow
                              ),
                              trailing: Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.28,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          launch(
                                              "https://wa.me/${providerNotifier
                                                  .allBodData!.data![index]
                                                  .managemember!.first
                                                  .phoneNumber}?text=#msg");
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/images/whatsapp.png',
                                        height: 28,
                                      ),
                                    ),
                                    SizedBox(width: size.width * 0.02),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          launch('tel:${providerNotifier
                                              .allBodData!.data![index]
                                              .managemember!.first
                                              .phoneNumber}');
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/images/phone-call.png',
                                        height: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            elevation: 4,
                          )),
                ],
              ),
            ),
          ),
        ));
  }
}
