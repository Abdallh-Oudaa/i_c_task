import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:i_c_task/modules/profile/conteroller/order_contraoller.dart';
import 'package:i_c_task/modules/profile/views/local_widgets/order_item.dart';

import '../../../core/constants/text_style_core.dart';

class OrdersScreen extends StatefulWidget {

 const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final controller = Get.find<OrderController>();
@override
  void initState() {
    super.initState();

    controller.getOrders();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Orders", style: TextStyleCore.font25SalmonBold.copyWith(fontWeight: FontWeight.w400)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  OrderItem(ordersDataClass: controller.orders[index]),
              itemCount: controller.orders.length,
            ),
          ),
        ],
      ),
    );
  }
}
