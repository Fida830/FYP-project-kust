import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/admin_model.dart';


class AdminServices {
  /// create Admin
  Future createUser(AdminModel userModel) async {
    return await FirebaseFirestore.instance
        .collection("Admin")
        .doc(userModel.oid.toString())
        .set(userModel.toJson(userModel.oid.toString()));
  }

  /// Fetch Admin Record
  Stream<AdminModel> fetchUserRecord(String ownerID) {
    return FirebaseFirestore.instance
        .collection("Admin")
        .doc(ownerID)
        .snapshots()
        .map((userData) =>
        AdminModel.fromJson(userData.data() as Map<String, dynamic>));
  }
}
