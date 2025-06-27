

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_c_task/core/constants/colors_core.dart';
import 'package:i_c_task/core/constants/text_style_core.dart';


class ButtonSection extends StatelessWidget{
  final String iconText;
  final void Function() onPressedFunc;
  const ButtonSection({super.key,required this.iconText,required this.onPressedFunc});

  @override
  Widget build(BuildContext context) {
    return    Container(
      margin: EdgeInsets.symmetric(horizontal: 40.w),
      width: double.infinity,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                  ColorsCore.salmonColor),
              shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius:
                      BorderRadiusGeometry.circular(
                          15.r)))),
          onPressed: onPressedFunc,
          child: Text(
            iconText,
            style: TextStyleCore.font16whiteWeight600,
          )),
    );
  }

}