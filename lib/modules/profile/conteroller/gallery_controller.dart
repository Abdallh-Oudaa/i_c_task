import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GalleryController extends GetxController{
  Rx<File?> imageFile=Rx<File?>(null);
  @override
  void onInit() {
    loadImagePath();
    super.onInit();
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