import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:i_c_task/core/constants/colors_core.dart';


import 'package:i_c_task/routes.dart';

import '../../../core/constants/email_regex.dart';
import '../../../core/constants/text_style_core.dart';
import '../../../core/shared_widgets/circle_image_widget.dart';
import '../../../core/shared_widgets/text_form_core.dart';
import 'local_widgets/button_section.dart';

class EditProfile extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final  formKey = GlobalKey<FormState>();

  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile", style: TextStyleCore.font25SalmonBold),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: SizedBox(
            height: 400.h,

            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.w,

                    child: Stack(
                      children: [
                        CircleImageWidget(
                          imagePath: "assets/images/onboardingImage.jpg",
                        ),
                        Positioned(
                          top: 100.h,
                          left: 115.w,
                          child: Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              color: ColorsCore.salmonColor,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Icon(Icons.camera_alt_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormCore(
                    hintText: "click here to edit name",
                    textEditingController: nameController,
                    validation: (text) {
                      if (text!.trim().isEmpty) {
                        return "field is empty";
                      }

                      return null;
                    },
                    keyboardType: TextInputType.text,
                    addressText: "Full Name",
                  ),
                  TextFormCore(
                    hintText: "click here to change email",
                    textEditingController: emailController,
                    validation: (text) {
                      if (text!.trim().isEmpty) {
                        return "field is empty";
                      }
                      if (validateEmail(text) != null) {
                        return "syntax error";
                      }

                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    addressText: "Email",
                  ),
                  ButtonSection(iconText: "update profile", onPressedFunc: () {
                    if(formKey.currentState!.validate()){
                      Get.toNamed(AppRoutes.orderPage);
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
