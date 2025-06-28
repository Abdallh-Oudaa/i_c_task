import 'package:flutter/material.dart';

import 'package:i_c_task/core/constants/text_style_core.dart';



class EditAndOrdersScreenButton extends StatelessWidget {
  final String name;
  final IconData icon;
  const EditAndOrdersScreenButton({super.key,required this.name,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
     Icon(icon),
      Text(name,style: TextStyleCore.font18BlackWeight400.copyWith(fontSize: 15,color: Colors.black),)
    ],);
  }
}
