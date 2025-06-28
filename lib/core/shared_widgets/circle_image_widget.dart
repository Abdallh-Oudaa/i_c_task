import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleImageWidget extends StatelessWidget {
  final File imagePath;
  const CircleImageWidget({super.key,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 150.h,
      width: 150.w,
      child: CircleAvatar(
        backgroundImage: FileImage(imagePath)
      ),
    );
  }
}
