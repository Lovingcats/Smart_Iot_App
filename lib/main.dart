import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:smart_iot/common/common.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_iot/screens/camerpage.dart';
import 'package:smart_iot/screens/closetpage.dart';
import 'package:smart_iot/screens/loading.dart';
import 'package:animations/animations.dart';
import 'package:smart_iot/screens/recommend.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return ScreenUtilInit(
        //screenutil 라이브러리 (뒤에 .h, .w, .r, .sp등등 크기를 반응형으로 만들어줌)
        designSize: const Size(360, 800), // 어떤 사이즈를 기준으로 만들것인가
        builder: (BuildContext context, Widget? child) => const MaterialApp(
            title: '트랜디 옷장',
            debugShowCheckedModeBanner: false,
            home: MyPage() // widget/bottombar.dart 코드
            ));
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool firstBtn = true;
  bool secondBtn = false;
  bool thirdBtn = false;
  double pictureOpacity1 = 1;
  double pictureOpacity2 = 0;
  double pictureOpacity3 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: double.infinity,
              height: double.infinity,
              color: firstBtn
                  ? CommonColor.blue
                  : secondBtn
                      ? CommonColor.pink
                      : CommonColor.purple,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 21.h),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => Recommend(firstBtn: firstBtn, secondBtn: secondBtn, thirdBtn: thirdBtn),
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: const BoxDecoration(
                        color: Color(0xff2D385F),
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 4.h),
                            child: Icon(
                              Icons.checkroom_outlined,
                              color: Colors.white,
                              size: 32.h,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.h),
              child: AnimatedOpacity(
                opacity: pictureOpacity1,
                duration: const Duration(milliseconds: 400),
                child: Container(
                    width: double.infinity,
                    height: 450.h,
                    child: Lottie.asset('assets/question.json',
                        fit: BoxFit.contain)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.h),
              child: AnimatedOpacity(
                opacity: pictureOpacity2,
                duration: const Duration(milliseconds: 400),
                child: Container(
                    width: double.infinity,
                    height: 450.h,
                    child: Lottie.asset('assets/camera.json',
                        fit: BoxFit.contain)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.h),
              child: AnimatedOpacity(
                opacity: pictureOpacity3,
                duration: const Duration(milliseconds: 400),
                child: Container(
                    width: double.infinity,
                    height: 450.h,
                    child: Lottie.asset('assets/closet.json',
                        fit: BoxFit.contain)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 525.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LET'S FIND COOL FASHION",
                    style: TextStyle(
                        fontFamily: 'Gmarket',
                        color: Colors.black,
                        fontSize: 16.sp),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 580.h, left: 30.w, right: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        firstBtn = true;
                        secondBtn = false;
                        thirdBtn = false;
                        pictureOpacity1 = 1;
                        pictureOpacity2 = 0;
                        pictureOpacity3 = 0;
                      });
                    },
                    child: AnimatedContainer(
                        decoration: BoxDecoration(
                            color: firstBtn
                                ? const Color(0xff32417F)
                                : const Color(0xffE9E6D7),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r))),
                        duration: const Duration(milliseconds: 400),
                        height: 100.h,
                        width: 85.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              firstBtn
                                  ? "assets/random.png"
                                  : secondBtn
                                      ? "assets/randomR.png"
                                      : "assets/randomP.png",
                              scale: 1.3,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              "Random",
                              style: TextStyle(
                                fontFamily: 'GmarketM',
                                fontSize: 12.sp,
                                color: firstBtn
                                    ? Colors.white
                                    : secondBtn
                                        ? const Color(0xffDC5353)
                                        : const Color(0xff9A49B7),
                              ),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        firstBtn = false;
                        secondBtn = true;
                        thirdBtn = false;
                        pictureOpacity1 = 0;
                        pictureOpacity2 = 1;
                        pictureOpacity3 = 0;
                      });
                    },
                    child: AnimatedContainer(
                        decoration: BoxDecoration(
                            color: secondBtn
                                ? const Color(0xffDC5353)
                                : const Color(0xffE9E6D7),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r))),
                        duration: const Duration(milliseconds: 400),
                        height: 100.h,
                        width: 85.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt,
                                size: 50.h,
                                color: firstBtn
                                    ? const Color(0xff32417E)
                                    : secondBtn
                                        ? Colors.white
                                        : const Color(0xff9A49B7)),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Camera",
                              style: TextStyle(
                                fontFamily: 'GmarketM',
                                fontSize: 12.sp,
                                color: firstBtn
                                    ? const Color(0xff32417E)
                                    : secondBtn
                                        ? Colors.white
                                        : const Color(0xff9A49B7),
                              ),
                            ),
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        firstBtn = false;
                        secondBtn = false;
                        thirdBtn = true;
                        pictureOpacity1 = 0;
                        pictureOpacity2 = 0;
                        pictureOpacity3 = 1;
                      });
                    },
                    child: AnimatedContainer(
                        decoration: BoxDecoration(
                            color: thirdBtn
                                ? const Color(0xff9A49B7)
                                : const Color(0xffE9E6D7),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r))),
                        duration: const Duration(milliseconds: 400),
                        height: 100.h,
                        width: 85.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              firstBtn
                                  ? "assets/ClosetB.png"
                                  : secondBtn
                                      ? "assets/ClosetR.png"
                                      : "assets/ClosetW.png",
                              scale: 1.3,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              "Closet",
                              style: TextStyle(
                                fontFamily: 'GmarketM',
                                fontSize: 12.sp,
                                color: firstBtn
                                    ? const Color(0xff32417E)
                                    : secondBtn
                                        ? const Color(0xffDC5353)
                                        : Colors.white,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 710.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
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
                      //  Navigator.push(context,
                      //      MaterialPageRoute(builder: (_) => Loading(firstBtn: firstBtn, secondBtn: secondBtn, thirdBtn: thirdBtn,)));
                      if (firstBtn) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => Loading(
                              firstBtn: firstBtn,
                              secondBtn: secondBtn,
                              thirdBtn: thirdBtn,
                            ),
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      } else if (secondBtn) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const CameraPage(),
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const ClosetPage(),
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => const ClosetPage())
                        //     );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(140.w, 50.h),
                      backgroundColor: const Color(0xff32417F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.r), // <-- Radius
                      ),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Gmarket',
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
