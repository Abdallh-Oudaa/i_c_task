import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:i_c_task/data/repository/repository_contract.dart';

import '../../../routes.dart';

class EditProfileController extends GetxController {
  RepositoryContract repositoryContract;

  RxString error = "".obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  EditProfileController(this.repositoryContract);
  updateUser() async {
    if (formKey.currentState!.validate()) {
      try {
        await repositoryContract.updateUser(
          nameController.text,
          emailController.text,
        );
        Get.toNamed(AppRoutes.profilePage /*arguments:imageFile.value*/);
        nameController.clear();
        emailController.clear();
      } catch (e) {
        error.value = e.toString();
      }
    }
  }
}
