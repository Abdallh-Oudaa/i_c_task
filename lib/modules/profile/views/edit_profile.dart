

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:i_c_task/core/constants/colors_core.dart';
import 'package:i_c_task/core/constants/size_box_core.dart';
import 'package:i_c_task/core/shared_widgets/circle_image_widget.dart';
import 'package:i_c_task/modules/profile/conteroller/edit_profile_controller.dart';

import '../../../core/constants/email_regex.dart';
import '../../../core/constants/text_style_core.dart';

import '../../../core/shared_widgets/text_form_core.dart';
import 'local_widgets/button_section.dart';

class EditProfile extends StatelessWidget {
  final controller = Get.find<EditProfileController>();

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
        child: SizedBox(
          height: 400.h,

          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.w,

                    child: Stack(
                      children: [
                        SizedBox(
                          height: 150.h,
                          width: 150.w,
                          child: Obx(() {
                            if (controller.imageFile.value != null) {
                              return CircleImageWidget(
                                imagePath: controller.imageFile.value!,
                              );
                            } else {
                              return CircleAvatar(backgroundColor: Colors.grey);
                            }
                          }),
                        ),
                        Positioned(
                          top: 100.h,
                          left: 115.w,
                          child: InkWell(
                            onTap: () {
                              dialog(context);
                            },
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
                        ),
                      ],
                    ),
                  ),
                  TextFormCore(
                    hintText: "click here to edit name",
                    textEditingController: controller.nameController,
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
                    textEditingController: controller.emailController,
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
                  verticalSize(15),
                  ButtonSection(
                    iconText: "update profile",
                    onPressedFunc: () {
                      controller.updateUser();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future dialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 80.h,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final temp = await controller.cameraPicker();
                        if (temp != null) {
                          controller.imageFile.value = temp;
                        }
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: ColorsCore.terracottaColor,
                      ),
                    ),
                    Text("Camera", style: TextStyleCore.font18BlackWeight400),
                  ],
                ),
              ),
              SizedBox(
                height: 80.h,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final temp = await controller.galleryPicker();
                        if (temp != null) {
                          controller.imageFile.value = temp;
                          if(context.mounted){
                            Navigator.pop(context);
                          }

                        }
                      },
                      icon: Icon(
                        Icons.photo,
                        color: ColorsCore.terracottaColor,
                      ),
                    ),
                    Text("Gallery", style: TextStyleCore.font18BlackWeight400),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
