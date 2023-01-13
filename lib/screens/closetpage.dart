import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_iot/common/common.dart';
import 'package:smart_iot/model/clothes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smart_iot/widget/closetList.dart';

class ClosetPage extends StatefulWidget {
  const ClosetPage({super.key});

  @override
  State<ClosetPage> createState() => _ClosetPageState();
}

class _ClosetPageState extends State<ClosetPage> {
  final List<Clothes> clotheslist = <Clothes>[];
  int count = 0;
  bool close = false;

  @override
  void initState() {
    getrequest();
    super.initState();
  }

  void getrequest() async {
    String url = 'http://43.200.169.3:8888/get_items';

    http.Response response = await http.get(Uri.parse(url));
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    print(parsingData);
    if (response.statusCode == 200) {
      if (parsingData["success"]) {
        count = parsingData['count'];
        for (int i = 0; i < count; i++) {
          clotheslist.add(Clothes(parsingData['data'][i]['image_path'],
              parsingData['data'][i]['cloth_name']));
        }
        setState(() {
          close = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: CommonColor.purple,
      body: close
          ? SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 21.w, top: 30.h, bottom: 20.h),
                      child: Text(
                        "현재 옷 목록",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: 'GmarketM',
                            color: Colors.black),
                      ),
                    ),
                    ClosetList(clothesList: clotheslist)
                  ]),
          )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [SpinKitHourGlass(color: CommonColor.purple)],
            ),
    );
  }
}
