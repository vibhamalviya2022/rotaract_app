import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/bottom_navigation/dashboard_pages/dashboard_grid_Pages/blood_donate_page/tab_bar_view_pages/donor_tab/donor_registration_screen.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/provider/providerNotifier.dart';
import 'package:rotaract_app/shared_pfrefs_data/shared_prefs_data.dart';
import 'package:rotaract_app/shared_pfrefs_data/shared_prefs_key.dart';
import 'package:url_launcher/url_launcher_string.dart';


class DonorTabScreen extends StatefulWidget {
  const DonorTabScreen({Key? key}) : super(key: key);

  @override
  State<DonorTabScreen> createState() => _DonorTabScreenState();
}

class _DonorTabScreenState extends State<DonorTabScreen> {
  var phone = '';
  var number = '+919328978062';
  ScrollController controller = ScrollController();
  TextEditingController seacrhController = TextEditingController();
  var memberName;
  bool isLoading = true;
  List SearchList = [];
  bool isSearching = false;
  var bloodDonateList;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    providerNotifier.getAllBloodDonarListDataNotifier().whenComplete(() {
      isLoading = false;
      for (var tamp in providerNotifier.bloodDonarList) {
        setState(() {
          SearchList.add(tamp.name.toString());
          print("Search Name${tamp}");
        });
      }
    });
    getName();
  }

  List newSearchDataList = [];

  onItemChanged(String value) {
    // isLoading = false;

    debugPrint("000000000");
    setState(() {
      newSearchDataList = SearchList.where(
              (string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
    debugPrint("search...........:${newSearchDataList}");
  }

  getName() async {
    memberName = await SharedPrefsData.getStringData(SharedPrefsKey.memberName);
  }

  @override
  Widget build(BuildContext context) {

    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    bloodDonateList = providerNotifier.allBloodDonar?.data!.reversed.toList();
    // newSearchDataList = bloodDonateList;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isLoading == true
          ? Container(
              child: const Center(
                child: CircularProgressIndicator(
                  color: ColorsConstData.appBaseColor,
                ),
              ),
            )
          : bloodDonateList.toString().isEmpty
              ? Center(
                  child: Text("No Data", style: TextStyle(fontSize: 18)),
                )
              : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: controller,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.058,
                      margin: EdgeInsets.only(bottom: 10,top: 10),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: ColorsConstData.appBaseColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: seacrhController,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                            ),
                            onPressed: () {},
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
                        onChanged: (value) {
                          setState(() {
                            onItemChanged(value);
                          });
                        },
                        onTap: () {
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
                      height: size.height - 179,
                      child: ListView.builder(
                          controller: controller,
                          padding: EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          itemCount: seacrhController.text.isEmpty
                              ? bloodDonateList.length
                              : newSearchDataList.length,
                          // reverse: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  // side: BorderSide(
                                  //     color: ColorsConstData.appBaseColor,
                                  //     width: .5),
                                ),
                                child: ExpansionTile(
                                  expandedAlignment: Alignment.bottomCenter,
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/image.png"), // no matter how big it is, it won't overflow
                                  ),
                                  title: Text(
                                    seacrhController.text.isEmpty
                                        ? bloodDonateList[index].name
                                        : newSearchDataList[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  // subtitle: Text(
                                  //   'Actor',
                                  //   style: TextStyle(
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                          icon: Image.asset(
                                            "assets/images/whatsapp.png",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                          ),
                                          onPressed: () {
                                            launchUrlString(
                                                "whatsapp://send?${bloodDonateList[index].phone}="
                                                "&text=Hello, I am ${memberName}!");
                                          },
                                        ),
                                        IconButton(
                                          icon: Image.asset(
                                            "assets/images/phone-call.png",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                          ),
                                          onPressed: () {
                                            launchUrlString(
                                                'tel:${bloodDonateList[index].phone}');
                                          },
                                        ),
                                        IconButton(
                                          icon: Image.asset(
                                            "assets/images/placeholder.png",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              launchUrlString(
                                                  'https://www.google.com/maps/dir/?api=1&origin=43.7967876,-79.5331616&destination=43.5184049,-79.8473993&waypoints=43.1941283,-79.59179|43.7991083,-79.5339667|43.8387033,-79.3453417|43.836424,-79.3024487&travelmode=driving&dir_action=navigate');
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                elevation: 4,
                              )),
                    ),

                  ],
                ),
              ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push( MaterialPageRoute(builder: (_) => DonorRegistrationScreen()));
          // Add your onPressed code here!
        },
        label: Text('Registration'),
        icon: Icon(Icons.add),
        backgroundColor: ColorsConstData.appBaseColor,
      )
    );
  }
}
