import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_iot/common/common.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_iot/main.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  var image;
  var userImage;
  bool isImage = false;
  final _textcontroller = TextEditingController();

  void success() {
    Fluttertoast.showToast(
        msg: "등록이 완료되었습니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(5),
          child: SizedBox(
            height: 140.h,
            width: 60.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }

  void uploadImage(File file) async {
    print("object");
    var response;
    _onLoading();
    var dio = Dio();

    FormData formData = FormData.fromMap({
      "imageFile": await MultipartFile.fromFile(file.path, filename: "file"),
      "cloth_name": _textcontroller.text
    });
    response =
        await dio.post("http://43.200.169.3:8888/image_upload", data: formData);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (_) => const MyPage()));
    print(response.toString());
    success();
  }

  void namefail() {
    Fluttertoast.showToast(
        msg: "이름을 입력해주세요",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  void imagefail() {
    Fluttertoast.showToast(
        msg: "이미지를 넣어주세요",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.pink,
      appBar: null,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.w, top: 32.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "등록할 사진",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontFamily: 'GmarketM'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 10.h),
                  child: InkWell(
                    onTap: () async {
                      var picker = ImagePicker();
                      image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        setState(() {
                          userImage = File(image.path);
                          isImage = true;
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 480.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.grey.withOpacity(0.1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          isImage
                              ? Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: Image.file(
                                    userImage,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Text(
                                  "등록하려면 클릭해주세요",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontFamily: 'GmarketM',
                                      color: Colors.black),
                                )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 70.w, right: 70.w),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.w, color: Colors.black),
                      ),
                    ),
                    child: TextField(
                      controller: _textcontroller,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '옷의 이름을 입력해주세요',
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: InkWell(
                        onTap: () {
                          if (!isImage) {
                            imagefail();
                          } else if (_textcontroller.text.isEmpty) {
                            namefail();
                          } else {
                            _onLoading();
                            uploadImage(userImage);
                          }
                        },
                        child: Container(
                          width: 93.w,
                          height: 93.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Icon(
                            Icons.file_upload_outlined,
                            color: Colors.black,
                            size: 80.h,
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
