import 'package:get/get.dart';
import 'package:i_c_task/modules/profile/conteroller/gallery_controller.dart';

class GalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GalleryController>(() => GalleryController(),);
  }
}