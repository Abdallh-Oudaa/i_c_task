import 'package:get/get.dart';
import 'package:i_c_task/data/firebase_dao/data_source_contract.dart';
import 'package:i_c_task/data/firebase_dao/data_source_impl.dart';
import 'package:i_c_task/data/repository/rempository_impl.dart';
import 'package:i_c_task/data/repository/repository_contract.dart';

import 'package:i_c_task/modules/profile/conteroller/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DataSourceContract>(() => DataSourceImpl(),);
    Get.lazyPut<RepositoryContract>(() => RepositoryImpl(Get.find<DataSourceContract>()),);
    Get.lazyPut<ProfileController>(() => ProfileController(Get.find<RepositoryContract>()),);


  }

}