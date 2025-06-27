import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_c_task/core/constants/text_style_core.dart';



class NameAndIconWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  const NameAndIconWidget({super.key,required this.name,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
     Icon(icon),
      Text(name,style: TextStyleCore.font18BlackWeight400.copyWith(fontSize: 15,color: Colors.black),)
    ],);
  }
}
