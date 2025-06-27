import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:i_c_task/data/model/orders_data_class.dart';
import 'package:i_c_task/data/repository/repository_contract.dart';

class OrderController extends GetxController{
  final RepositoryContract repositoryContract;
  List<OrdersDataClass> orders=[];
  OrderController(this.repositoryContract);
   getOrders(){
     final response=repositoryContract.getOrders();
     orders=response;
   }

}