import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:i_c_task/data/repository/repository_contract.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes.dart';

class EditProfileController extends GetxController {
  RepositoryContract repositoryContract;

  RxString error = "".obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Rx<File?> imageFile=Rx<File?>(null);
  @override
  void onInit() {
    loadImagePath();
    super.onInit();
  }
  EditProfileController(this.repositoryContract);
  updateUser() async {
    if (formKey.currentState!.validate()) {
      try {
        await repositoryContract.updateUser(
          nameController.text,
          emailController.text,
        );
        Get.toNamed(AppRoutes.profilePage,arguments:imageFile.value );
        nameController.clear();
        emailController.clear();
      } catch (e) {
        error.value = e.toString();
      }
    }
  }

  Future<File?> galleryPicker() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    PermissionStatus status;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        status = await Permission.storage.request();
      } else {
        status = await Permission.photos.request();
      }
    } else {
      status = await Permission.phone.request();
    }
    if (status.isGranted) {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        saveImagePath(image.path);
        //  imageFile.value=File(image.path);

        return File(image.path);
      }
    }


      return null;
  }
  Future<void> saveImagePath(String path)async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.setString("path", path);
  }
  Future<void> loadImagePath()async{
    final prefs=await SharedPreferences.getInstance();
  String? path=prefs.getString("path");
  if(path!=null){
    imageFile.value=File(path);
  }
  }
 Future<File?> cameraPicker()async{
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {


      return File(image.path);
    }
    return null;
  }
}
