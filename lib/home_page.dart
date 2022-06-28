import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:rotaract_app/Screen/bottom_bar_page.dart';
import 'package:rotaract_app/Screen/drawer_pages/drawer_navigation_screen.dart';
import 'package:rotaract_app/Screen/manage_profile_page/profile_screen.dart';
import 'package:rotaract_app/constant/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _scanBarcode = 'Unknown';
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerNavigationScreen(),
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Container(
              decoration:  BoxDecoration(
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
                centerTitle: true,
                title: Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                        },
                                            child: Image.asset(
                          'assets/images/user (1).png',
                          height: 30,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text('Rotarect'),
                      SizedBox(width: 100,),
                      GestureDetector(
                          onTap: () => scanQR(),
                        child: Image.asset(
                          'assets/icons/barcode.png',
                          height: 30,
                        ),
                      ),
                    ]),
                elevation: 0,
                 backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ),
        body:BottomBarPage() ,
      ),
    );
  }
}
