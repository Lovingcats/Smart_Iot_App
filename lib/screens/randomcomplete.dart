import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_iot/common/common.dart';
import 'package:smart_iot/main.dart';
import 'package:smart_iot/screens/loading.dart';

class RandomComplete extends StatefulWidget {
  final String imgUrl;
  final String name;
  final bool firstBtn;
  final bool secondBtn;
  final bool thirdBtn;
  const RandomComplete(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.firstBtn,
      required this.secondBtn,
      required this.thirdBtn});

  @override
  State<RandomComplete> createState() => _RandomCompleteState();
}

class _RandomCompleteState extends State<RandomComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: widget.firstBtn
          ? CommonColor.blue
          : widget.secondBtn
              ? CommonColor.pink
              : CommonColor.purple,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18.w, top: 32.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "오늘 입을 옷",
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
                      Image.network(
                        widget.imgUrl,
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              widget.name,
              style: TextStyle(
                  fontSize: 25.sp, color: Colors.black, fontFamily: 'GmarketM'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 120.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const MyPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(140.w, 50.h),
                      backgroundColor: const Color(0xffE9E6D7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.r), // <-- Radius
                      ),
                    ),
                    child: Text(
                      "Back",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Gmarket',
                          color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Loading(
                                      firstBtn: widget.firstBtn,
                                      secondBtn: widget.secondBtn,
                                      thirdBtn: widget.thirdBtn,
                                    )));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(140.w, 50.h),
                        backgroundColor: const Color(0xff32417F),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(18.r), // <-- Radius
                        ),
                      ),
                      child: Icon(
                        Icons.change_circle_outlined,
                        size: 35.h,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
