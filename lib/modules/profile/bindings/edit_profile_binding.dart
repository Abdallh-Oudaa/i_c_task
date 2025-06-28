import 'package:get/get.dart';
import 'package:i_c_task/modules/profile/conteroller/edit_profile_controller.dart';

import '../../../data/firebase_dao/data_source_contract.dart';
import '../../../data/firebase_dao/data_source_impl.dart';
import '../../../data/repository/rempository_impl.dart';
import '../../../data/repository/repository_contract.dart';

class EditProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DataSourceContract>(() => DataSourceImpl(),);
    Get.lazyPut<RepositoryContract>(() => RepositoryImpl(Get.find<DataSourceContract>()),);
    Get.lazyPut<EditProfileController>(() => EditProfileController(Get.find<RepositoryContract>()),);
  }

}