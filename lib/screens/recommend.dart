import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_iot/common/common.dart';
import 'package:smart_iot/screens/webview.dart';

class Recommend extends StatefulWidget {
  final bool firstBtn;
  final bool secondBtn;
  final bool thirdBtn;
  const Recommend(
      {super.key,
      required this.firstBtn,
      required this.secondBtn,
      required this.thirdBtn});

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 30.h, bottom: 35.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "요즘 트렌드 옷이예요!",
                    style: TextStyle(
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const WebView(
                          url:
                              "https://www.musinsa.com/app/goods/2149254?loc=goods_rank"),
                      transitionDuration: const Duration(milliseconds: 500),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 200.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black, width: 0.5.w)),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 190.h,
                            width: 125.w,
                            child: Image.asset(
                              "assets/first.jpg",
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: EdgeInsets.only(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 25.w),
                                child: Text(
                                  "베이식 긴팔 티셔츠",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontFamily: 'Gmarket',
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "무신사 스텐다드",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontFamily: 'GmarketM',
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 102.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 114.w),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 30.h,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const WebView(
                          url:
                              "https://www.musinsa.com/app/goods/2758354?loc=goods_rank"),
                      transitionDuration: const Duration(milliseconds: 500),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 200.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black, width: 0.5.w)),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 190.h,
                            width: 125.w,
                            child: Image.asset(
                              "assets/second.jpg",
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 25.w),
                                child: Text(
                                  "T-Logo 후드티",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontFamily: 'Gmarket',
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "디스이즈네버댓",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontFamily: 'GmarketM',
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 102.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 114.w),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 30.h,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const WebView(
                          url:
                              "https://www.musinsa.com/app/goods/2396645?loc=goods_rank"),
                      transitionDuration: const Duration(milliseconds: 500),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 200.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black, width: 0.5.w)),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 190.h,
                            width: 125.w,
                            child: Image.asset(
                              "assets/third.jpg",
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 25.w),
                                child: Text(
                                  "워셔블 하찌 니트",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontFamily: 'Gmarket',
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "수아레",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontFamily: 'GmarketM',
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 102.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 114.w),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 30.h,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
