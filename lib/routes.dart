import 'package:get/get.dart';
import 'package:i_c_task/modules/profile/bindings/orders_binding.dart';
import 'package:i_c_task/modules/profile/bindings/profile_bindings.dart';
import 'package:i_c_task/modules/profile/views/edit_profile.dart';
import 'package:i_c_task/modules/profile/views/orders_screen.dart';
import 'package:i_c_task/modules/profile/views/profile_screen.dart';

class AppRoutes{
  static const profilePage="/";
  static const editPage="/edit_page";
  static const orderPage="/order_page";
  static final routes=[
  GetPage(name: profilePage, page:() => ProfileScreen(),binding: ProfileBinding()),
    GetPage(name: editPage, page:() => EditProfile(),),
    GetPage(name: orderPage, page:() => OrdersScreen(),binding: OrdersBinding()),
  ];
}