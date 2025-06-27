import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ShowTextAndIconWidget extends StatelessWidget {

  final Color containerColor;
  final int? height;
  final List<Widget> widgets;

  const ShowTextAndIconWidget({
    super.key,

    required this.containerColor,
    required this.widgets,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widgets
      ),
    );
  }
}
