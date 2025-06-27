class OrdersDataClass {
  String imagePath;
  String title;
  String subTitle;
  double price;
  int countItems;
  double totalPrice;
  String orderState;
  String date;
  OrdersDataClass({
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.countItems,
    required this.totalPrice,
    required this.orderState,
    required this.date,
  });
}
