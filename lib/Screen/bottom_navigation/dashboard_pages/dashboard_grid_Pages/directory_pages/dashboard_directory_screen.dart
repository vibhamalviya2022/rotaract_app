import 'dart:async';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/APIs/api.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/Screen/manage_profile_page/profile_screen.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../provider/providerNotifier.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'directory_detils_screen.dart';

class DirectoryScreen extends StatefulWidget {
  const DirectoryScreen({Key? key}) : super(key: key);

  @override
  State<DirectoryScreen> createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {
  TextEditingController seacrhController = TextEditingController();
  ScrollController controller = ScrollController();

  bool isLoading = true;
  Timer? timer;
  List SearchList = [];

  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);

    contactPermission();
    providerNotifier.getAllManageMemberListDataNotifier().whenComplete(() {
      timer = Timer(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
          timer!.cancel();
        });
      });
      for (int i = 0; i < providerNotifier.allManageList.length; i++) {
        setState(() {
          SearchList.add(
              providerNotifier.allManageList[i]!.managemember!.first.name);
          // print("Search Name${tamp}");
        });
      }
    });
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

  launchURL(String url) async {
    print(url);
    print("print Url regeister");

    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Contact contact = Contact();

  Widget appBarTitle = Text(
    'Directory',
    style: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
  );

  Icon icon = Icon(
    Icons.search,
    color: Colors.white,
  );

  contactPermission() async {
    PermissionStatus permissionStatus = await Permission.contacts.request();
    if (permissionStatus == PermissionStatus.granted) {
      Fluttertoast.showToast(msg: "Contact Permisssion Access Successfully");
    } else if (permissionStatus == PermissionStatus.denied) {
      Fluttertoast.showToast(msg: "Contact Permisssion denined");
      contactPermission();
    }
  }

  //Contact
  _saveAllToContact() async {
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);
    for (int i = 0;
        i < providerNotifier.allManageList.length;
        i++) {
      contact.givenName =
          "Rotarect ${providerNotifier.allManageList[i]!.managemember!.first.name}";
      contact.phones = [
        Item(
            label: "mobile",
            value: providerNotifier
                .allManageList[i]!.managemember!.first.phoneNumber)
      ];
      contact.emails = [
        Item(
            label: "work",
            value: providerNotifier
                .allManageList[i]!.managemember!.first.email)
      ];
      contact.company = providerNotifier
          .allManageList[i]!.managemember!.first.companyName;

      print("contact Save");
      await ContactsService.addContact(contact);
      print("print Give Name${contact.givenName}");
    }

    Fluttertoast.showToast(
        msg: "All Contacts Saved Successfully...",
        gravity: ToastGravity.TOP,
        toastLength: Toast.LENGTH_LONG);
  }

  bool _isSearching = false;

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = Text(
        ' Directory',
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      );
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorsConstData.appBaseColor,
                    ColorsConstData.appBaseColor,
                    Colors.pinkAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: AppBar(
                actions: <Widget>[
                  IconButton(
                    icon: icon,
                    onPressed: () {
                      if (this.icon.icon == Icons.search) {
                        this.icon = Icon(
                          Icons.close,
                          color: Colors.white,
                        );
                        this.appBarTitle = TextField(
                          controller: seacrhController,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              seacrhController.clear();
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.white),
                              hintText: "Search...",
                              hintStyle: TextStyle(color: Colors.white)),
                          onChanged: (value) {
                            setState(() {
                              onItemChanged(value);
                            });
                          },
                          // onSubmitted: searchOperation,
                        );
                        _handleSearchStart();
                      } else {
                        _handleSearchEnd();
                      }
                    },
                  ),
                ],
                centerTitle: true,
                title: appBarTitle,
                elevation: 0,
                backgroundColor: Colors.transparent,
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
                // backgroundColor: Colors.transparent,
              ),
            ),
          )),

      // PreferredSize(
      //   preferredSize: Size.fromHeight(60),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(40),
      //         bottomRight: Radius.circular(40)),
      //     child: AppBar(
      //       centerTitle: true,
      //       title: Text(
      //         "Directory",
      //         style: TextStyle(color: Colors.white),
      //       ),
      //       elevation: 0,
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
      //       systemOverlayStyle: SystemUiOverlayStyle.dark,
      //     ),
      //   ),
      // ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _saveAllToContact();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      color: ColorsConstData.appBaseColor,
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Text("Save All Contacts",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
              isLoading == true
                  ? Container(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height - 150,
                      child: AnimationLimiter(
                        child: ListView.builder(
                            controller: controller,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.all(10),
                            itemCount: seacrhController.text.isEmpty
                                ? providerNotifier
                                    .allManageList.length
                                : newSearchDataList.length,
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
                                        // side: const BorderSide(
                                        // color:
                                        //     ColorsConstData.appBaseColor,
                                        // width: .5
                                        // ),
                                      ),
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DirectoryDetailsScreen(
                                                          index: index)));
                                        },
                                        title: Text(
                                            seacrhController.text.isEmpty
                                                ? providerNotifier
                                                    .allManageList[index]!.managemember!
                                                    .first
                                                    .name
                                                : newSearchDataList[index]),
                                        subtitle: Text(
                                            seacrhController.text.isEmpty
                                                ? providerNotifier
                                                    .allManageList[index]!
                                                    .managemember!
                                                    .first
                                                    .companyName
                                                : newSearchDataList[index]),
                                        // leading: Image.network(
                                        //   "https://rotarect.herokuapp.com/" +
                                        //       providerNotifier
                                        //           .allManageMemberList!
                                        //           .data![index]
                                        //           .managemember!
                                        //           .first
                                        //           .profileImage!
                                        //           .first,
                                        //   width: 50,
                                        // ),
                                        trailing: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.28,
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    launch(
                                                        "https://wa.me/${seacrhController.text.isEmpty ? providerNotifier.allManageList[index]!.managemember!.first.phoneNumber : newSearchDataList[index]}?text=#msg");
                                                  });
                                                },
                                                child: Image.asset(
                                                  'assets/images/whatsapp.png',
                                                  height: 25,
                                                ),
                                              ),
                                              SizedBox(
                                                  width: size.width * 0.01),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    launchURL(
                                                        "tel:${seacrhController.text.isEmpty ? providerNotifier.allManageList[index]!.managemember!.first.phoneNumber  : newSearchDataList[index]}");
                                                  });
                                                },
                                                child: Image.asset(
                                                  'assets/images/phone-call.png',
                                                  height: 20,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios,
                                                color: ColorsConstData
                                                    .appBaseColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      elevation: 4,
                                    ),
                                  ),
                                )),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
