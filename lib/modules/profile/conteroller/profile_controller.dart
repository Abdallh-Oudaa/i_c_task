import 'package:get/get.dart';
import 'package:i_c_task/data/model/user_model.dart';

import '../../../data/repository/repository_contract.dart';

class ProfileController extends GetxController {
  Rxn<UserModel> user = Rxn<UserModel>();
  RxString exception="".obs;
  final RepositoryContract repositoryContract;

  ProfileController(this.repositoryContract);
  getUser() async {
    try {
      var response = await repositoryContract.getUserFromFireStore();
      user.value = response;
    } catch (e) {
      exception.value=e.toString();
    }
  }
}
