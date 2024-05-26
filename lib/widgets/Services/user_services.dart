import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/users_model.dart';

class UserServices {
  /// create user
  Future createUser(UsersModel userModel) async {
    return await FirebaseFirestore.instance
        .collection("User")
        .doc(userModel.cid.toString())
        .set(userModel.toJson());
  }

  /// Fetch Users Record
  Stream<UsersModel> fetchUserRecord(String customerID) {
    return FirebaseFirestore.instance
        .collection("User")
        .doc(customerID)
        .snapshots()
        .map((userData) =>
        UsersModel.fromJson(userData.data() as Map<String, dynamic>));
  }


  ///  Book Vehicle
  Future bookVehicle(UsersModel userModel) async {
    return await FirebaseFirestore.instance
        .collection("Booked Vehicle")
        .doc(userModel.cid.toString())
        .set(userModel.toJson());
  }
}
