import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:i_c_task/core/constants/text_style_core.dart';

import 'package:i_c_task/modules/profile/conteroller/profile_controller.dart';

import 'package:i_c_task/routes.dart';

import '../../../core/constants/colors_core.dart';
import '../../../core/constants/size_box_core.dart';
import '../../../core/shared_widgets/circle_image_widget.dart';
import '../../../core/shared_widgets/name_and_icon_widget.dart';
import '../../../core/shared_widgets/show_text_and_con_widget.dart';

class ProfileScreen extends StatefulWidget {

  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.find<ProfileController>();
  @override
  void initState() {
    controller.getUser();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("My Profile", style: TextStyleCore.font25SalmonBold),

                Obx(() {
                  final user = controller.user.value;
                  final error = controller.exception.value;

                  if (user != null) {
                    return Column(
                      children: [
                        CircleImageWidget(
                          imagePath: "assets/images/onboardingImage.jpg",
                        ),

                        ShowTextAndIconWidget(
                          containerColor: ColorsCore.salmonColor,
                          widgets: [
                            Text(
                              "name: ",
                              style: TextStyleCore.font18BlackWeight400
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${user.name}",
                              style: TextStyleCore.font18BlackWeight400,
                            ),
                          ],
                        ),

                        ShowTextAndIconWidget(
                          containerColor: ColorsCore.salmonColor,
                          widgets: [
                            Text(
                              "email: ",
                              style: TextStyleCore.font18BlackWeight400
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${user.email}",
                              style: TextStyleCore.font18BlackWeight400,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  if (error.isNotEmpty) {
                    return Center(
                      child: Text(
                        error,
                        style: TextStyleCore.font18BlackWeight400,
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),

                ShowTextAndIconWidget(
                  containerColor: ColorsCore.terracottaColor,
                  height: 60,
                  widgets: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.editPage);
                        },
                        child: NameAndIconWidget(
                          name: "Edit Profile",
                          icon: Icons.person,
                        ),
                      ),
                    ),
                    horizontalSize(60),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.orderPage);
                        },
                        child: NameAndIconWidget(
                          name: "Orders",
                          icon: Icons.line_weight_sharp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
