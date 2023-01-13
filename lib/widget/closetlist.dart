import 'package:flutter/material.dart';
import 'package:smart_iot/model/clothes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ClosetList extends StatefulWidget {
  final List<Clothes> clothesList;
  const ClosetList({super.key, required this.clothesList});

  @override
  State<ClosetList> createState() => _ClosetListState();
}

class _ClosetListState extends State<ClosetList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimationLimiter(
        child: Column(
          children: makeClothes(context, widget.clothesList),
        ),
      ),
    );
  }
}

List<Widget> makeClothes(BuildContext context, List<Clothes> clothes) {
  Animation _animation;
  AnimationController _animationController;

  List<Widget> results = [];
  bool odd = clothes.length % 2 == 1 ? true : false;
  for (var i = 0; i < clothes.length; i = i + 2) {
    results.add(Padding(
      padding: EdgeInsets.only(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: SizedBox(
              width: 180.w,
              height: 250.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 180.w,
                      height: 200.h,
                      padding: EdgeInsets.only(top: 8.h, left: 8.w, right: 8.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      child: Image.network(
                        clothes[i].url,
                        fit: BoxFit.contain,
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 7.h),
                    child: Text(
                      clothes[i].name,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GmarketM',
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          odd
              ? //index가 홀수고
              i == clothes.length - 1
                  ? //마지막 index면
                  Text("") //출력 x
                  : InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 180.w,
                        height: 250.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 180.w,
                                height: 200.h,
                                padding: EdgeInsets.only(
                                    top: 8.h, left: 8.w, right: 8.w),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.r))),
                                child: Image.network(
                                  clothes[i + 1].url,
                                  fit: BoxFit.contain,
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 7.h),
                              child: Text(
                                clothes[i + 1].name,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'GmarketM',
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
              : InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 180.w,
                    height: 250.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 180.w,
                            height: 200.h,
                            padding: EdgeInsets.only(
                                top: 8.h, left: 8.w, right: 8.w),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r))),
                            child: Image.network(
                              clothes[i + 1].url,
                              fit: BoxFit.contain,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 7.h),
                          child: Text(
                            clothes[i + 1].name,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'GmarketM',
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    ));
  }
  return results;
}
