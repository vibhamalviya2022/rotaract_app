import 'dart:io';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:rotaract_app/constant/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {

  final isEmptyError = false;

  TextEditingController commentController = TextEditingController();

  String text = "Niik";
  String subject = "I am boy";
  List<dynamic> comment=[];
  List<File> images = [];
  Future _imageFromGallery(int index) async {
    // XFile? image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      // images.insert(index, File(image!.path));
      //images.removeAt(index + 1);
    });
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    showModalBottomSheet<void>(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, snapshot) {
            return Container(
              height: MediaQuery.of(context).size.height*0.50,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          hintText: 'Write a comment',
                          prefixIcon: Icon(
                            Icons.comment,
                            color: ColorsConstData.appBaseColor,
                          ),

                          suffixIcon: TextButton(
                            onPressed: (){
                              snapshot(() {
                                count++;
                                comment.add(commentController.text);
                                print("This is comment: "+comment.toString());
                                commentController.clear();
                              });

                            },
                            child: Text(
                              'POST',
                              style: TextStyle(
                                color: ColorsConstData.appBaseColor,
                              ),
                            ),
                          ),
                        ),
                        controller: commentController,
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 20,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    ListView.builder(
                      itemCount: count,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/man.png'),
                            backgroundColor: Colors.white,

                          ),
                          title: comment.length>0?Text(
                            comment[index].toString(),
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ):Text(""),
                          subtitle: Text(
                            'John Sins',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: (){

                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        );
      },
    );
    return !isLiked;
  }

  var value = 0;
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsConstData.appBaseColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return SimpleDialog(
                alignment: Alignment.bottomCenter,
                title: const Text(
                  'What do you want to choose!',
                  style: TextStyle(
                    color: ColorsConstData.appBaseColor,
                  ),
                ),
                children: [
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  SimpleDialogOption(
                    child: const Text(
                      'Select from camera',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    onPressed: () {
                      // getCamera();
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SimpleDialogOption(
                    child: const Text(
                      'Select from gallery',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    onPressed: () {
                      _imageFromGallery(0);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add_rounded,
          size: 45,
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: images.length,
        itemBuilder: (context, index){
          return Column(
            children: [
              ListTile(
                leading: InkWell(
                  onTap: (){
                    isEmptyError;
                    Future.delayed(const Duration(milliseconds: 300), () => isEmptyError);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    curve: Curves.linearToEaseOut,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                      border: new Border.all(
                        color: ColorsConstData.appBaseColor,
                        width: 2.0,
                        style: isEmptyError ? BorderStyle.none : BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/man.png'),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  'Rachel Green',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '4d',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  onPressed: (){
                    showModalBottomSheet(
                      barrierColor: Colors.grey.withOpacity(0.6),
                      backgroundColor: Colors.white,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      builder: (context) {
                        return Wrap(
                          children: [
                            ListTile(
                              leading: TextButton.icon(
                                icon: Icon(Icons.share,color: ColorsConstData.appBaseColor),
                                onPressed: (){
                                  setState((){
                                    Share.share(
                                      text,
                                      subject: subject,
                                      // sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                                    );
                                  });
                                },
                                label: Text('  Share',style: TextStyle(color: Colors.black),),
                              ),
                            ),
                            ListTile(
                              leading: TextButton.icon(
                                icon: Icon(Icons.link,color: ColorsConstData.appBaseColor),
                                onPressed: (){},
                                label: Text('  Get link',style: TextStyle(color: Colors.black),),
                              ),
                            ),
                            ListTile(
                              leading: TextButton.icon(
                                icon: Icon(Icons.edit,color: ColorsConstData.appBaseColor),
                                onPressed: (){},
                                label: Text('  Edit',style: TextStyle(color: Colors.black),),
                              ),
                            ),
                            ListTile(
                              leading: TextButton.icon(
                                icon: Icon(Icons.delete,color: ColorsConstData.appBaseColor),
                                onPressed: (){
                                  setState(() {
                                    images.removeAt(index);
                                    print(index);
                                    Navigator.pop(context);
                                  });
                                },
                                label: Text('  Delete collection',style: TextStyle(color: Colors.black),),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.45,
                width: MediaQuery.of(context).size.width*0.94,
                child: (images != index)
                    ? Image.file(images[index],fit: BoxFit.fill)
                    : Image.asset('assets/images/sky.png',fit: BoxFit.fill),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12,left: 7,top: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        LikeButton(
                          circleColor:
                          CircleColor(start: ColorsConstData.appBaseColor, end: Colors.grey),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: ColorsConstData.appBaseColor,
                            dotSecondaryColor: Colors.grey,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              isLiked ?
                              Icons.favorite : Icons.favorite_border_outlined,
                              color: isLiked ? ColorsConstData.appBaseColor : Colors.black,
                              size: 25,
                            );
                          },
                          likeCount: 0,
                          countBuilder: (int? count, bool isLiked, String text) {
                            var color = isLiked ? Colors.black : Colors.black;
                            Widget result;
                            if (count == -1) {
                              result = Text(
                                "love",
                                style: TextStyle(color: color),
                              );
                            } else
                              result = Text(
                                text,
                                style: TextStyle(color: color),
                              );
                            return result;
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        LikeButton(
                          onTap: onLikeButtonTapped,
                          circleColor:
                          CircleColor(start: ColorsConstData.appBaseColor, end: Colors.grey),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: ColorsConstData.appBaseColor,
                            dotSecondaryColor: Colors.grey,
                          ),
                          likeBuilder: (bool isComment) {
                            return Icon(
                              Icons.comment_outlined,
                              color: Colors.black,
                              size: 25,
                            );
                          },
                          likeCount: count,
                          countBuilder: (int? count, bool isComment, String text) {
                            return Text(
                              count == count ? 'comment' : text,
                              style: const TextStyle(color: Colors.black),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        LikeButton(
                          circleColor:
                          CircleColor(start: ColorsConstData.appBaseColor, end: Colors.grey),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: ColorsConstData.appBaseColor,
                            dotSecondaryColor: Colors.grey,
                          ),
                          likeBuilder: (bool isSaved) {
                            return Icon(
                              isSaved ?
                              Icons.bookmark : Icons.bookmark_border_rounded,
                              color: isSaved ? ColorsConstData.appBaseColor : Colors.black,
                              size: 25,
                            );
                          },
                          likeCount: 0,
                          countBuilder: (int? counter, bool isSaved, String text) {
                            var color = isSaved ? Colors.black : Colors.black;
                            Widget result;
                            if (count == count) {
                              result = Text(
                                "Save",
                                style: TextStyle(color: color),
                              );
                            } else
                              result = Text(
                                text,
                                style: TextStyle(color: color),
                              );
                            return result;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rachel Green ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Taking pictures is savoring life intensely, \nevery hundredth of a second.',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
            ],
          );
        },
      ),
    );
  }
}