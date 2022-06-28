import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../provider/providerNotifier.dart';

class BloodBankTabScreen extends StatefulWidget {
  const BloodBankTabScreen({Key? key}) : super(key: key);

  @override
  State<BloodBankTabScreen> createState() => _BloodBankTabScreenState();
}

class _BloodBankTabScreenState extends State<BloodBankTabScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    providerNotifier.getAllBloodBankListDataNotifier().whenComplete(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    return isLoading == true
        ? Container(
            child: Center(
                child: CircularProgressIndicator(
              color: ColorsConstData.appBaseColor,
            )),
          )
        :  providerNotifier.getAllBloodBankListData!.data!.isEmpty
        ? Center(
      child: Text("No Data", style: TextStyle(fontSize: 18)),
    )
        :Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      itemCount:
                          providerNotifier.getAllBloodBankListData?.data!.length,
                      // physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side:  BorderSide(
                                  color: ColorsConstData.appBaseColor, width: .5),
                            ),
                            child: ListTile(
                              title: Text(providerNotifier.getAllBloodBankListData!.data![index].name!),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(providerNotifier.getAllBloodBankListData!.data![index].area!),
                                ],
                              ),
                              trailing: Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          launch('tel:${providerNotifier.getAllBloodBankListData!.data![index].phone!}');
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/images/phone-call.png',
                                        height: 20,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          launch(
                                              'https://www.google.com/maps/dir/?api=1&origin=43.7967876,-79.5331616&destination=43.5184049,-79.8473993&waypoints=43.1941283,-79.59179|43.7991083,-79.5339667|43.8387033,-79.3453417|43.836424,-79.3024487&travelmode=driving&dir_action=navigate');
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/images/placeholder.png',
                                        height: 25,
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
          );
  }
}
