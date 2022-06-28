import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/Screen/all_text_data_const/profile_drop_down_const.dart';
import 'package:rotaract_app/Screen/all_text_data_const/profile_text_form_field_const.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:rotaract_app/shared_pfrefs_data/shared_prefs_data.dart';

import '../../../model/all_manage_members_model/get_all_manage_members_model.dart';
import '../../../provider/providerNotifier.dart';
import '../../../shared_pfrefs_data/shared_prefs_key.dart';

class PersonalTabScreen extends StatefulWidget {

  @override
  State<PersonalTabScreen> createState() => _PersonalTabScreenState();
}

class _PersonalTabScreenState extends State<PersonalTabScreen> {
  var groupselected = 4;
  var bloodGroop;
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController anniversaryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController instaController = TextEditingController();
  TextEditingController fbController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  Timer? timer;
  bool isLoading = false;
  bool isUpdate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier =
        Provider.of<ProviderNotifier>(context, listen: false);

    providerNotifier.getMemberProfileNotifier().whenComplete(() {
      print("print Name data${providerNotifier.memberList.first!.name!}");
      nameController.text = providerNotifier.memberList.first!.name!;
      mobileController.text = providerNotifier.memberList.first!.phoneNumber!;
      dateController.text = providerNotifier.memberList.first!.dob!;
      bloodGroop = providerNotifier.memberList.first!.bloodGroup!;
      anniversaryController.text = providerNotifier.memberList.first!.anniversary!;
      addressController.text = providerNotifier.memberList.first!.address!;
      cardController.text = providerNotifier.memberList.first!.adharCard!;
      sizeController.text = providerNotifier.memberList.first!.tshirtSize!;
      instaController.text = providerNotifier.memberList.first!.instagramId!;
      fbController.text = providerNotifier.memberList.first!.facebookId!;
      groupselected = int.parse(providerNotifier.memberList.first!.gender!.toString());
    });
    timer = Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = true;
        timer!.cancel();
      });
    });
  }

  final List<Map<String, dynamic>> _bloodgroup = [
    {
      'value': 'Select your blood group3365555',
    },
    {
      'value': 'a-',
      'label': 'A-',
    },
    {
      'value': 'a+',
      'label': 'A+',
    },
    {
      'value': 'b-',
      'label': 'B-',
    },
    {
      'value': 'b+',
      'label': 'B+',
    },
    {
      'value': 'ab-',
      'label': 'AB-',
    },
    {
      'value': 'ab+',
      'label': 'AB+',
    },
    {
      'value': 'o+',
      'label': 'O+',
    },
    {
      'value': 'o-',
      'label': 'O-',
    },
  ];

  File? logofileImage;
  final ImagePicker imagePicker = ImagePicker();

  getLogoImagePicker(ImageSource source) async {
    try {
      // ignore: deprecated_member_use
      final imagepathData = await imagePicker.getImage(source: source);
      setState(() {
        logofileImage = File(imagepathData!.path);
      });

      if (imagepathData == null) {
        Navigator.of(context).pop();
      } else {
        Navigator.of(context).pop();
      }
    } catch (e) {
      print("data picker errro in image data  ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);
    Size size = MediaQuery.of(context).size;
    return isLoading == false?Center(child: CircularProgressIndicator(color: ColorsConstData.appBaseColor,),) : SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GestureDetector(
              onTap: () {
                bottomSelected();
              },
              child: CircleAvatar(
                child: ClipOval(
                  child: Container(
                    child: logofileImage == null
                        ? Image.asset('assets/images/man.png')
                        : Image.file(
                            File(logofileImage!.path.toString()),
                            width: 120,
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                maxRadius: 60,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: ColorsConstData.appBaseColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // providerNotifier.memberList.isEmpty ?
                    ProfileTextFormFieldConst(
                      labelName: "Name",
                      hintText: "Enter Your name",
                      controller: nameController,
                    ),
                    ProfileTextFormFieldConst(
                      labelName: "Date of Birth",
                      hintText: "Enter date",
                      controller: dateController,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: const Text(
                            "   Gender : ",
                            style: TextStyle(
                              color: ColorsConstData.appBaseColor,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio(
                                    value: 1,
                                    groupValue: groupselected,
                                    activeColor: ColorsConstData.appBaseColor,
                                    onChanged: (index) {
                                      setState(() {
                                        groupselected = index as int;
                                        print("selected Male value 1 : $groupselected");
                                      });
                                    }),
                                Text('Male'),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: 2,
                                    groupValue: groupselected,
                                    activeColor: ColorsConstData.appBaseColor,
                                    onChanged: (index) {
                                      setState(() {
                                        groupselected = index as int;
                                        print("selected Female value 2 : $groupselected");
                                      });
                                    }),
                                Text('Female'),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: 3,
                                    groupValue: groupselected,
                                    activeColor: ColorsConstData.appBaseColor,
                                    onChanged: (index) {
                                      setState(() {
                                        groupselected = index as int;
                                        print("selected Other value 3 : $groupselected");
                                      });
                                    }),
                                Text('Other'),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    ProfileDropDownConst(
                      intialValue: bloodGroop == null
                          ? "Select your blood"
                          : bloodGroop,
                      labelName: "Blood Group",
                      hintText: bloodGroop == null
                          ? "Select your blood"
                          : bloodGroop,
                      itemsData: _bloodgroup,
                      onChanged: (data) {
                        setState(() {
                          bloodGroop = data.toString().toUpperCase();
                          print("change blood Gruop " +
                              data.toString().toUpperCase());
                        });
                      },
                    ),
                    ProfileTextFormFieldConst(
                      labelName: "Anniversary",
                      hintText: "Enter Anniversary date",
                      controller: anniversaryController,
                    ),
                    ProfileTextFormFieldConst(
                      labelName: "Address",
                      hintText: "Enter Your address",
                      controller: addressController,
                    ),
                    ProfileTextFormFieldConst(
                      labelName: "Adhaar Card",
                      hintText: "Enter Your adhaar no.",
                      controller: cardController,
                    ),
                    ProfileTextFormFieldConst(
                      labelName: "T-shirt Size",
                      hintText: "Enter Your t-shirt size",
                      controller: sizeController,
                    ),
                    ProfileTextFormFieldConst(
                      labelName: "Instagram ID",
                      hintText: "Enter Your instagram id",
                      controller: instaController,
                    ),
                    ProfileTextFormFieldConst(
                      labelName: "Facebook ID",
                      hintText: "Enter Your facebook id",
                      controller: fbController,
                    ),
                    ProfileTextFormFieldConst(
                      labelName: "Phone No.",
                      hintText: "Enter Your mobile no.",
                      controller: mobileController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 90, vertical: 30),
                      child: isUpdate == true?Center(child: CircularProgressIndicator(color: ColorsConstData.appBaseColor,),) : Container(
                        decoration: BoxDecoration(),
                        child: MaterialButton(
                          minWidth: size.width * 0.50,
                          height: 40,
                          onPressed: () async {
                            setState(() {
                              isUpdate = true;
                            });
                            var memberId = await SharedPrefsData.getStringData(
                                SharedPrefsKey.memberId);
                            String img = '';
                            if (logofileImage != null) {
                              List<int> imageBytes = await logofileImage!.readAsBytesSync();
                              String base64Image = base64Encode(imageBytes);
                              img = base64Image;
                            }


                            print('base64 Img : $img');

                            var bodyData = json.encode({
                               "profileImage" : img,
                              "memberId": memberId,
                              "name": nameController.text,
                              "adharCard": cardController.text,
                              "tshirtSize": sizeController.text,
                              "instagramId": instaController.text,
                              "facebookId": fbController.text,
                              "dob": dateController.text,
                              "gender": groupselected.toString(),
                              "anniversary": anniversaryController.text,
                              "address": addressController.text,
                              "bloodGroup": bloodGroop,
                              "phoneNumber": mobileController.text,
                            });
                            setState(() {
                              providerNotifier
                                  .getUpdateMemberProfileNotifier(bodyData)
                                  .whenComplete(() {
                                Fluttertoast.showToast(
                                    msg: providerNotifier
                                        .updatememberProfile!.message!
                                        .toString());
                                setState(() {
                                  isUpdate = false;
                                });
                              });
                            });
                          },
                          color: ColorsConstData.appBaseColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text(
                            "Update",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///old code by susmita mam
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 10, vertical: 8),
                    //   child: SelectFormField(
                    //     initialValue: 'Select your blood group',
                    //     type: SelectFormFieldType.dropdown,
                    //     decoration: InputDecoration(
                    //       border: UnderlineInputBorder(),
                    //       labelText: 'Blood Group:',
                    //       hintText: 'Select your blood group',
                    //       suffixIcon: Align(
                    //         widthFactor: 1.0,
                    //         heightFactor: 1.0,
                    //         child: Icon(
                    //           Icons.keyboard_arrow_down_sharp,
                    //           color: ColorsConstData.appBaseColor,
                    //         ),
                    //       ),
                    //       labelStyle: TextStyle(
                    //         color: ColorsConstData.appBaseColor,
                    //       ),
                    //       focusedBorder: UnderlineInputBorder(
                    //         borderSide: BorderSide(
                    //           color: ColorsConstData.appBaseColor,
                    //         ),
                    //       ),
                    //     ),
                    //     items: _bloodgroup,
                    //     onChanged: (val) => print(val),
                    //     onSaved: (val) => print(val),
                    //   ),
                    // ),
                    /// this is old code made by susmita
                    //                  Padding(
                    //                    padding: const EdgeInsets.symmetric(
                    //                        horizontal: 10, vertical: 8),
                    //                    child: TextFormField(
                    //                      controller: controller,
                    //                      decoration: InputDecoration(
                    //                        floatingLabelBehavior: FloatingLabelBehavior.always,
                    //                        border: UnderlineInputBorder(),
                    //                        labelText: 'Name:',
                    //                        hintText: 'Enter your name',
                    //                        labelStyle: TextStyle(
                    //                          color: ColorsConstData.appBaseColor,
                    //                        ),
                    //                        focusedBorder: UnderlineInputBorder(
                    //                          borderSide: BorderSide(
                    //                            color: ColorsConstData.appBaseColor,
                    //                          ),
                    //                        ),
                    //                      ),
                    //                    ),
                    //                  ),
                    //                  Padding(
                    //                    padding: const EdgeInsets.symmetric(
                    //                        horizontal: 10, vertical: 8),
                    //                    child: TextFormField(
                    //                      decoration: InputDecoration(
                    //                        border: UnderlineInputBorder(),
                    //                        labelText: 'Date:',
                    //                        hintText: 'Enter date',
                    //                        labelStyle: TextStyle(
                    //                          color: ColorsConstData.appBaseColor,
                    //                        ),
                    //                        focusedBorder: UnderlineInputBorder(
                    //                          borderSide: BorderSide(
                    //                            color: ColorsConstData.appBaseColor,
                    //                          ),
                    //                        ),
                    //                      ),
                    //                    ),
                    //                  ),
                    //                  Padding(
                    //                    padding: const EdgeInsets.symmetric(
                    //                        horizontal: 10, vertical: 8),
                    //                    child: SelectFormField(
                    //                      initialValue: 'Select your gender',
                    //                      type: SelectFormFieldType.dropdown,
                    //                      decoration: InputDecoration(
                    //                        border: UnderlineInputBorder(),
                    //                        labelText: 'Gender:',
                    //                        hintText: 'Select your gender',
                    //                        suffixIcon: Align(
                    //                          widthFactor: 1.0,
                    //                          heightFactor: 1.0,
                    //                          child: Icon(
                    //                            Icons.keyboard_arrow_down_sharp,
                    //                            color: ColorsConstData.appBaseColor,
                    //                          ),
                    //                        ),
                    //                        labelStyle: TextStyle(
                    //                          color: ColorsConstData.appBaseColor,
                    //                        ),
                    //                        focusedBorder: UnderlineInputBorder(
                    //                          borderSide: BorderSide(
                    //                              color:
                    //                              ColorsConstData.appBaseColor),
                    //                        ),
                    //                      ),
                    //                      items: _items,
                    //                      onChanged: (val) => print(val),
                    //                      onSaved: (val) => print(val),
                    //                    ),
                    //                  ),
                    //                  Padding(
                    //                    padding: const EdgeInsets.symmetric(
                    //                        horizontal: 10, vertical: 8),
                    //                    child: TextFormField(
                    //                      decoration: InputDecoration(
                    //                        border: UnderlineInputBorder(),
                    //                        labelText: 'Anniversary:',
                    //                        hintText: 'Enter anniversary date',
                    //                        labelStyle: TextStyle(
                    //                          color: ColorsConstData.appBaseColor,
                    //                        ),
                    //                        focusedBorder: UnderlineInputBorder(
                    //                          borderSide: BorderSide(
                    //                            color: ColorsConstData.appBaseColor,
                    //                          ),
                    //                        ),
                    //                      ),
                    //                    ),
                    //                  ),
                    //                  Padding(
                    //                    padding: const EdgeInsets.symmetric(
                    //                        horizontal: 10, vertical: 8),
                    //                    child: TextFormField(
                    //                      decoration: InputDecoration(
                    //                        border: UnderlineInputBorder(),
                    //                        labelText: 'Address:',
                    //                        hintText: 'Enter your address',
                    //                        labelStyle: TextStyle(
                    //                          color: ColorsConstData.appBaseColor,
                    //                        ),
                    //                        focusedBorder: UnderlineInputBorder(
                    //                          borderSide: BorderSide(
                    //                            color: ColorsConstData.appBaseColor,
                    //                          ),
                    //                        ),
                    //                      ),
                    //                    ),
                    //                  ),
                    //                  Padding(
                    //                    padding: const EdgeInsets.symmetric(
                    //                        horizontal: 10, vertical: 8),
                    //                    child: TextFormField(
                    //                      decoration: InputDecoration(
                    //                        border: UnderlineInputBorder(),
                    //                        labelText: 'Adhaar Card:',
                    //                        hintText: 'Enter your adhaar no.',
                    //                        labelStyle: TextStyle(
                    //                          color: ColorsConstData.appBaseColor,
                    //                        ),
                    //                        focusedBorder: UnderlineInputBorder(
                    //                          borderSide: BorderSide(
                    //                            color: ColorsConstData.appBaseColor,
                    //                          ),
                    //                        ),
                    //                      ),
                    //                    ),
                    //                  ),
                    //                  Padding(
                    //                    padding: const EdgeInsets.symmetric(
                    //                        horizontal: 10, vertical: 8),
                    //                    child: TextFormField(
                    //                      decoration: InputDecoration(
                    //                        border: UnderlineInputBorder(),
                    //                        labelText: 'T-Shirt Size:',
                    //                        hintText: 'Enter your t-shirt size',
                    //                        labelStyle: TextStyle(
                    //                          color: ColorsConstData.appBaseColor,
                    //                        ),
                    //                        focusedBorder: UnderlineInputBorder(
                    //                          borderSide: BorderSide(
                    //                            color: ColorsConstData.appBaseColor,
                    //                          ),
                    //                        ),
                    //                      ),
                    //                    ),
                    //                  ),
                    //                  Padding(
                    //                    padding: const EdgeInsets.symmetric(
                    //                        horizontal: 10, vertical: 8),
                    //                    child: TextFormField(
                    //                      decoration: InputDecoration(
                    //                        border: UnderlineInputBorder(),
                    //                        labelText: 'Instagram ID:',
                    //                        hintText: 'Enter your ID',
                    //                        labelStyle: TextStyle(
                    //                          color: ColorsConstData.appBaseColor,
                    //                        ),
                    //                        focusedBorder: UnderlineInputBorder(
                    //                          borderSide: BorderSide(
                    //                            color: ColorsConstData.appBaseColor,
                    //                          ),
                    //                        ),
                    //                      ),
                    //                    ),
                    //                  ),
                    //                  Padding(
                    //                    padding: const EdgeInsets.symmetric(
                    //                        horizontal: 10, vertical: 8),
                    //                    child: TextFormField(
                    //                      decoration: InputDecoration(
                    //                        border: UnderlineInputBorder(),
                    //                        labelText: 'Facebook ID:',
                    //                        hintText: 'Enter your ID',
                    //                        labelStyle: TextStyle(
                    //                          color: ColorsConstData.appBaseColor,
                    //                        ),
                    //                        focusedBorder: UnderlineInputBorder(
                    //                          borderSide: BorderSide(
                    //                            color: ColorsConstData.appBaseColor,
                    //                          ),
                    //                        ),
                    //                      ),
                    //                    ),
                    //                  ),
                    //                  Padding(
                    //                    padding: const EdgeInsets.symmetric(
                    //                        horizontal: 10, vertical: 8),
                    //                    child: TextFormField(
                    //                      decoration: InputDecoration(
                    //                        border: UnderlineInputBorder(),
                    //                        labelText: 'Phone No.:',
                    //                        hintText: 'Enter your mobile no.',
                    //                        labelStyle: TextStyle(
                    //                          color: ColorsConstData.appBaseColor,
                    //                        ),
                    //                        focusedBorder: UnderlineInputBorder(
                    //                          borderSide: BorderSide(
                    //                            color: ColorsConstData.appBaseColor,
                    //                          ),
                    //                        ),
                    //                      ),
                    //                    ),
                    //                  ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void bottomSelected() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 180,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    getLogoImagePicker(ImageSource.gallery).whenComplate(() {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: ColorsConstData.appBaseColor
                      ),
                        ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/gallary.png",
                            width: 50, height: 60),
                        Text(
                          "Gallary",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getLogoImagePicker(ImageSource.camera).whenComplate(() {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: ColorsConstData.appBaseColor
                        ),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/camera.png",
                            width: 50, height: 60),
                        Text(
                          "Camera",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
