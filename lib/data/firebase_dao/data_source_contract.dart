import 'package:i_c_task/data/model/orders_data_class.dart';

import '../model/user_model.dart';

abstract class DataSourceContract{
  Future<UserModel?> getUserFromFireStore();
  Future<void> updateUser(String name,String email);
  List<OrdersDataClass> getOrders();
}