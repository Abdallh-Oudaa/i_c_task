import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_c_task/data/firebase_dao/data_source_contract.dart';
import 'package:i_c_task/data/model/orders_data_class.dart';
import 'package:i_c_task/data/model/user_model.dart';

class DataSourceImpl extends DataSourceContract {
  CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("users")
        .withConverter(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (user, options) => user.toJson(),
        );
  }

  @override
  Future<UserModel?> getUserFromFireStore() async {
    var db = await getUserCollection().get();

    if (db.docs.isNotEmpty) {
      return db.docs.first.data();
    }
    return null;
  }

  @override
  Future<void> updateUser(String name, String email) async {
    // document id here should takes from firebase auth if we use it
    String docId="SJAENJdcvBVGbl3oI8Jj";


    var db = await getUserCollection().doc(docId).update({
      "name": name,
      "email": email,
    });
  }

  @override
  List<OrdersDataClass> getOrders() {
    return [
      OrdersDataClass(
        imagePath: "assets/images/serenity_nightstand.jpg",
        title: "serenity nightstand",
        subTitle:
            "a room in a house or accommodation, primarily used for sleeping",
        price: 4.5,
        countItems: 2,
        totalPrice: 9,
        orderState: "canceled",
        date: "12 may",
      ),
      OrdersDataClass(
        imagePath: "assets/images/bedroom_dresser.png",
        title: "blue table lamp",
        subTitle:
            "a room in a house or accommodation, primarily used for sleeping",
        price: 4.5,
        countItems: 2,
        totalPrice: 9,
        orderState: "Delivered",
        date: "12 may",
      ),
      OrdersDataClass(
        imagePath: "assets/images/table_lamp.png",
        title: "bedroom dresser",
        subTitle:
            "a room in a house or accommodation, primarily used for sleeping. ",
        price: 4.5,
        countItems: 2,
        totalPrice: 9,
        orderState: "Delivered",
        date: "12 may",
      ),
      OrdersDataClass(
        imagePath: "assets/images/bed.png",
        title: "green bed",
        subTitle:
            "a room in a house or accommodation, primarily used for sleeping ",
        price: 4.5,
        countItems: 5,
        totalPrice: 9,
        orderState: "canceled",
        date: "12 may",
      ),
      OrdersDataClass(
        imagePath: "assets/images/bed.png",
        title: "serenity nightstand",
        subTitle:
            "a room in a house or accommodation, primarily used for sleeping",
        price: 10,
        countItems: 1,
        totalPrice: 9,
        orderState: "Delivered",
        date: "1 may",
      ),
      OrdersDataClass(
        imagePath: "assets/images/bed.png",
        title: "serenity nightstand",
        subTitle:
            "a room in a house or accommodation, primarily used for sleeping ",
        price: 4.5,
        countItems: 1,
        totalPrice: 9,
        orderState: "canceled",
        date: "16 may",
      ),
    ];
  }
}
