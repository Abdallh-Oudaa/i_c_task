import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_c_task/data/model/orders_data_class.dart';

import '../../../../core/constants/colors_core.dart';
import '../../../../core/constants/text_style_core.dart';

class OrderItem extends StatelessWidget {
  final OrdersDataClass ordersDataClass;

  const OrderItem({super.key, required this.ordersDataClass});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "order: ${ordersDataClass.orderState}",
                style: TextStyleCore.font14GrayWeight400,
              ),
              Text(
                ordersDataClass.date,
                style: TextStyleCore.font14GrayWeight400,
              ),
            ],
          ),
          Container(
            height: 2.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            color: ColorsCore.salmonColor,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  ordersDataClass.imagePath,
                  height: 60.h,
                  width: 80.w,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.w),
                width: 200.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      ordersDataClass.title,
                      style: TextStyleCore.font16whiteWeight600.copyWith(
                        color: ColorsCore.salmonColor,
                      ),
                    ),
                    Text(
                      ordersDataClass.subTitle,
                      style: TextStyleCore.font14GrayWeight400.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h,bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Text(
                              "${ordersDataClass.price}",
                              style: TextStyleCore.font14GrayWeight400.copyWith(color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              "count:${ordersDataClass.countItems}",
                              style: TextStyleCore.font14GrayWeight400.copyWith(color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Text(
                              "total:${ordersDataClass.totalPrice}",
                              style: TextStyleCore.font14GrayWeight400.copyWith(color: Colors.black),
                            ),
                          ),
                        ],
                      ),

                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.delete_outline_outlined,
                    color: ColorsCore.salmonColor,
                  ),
                  Icon(
                    Icons.add_circle,
                    color: ColorsCore.salmonColor,
                  ),
                ],
              ),


            ],
          ),

        ],
      ),
    );
  }
}
