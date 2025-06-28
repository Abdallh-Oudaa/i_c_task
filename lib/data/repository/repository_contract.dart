import '../model/orders_data_class.dart';
import '../model/user_model.dart';

abstract class RepositoryContract{
  Future<UserModel?> getUserFromFireStore();
  Future<void> updateUser(String name,String email);
  List<OrdersDataClass> getOrders();
}