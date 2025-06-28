import 'package:i_c_task/data/firebase_dao/data_source_contract.dart';
import 'package:i_c_task/data/model/orders_data_class.dart';
import 'package:i_c_task/data/model/user_model.dart';
import 'package:i_c_task/data/repository/repository_contract.dart';

class RepositoryImpl extends RepositoryContract{
  DataSourceContract dataSourceContract;
  RepositoryImpl(this.dataSourceContract);
  @override
  List<OrdersDataClass> getOrders() {
    return dataSourceContract.getOrders();
  }

  @override
  Future<UserModel?> getUserFromFireStore() {
    return dataSourceContract.getUserFromFireStore();
  }

  @override
  Future<void> updateUser(String name, String email) {
  return dataSourceContract.updateUser(name, email);
  }

}