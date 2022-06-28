import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/APIs/api.dart';
import 'package:rotaract_app/Screen/app_bar/app_bar_data.dart';
import 'package:rotaract_app/constant/constant.dart';

import '../../../provider/providerNotifier.dart';

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rotaract_app/constant/constant.dart';

import 'package:url_launcher/url_launcher.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({ Key? key }) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {

  Timer? timer;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context,listen: false);
    storagePermission();
    providerNotifier.getAllDownloadNotifier().whenComplete(() {
      timer =  Timer(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  storagePermission() async {
    PermissionStatus permissionStatus = await Permission.storage.request();
    if (permissionStatus == PermissionStatus.granted) {
      Fluttertoast.showToast(msg: "Storage Permisssion Access Successfully");
    } else if (permissionStatus == PermissionStatus.denied) {
      Fluttertoast.showToast(msg: "Storage Permisssion denined");
      storagePermission();

    }
    }
  static var httpClient = new HttpClient();
  bool downloading = false;
  var progressString = "";
/*
  Future<void> _downloadFile(String url) async {
    Dio dio = Dio();
    try {
      var dir = await getExternalStorageDirectory();
      print("${dir.path}/${url.substring(19)}");
      await dio.download(
          Api.baseUrl+"${url.replaceAll(" ", "%20")}",
          "${dir.path}/${url.substring(19)}", onReceiveProgress: (rec, total) {
        print("Rec: $rec , Total: $total");
        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      downloading = false;
      progressString = "";
    });
  }*/


  Future openFile(url) async {
    print("openFile call 000000");
    PermissionStatus permissionStatus =
    await Permission.storage.request();
    if (permissionStatus == PermissionStatus.granted) {
      var name = url.toString().split("/").last;
      final file = await downloadFile(url,name);
      print("openFile call 111111 file $file");

      if(file == null) {
        return ;
      }
      OpenFile.open(file.path);
      Fluttertoast.showToast(
          msg: "Storage Permisssion Access Successfully");
    } else if (permissionStatus == PermissionStatus.denied) {
      Fluttertoast.showToast(msg: "Storage Permisssion denined");
    }

  }

  Future<File?> downloadFile(String url, name)async {
    print("downloadFile call 000000");
    final appStrorage = await getExternalStorageDirectory(); ///await ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_DOWNLOADS);
    print("downloadFile call 1111111 $appStrorage");
    final pathData =  appStrorage!.path.split("/Android")[0];
    final file = File("${pathData}/Download/$name");
    print("downloadFile call 22222 $file");
    try {
      print("downloadFile call try under");
      final response = await Dio().get(url, onReceiveProgress: showDownloadProgress,options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0
      ));
      print("downloadFile call truey 0000000 ${response.data}");

      final raf = file.openSync(mode: FileMode.write);
      print("downloadFile call truey 111111 ${raf}");
      raf.writeFromSync(response.data);
      print("downloadFile call truey 2222222222 ");
      await raf.close();

      return file;
    } catch (e) {
      print("downloadFile call cathc the eroe $e");
      return null;
    }
  }

  void showDownloadProgress (received, total){
    if (total != -1){
      print ((received/ total * 100). toStringAsFixed(0) + "%");}
  }


  @override
  Widget build(BuildContext context) {
    ProviderNotifier providerNotifier = Provider.of<ProviderNotifier>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarData(
          appBarTitle: "Download",
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: isLoading == true ?
      Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
      :
      providerNotifier.getDownloadList.isEmpty ?
          Container(
            child: Center(
              child: Text("No Data"),
            ),
          )
          : ListView.builder(
        padding: EdgeInsets.only(top: 5),
        shrinkWrap: true,
        itemCount: providerNotifier.getDownloadList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MemberDetails()));
              launch(Api.baseUrl + "${providerNotifier.getDownloadList[index]!.files}"
                  .replaceAll(" ", "%20"));
            },
            child: Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                  //side: BorderSide(color: cnst.appcolor)),
                  side: BorderSide(width: 0.50, color: ColorsConstData.appBaseColor),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children:<Widget>[
                          Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/icon_pdf.png',
                                height: size.height*0.05,
                                width: size.width*0.08,
                                fit: BoxFit.fill,
                              ),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(providerNotifier.getDownloadList[index]!.title == null ? "":providerNotifier.getDownloadList[index]!.title,
                                            style: TextStyle(
                                                color: ColorsConstData.appBaseColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  )),
                              /*GestureDetector(
                          onTap: () {
                            _downloadFile(widget.download["FilePath"]);
                          },
                          child: ClipOval(
                            child: Image.asset(
                              'images/icon_download1.png',
                              height: 45,
                              width: 45,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),*/
                              /*downloading
                            ? Container(
                          height: 30,
                          width: 45,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                      ),
                                      Text(
                                        'Downloading File: $progressString',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  _downloadFile(widget.download["FilePath"]);
                                },
                                child: ClipOval(
                                  child: Image.asset(
                                    'images/icon_download1.png',
                                    height: 45,
                                    width: 45,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),*/
                              Platform.isAndroid
                                  ? GestureDetector(
                                onTap: () {
                                  print("print pdf Url${Api.baseUrl}${providerNotifier.getDownloadList[index]!.files.toString()}");
                                  openFile(
                                    "${Api.baseUrl}${providerNotifier.getDownloadList[index]!.files.toString()}",);
                                },
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/icon_download1.png',
                                    height: size.height*0.06,
                                    width: size.width * 0.12,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                                  : Container(),
                            ],
                          ),
                        ],
                      ),
                      Platform.isAndroid
                          ? downloading
                          ? Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Container(
                            height: 45.0,
                            width: 45.0,
                            child: Card(
                              color: Colors.black,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Downloading File: $progressString',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                          : Container()
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          );
          // return Padding(
          //   padding: const EdgeInsets.only(top: 8,right: 8,left: 8),
          //   child: Card(
          //     shape: RoundedRectangleBorder(
          //       side: BorderSide(color: ColorsConstData.appBaseColor),
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: ListTile(
          //       leading: SizedBox(
          //         height: size.height*0.05,
          //         width: size.width*0.08,
          //         child: Image.asset('assets/images/pdf.png'),
          //       ),
          //       title: Text('Event Name',
          //         style: TextStyle(
          //           fontSize: 15,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       trailing: IconButton(
          //         onPressed: (){
          //
          //         },
          //         icon: Icon(Icons.download_rounded),
          //         iconSize: 32,
          //         color: ColorsConstData.appBaseColor,
          //     ),
          //   ),
          // ));
        },
      ),
      
    );
  }
}