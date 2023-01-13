import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_iot/common/common.dart';
import 'package:http/http.dart' as http;
import 'package:smart_iot/screens/randomcomplete.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Loading extends StatefulWidget {
  final bool firstBtn;
  final bool secondBtn;
  final bool thirdBtn;
  const Loading(
      {super.key,
      required this.firstBtn,
      required this.secondBtn,
      required this.thirdBtn});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String imageurl = "";
  String imagename = "";
  bool close = false;
  int count = 0;
  @override
  void initState() {
    getrequest();
    super.initState();

  }

  void getrequest1(int random) async {
    Random random = Random();
    String url = 'http://43.200.169.3:8888/random?rnum=$random';

    http.Response response = await http.get(Uri.parse(url));
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    print(parsingData);
  }

  void getrequest() async {
    Random random = Random();
    String url = 'http://43.200.169.3:8888/get_items';

    http.Response response = await http.get(Uri.parse(url));
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    print(parsingData);
    if (response.statusCode == 200) {
      if (parsingData["success"]) {
        print(parsingData);
        count = parsingData['count'];
        int randomNumber = random.nextInt(count) + 1;
        getrequest1(randomNumber);
        for (int i = 0; i < count; i++) {
          if (parsingData['data'][i]['id'] == randomNumber) {
            imageurl = parsingData['data'][i]['image_path'];
            imagename = parsingData['data'][i]['cloth_name'];
          }
        }
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RandomComplete(imgUrl: imageurl, name: imagename, firstBtn: widget.firstBtn, secondBtn: widget.secondBtn, thirdBtn: widget.thirdBtn,)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.firstBtn
          ? CommonColor.blue
          : widget.secondBtn
              ? CommonColor.pink
              : CommonColor.purple,
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitHourGlass(
                color: widget.firstBtn
                    ? const Color(0xff32417E)
                    : widget.secondBtn
                        ? const Color(0xffDC5353)
                        : const Color(0xff9A49B7))
          ],
        ),
      ),
    );
  }
}
