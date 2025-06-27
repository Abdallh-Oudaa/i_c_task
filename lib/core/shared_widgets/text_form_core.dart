import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_c_task/core/constants/colors_core.dart';
import 'package:i_c_task/core/constants/size_box_core.dart';
import 'package:i_c_task/core/constants/text_style_core.dart';

class TextFormCore extends StatelessWidget {
  final String hintText;
  final String? Function(String?) validation;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;
  final bool isObscure;
  final TextInputType keyboardType;
  final String addressText;
  const TextFormCore({
    required this.hintText,
    required this.textEditingController,
    required this.validation,
    required this.keyboardType,
    required this.addressText,
    this.suffixIcon,
    this.isObscure = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(addressText, style: TextStyleCore.font18BlackWeight400),
          verticalSize(10),
          TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsCore.brownRosyColor,
                  width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsCore.salmonColor,
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              isDense: true,
              hintStyle: TextStyleCore.font18BlackWeight400.copyWith(
                color: Colors.blueGrey,
              ),
              hintText: hintText,
              suffix: suffixIcon,
              filled: true,
              fillColor: ColorsCore.salmonColor,
              errorStyle: TextStyleCore.font18BlackWeight400.copyWith(
                color: Colors.red,
              ),
            ),
            style: TextStyleCore.font18BlackWeight400.copyWith(
              color: Colors.black,
            ),
            controller: textEditingController,
            obscureText: isObscure,
            validator: validation,
            keyboardType: keyboardType,
          ),
        ],
      ),
    );
  }
}
