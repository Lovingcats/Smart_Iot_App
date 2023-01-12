import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_iot/common/common.dart';

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
